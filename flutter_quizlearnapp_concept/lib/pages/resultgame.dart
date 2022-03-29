part of 'pages.dart';

class ResultGame extends StatefulWidget {
  ResultGame({
    Key key,
    this.score,
    this.jawabanbenar,
    this.jawabansalah,
    this.answertime,
    this.user,
    this.mode,
    this.stage,
    this.pertanyaan,
  }) : super(key: key);

  final int score;
  final int jawabanbenar;
  final int jawabansalah;
  final int answertime;
  final int stage;
  final String user;
  final String mode;
  final List<Question> pertanyaan;

  @override
  _ResultGameState createState() => _ResultGameState();
}

class _ResultGameState extends State<ResultGame> {
  String name;
  User auth = FirebaseAuth.instance.currentUser;
  CollectionReference<Map<String, dynamic>> userCollection =
      FirebaseFirestore.instance.collection("users");

    void getUserUpdate() async {
    userCollection.doc(auth.uid).snapshots().listen((event) {
      name = event.data()['name'];
      print("nama : " + name);
      setState(() {});
    });
    }

  List<Question> _pertanyaan = questiontype1;
  static double ratingnilai = 3, ratingkepahaman = 3;
  static int persentasebenar;
  static DateTime waktuselesai = DateTime.now().toLocal();
  static int persenbenar() {
    return (persentasebenar ~/ 5) * 100;
  }

  static double hasilpersenbenar = persenbenar().toDouble();

  static int persentasesalah;
  static int persensalah() {
    return (persentasebenar ~/ 5) * 100;
  }

  static double hasilpersensalah = persensalah().toDouble();

  @override
  void initState() {
    getUserUpdate();
    super.initState();
    persentasebenar = widget.jawabanbenar;
    double persenbenar() {
      return (persentasebenar / 10) * 100;
    }
    print("persen benar" + persenbenar().toString());
    hasilpersenbenar = persenbenar().toDouble();
    print("hasil persen benar" + hasilpersenbenar.toString());
    persentasesalah = widget.jawabansalah;
    double persensalah() {
      return (persentasesalah / 10)  * 100;
    }
    print("persen benar" + persenbenar().toString());
    hasilpersensalah = persensalah().toDouble();
    print("hasil persen salah" + hasilpersensalah.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text(widget.mode), automaticallyImplyLeading: false),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              child: ListTile(
                title: Text('Skor Anda'),
                trailing: Text('${widget.score}'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.timer),
                title: Text('Waktu menjawab'),
                trailing: Text('${widget.answertime}'),
              ),
            ),
            Card(
              child: ListTile(
                  leading: Icon(Icons.check),
                  title: Text('Benar'),
                  trailing: Text(hasilpersenbenar.toString() + "%"),
                  subtitle: Text('${widget.jawabanbenar}')),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.close),
                title: Text('Salah'),
                trailing: Text(hasilpersensalah.toString() + "%"),
                subtitle: Text('${widget.jawabansalah}'),
              ),
            ),
            Text("Bagaimana Hasil Kami " + (name ?? '') + " ?"),
            RatingBar.builder(
              initialRating: ratingnilai,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
              itemSize: 48,
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.orangeAccent,
              ),
              onRatingUpdate: (rating) {
                ratingnilai = rating;
              },
            ),
            Text("Apakah " + (name ?? '') + " sudah paham setelah menjawab quiz ini?"),
            RatingBar.builder(
              initialRating: ratingkepahaman,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
              itemSize: 48,
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.orangeAccent,
              ),
              onRatingUpdate: (rating) {
                ratingkepahaman = rating;
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(40)
              ),
              onPressed: () async {
                waktuselesai = DateTime.now().toLocal();
                if (ratingnilai == 0 || ratingkepahaman == 0) {
                  Fluttertoast.showToast(
                      msg: "Mohon berikan nilai :-)",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER_RIGHT,
                      backgroundColor: Colors.black,
                      textColor: Colors.yellow,
                      fontSize: 16.0);
                } else {
                  HighScore highScore = HighScore(
                      "",
                      widget.score,
                      ratingnilai,
                      ratingkepahaman,
                      name,
                      waktuselesai.toString(),
                      widget.stage.toString(),
                      widget.mode,
                      widget.score);
                  bool result = await HighScoreServices.addHighscore(highScore);
                  if (result == true) {
                    Fluttertoast.showToast(
                        msg: "Rating penilaian dan skor telah disubmit :-)",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER_RIGHT,
                        backgroundColor: Colors.black,
                        textColor: Colors.yellow,
                        fontSize: 16.0);
                  } else {
                    Fluttertoast.showToast(
                        msg: "Gagal :-(",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER_RIGHT,
                        backgroundColor: Colors.red,
                        textColor: Colors.yellow,
                        fontSize: 16.0);
                  }
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MenuPage()));
                }
              },
              child: Text("SUBMIT"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) => GameplayScreen(
                                  pertanyaan: widget.pertanyaan,
                                  gamescore: 0,
                                  totalbenar: 0,
                                  totalsalah: 0,
                                  qindex: 0,
                                  timerplus: 0,
                                )));
                      },
                      child: Text("Ulang")),
                ),
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return MenuPage();
                        }));
                      },
                      child: Text("Back")),
                ),
              ],
            ),
          ]),
    );
  }
}

class ResultGame2 extends StatefulWidget {
  const ResultGame2({
    Key key,
    this.score2,
    this.jawabanbenar2,
    this.jawabansalah2,
    this.answertime2,
  }) : super(key: key);

  @override
  _ResultGame2State createState() => _ResultGame2State();

  final int score2;
  final int jawabanbenar2;
  final int jawabansalah2;
  final int answertime2;
}

class _ResultGame2State extends State<ResultGame2> {
  static int persentasebenar = 0;
  static int persenbenar() {
    return persentasebenar ~/ 5 * 100;
  }

  static double hasilpersenbenar = persenbenar() as double;

  static int persentasesalah = 0;
  static int persensalah() {
    return persentasebenar ~/ 5 * 100;
  }

  static double hasilpersensalah = persensalah() as double;

  @override
  void initState() {
    super.initState();
    persentasebenar = widget.jawabanbenar2;
    int persenbenar() {
      return persentasebenar ~/ 5 * 100;
    }

    hasilpersenbenar = persenbenar() as double;
    persentasesalah = widget.jawabansalah2;
    int persensalah() {
      return persentasesalah ~/ 5 * 100;
    }

    hasilpersensalah = persensalah() as double;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text("Your Result"), automaticallyImplyLeading: false),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Skor Anda: ${widget.score2}'),
            Card(
              child: ListTile(
                leading: Icon(Icons.timer),
                title: Text('Waktu menjawab'),
                trailing: Text('${widget.answertime2}'),
              ),
            ),
            Card(
              child: ListTile(
                  leading: Icon(Icons.check),
                  title: Text('Benar'),
                  trailing: Text(hasilpersenbenar.toString() + "%"),
                  subtitle: Text('${widget.jawabanbenar2}')),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.close),
                title: Text('Salah'),
                trailing: Text('${widget.jawabansalah2}'),
              ),
            ),
            Spacer(),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => new TruefalseScreen(
                            pertanyaan: truefalse1,
                            gamescore: 0,
                            totalbenar: 0,
                            totalsalah: 0,
                            qindex: 0,
                            timerplus: 0,
                          )));
                },
                child: Text("Play Again")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => MenuPage()),
                      (Route route) => false);
                },
                child: Text("Back")),
          ]),
    );
  }
}
