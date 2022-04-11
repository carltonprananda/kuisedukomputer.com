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

  static String hasilsaya() {
    if (hasilpersenbenar == 100) {
      return 'Selamat telah menjawab benar semua';
    } else if (hasilpersenbenar < 100 || hasilpersenbenar > 75) {
      return 'Lebih teliti dalam menjawab';
    } else if (hasilpersenbenar < 75) {
      return 'Perlu banyak belajar kembali';
    }
  }

  static double hasilpersensalah = persensalah().toDouble();
  //final soundresult = AudioCache();

  @override
  void initState() {
    //soundresult.play('audios/level-win.wav');
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
      return (persentasesalah / 10) * 100;
    }

    print("persen benar" + persenbenar().toString());
    hasilpersensalah = persensalah().toDouble();
    print("hasil persen salah" + hasilpersensalah.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.mode,
            style: GoogleFonts.notoSans(
                fontWeight: FontWeight.bold, color: Colors.blue)),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body:
          Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        CircularPercentIndicator(
          radius: 60,
          percent: widget.score / 100,
          lineWidth: 10,
          animation: true,
          header: Text('Skor Anda', style: GoogleFonts.notoSans(fontSize: 24)),
          center: Text(
            '${widget.score}',
            style: TextStyle(fontSize: 32),
          ),
          linearGradient: LinearGradient(
            colors: [Colors.green, Colors.blue],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: CircularPercentIndicator(
                radius: 40,
                percent: hasilpersenbenar / 100,
                lineWidth: 10,
                animation: true,
                header:
                    Text("Benar", style: GoogleFonts.notoSans(fontSize: 14)),
                center: Text(hasilpersenbenar.toString() + "%",
                    style: GoogleFonts.notoSans(fontSize: 14)),
                linearGradient: LinearGradient(
                  colors: [Colors.green, Colors.lightGreenAccent],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ),
            Expanded(
              child: CircularPercentIndicator(
                radius: 40,
                percent: hasilpersensalah / 100,
                lineWidth: 10,
                animation: true,
                header:
                    Text("Salah", style: GoogleFonts.notoSans(fontSize: 14)),
                center: Text(hasilpersensalah.toString() + "%",
                    style: GoogleFonts.notoSans(fontSize: 14)),
                linearGradient: LinearGradient(
                  colors: [Colors.red, Colors.redAccent],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
                child: Column(
              children: [
                Icon(Icons.timer),
                Text('Waktu Menjawab'),
                Text('${widget.answertime}'),
              ],
            )),
            Expanded(
                child: Column(
              children: [
                Icon(Icons.check),
                Text('Jumlah Benar'),
                Text('${widget.jawabanbenar}'),
              ],
            )),
            Expanded(
                child: Column(
              children: [
                Icon(Icons.close),
                Text('Jumlah Salah'),
                Text('${widget.jawabansalah}'),
              ],
            )),
          ],
        ),
        Text(hasilsaya()),
        Text(
          "Bagaimana Hasil Kami " + (name ?? '') + " ?",
          textAlign: TextAlign.center,
        ),
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
        Text(
          "Apakah " + (name ?? '') + " sudah paham setelah menjawab quiz ini?",
          textAlign: TextAlign.center,
        ),
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
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: Colors.transparent,
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GameplayScreen(
                                pertanyaan: widget.pertanyaan,
                                gamescore: 0,
                                totalbenar: 0,
                                totalsalah: 0,
                                qindex: 0,
                                timerplus: 0,
                                stage: widget.mode,
                              )));
                },
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.refresh,
                        size: MediaQuery.of(context).size.width * 0.12,
                        color: Colors.blue
                      ),
                      Text(
                        "Ulang",
                        style: GoogleFonts.notoSans(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          color: Colors.blue
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: Colors.transparent,
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
                    bool result =
                        await HighScoreServices.addHighscore(highScore);
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
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.add,
                        size: MediaQuery.of(context).size.width * 0.12,
                        color: Colors.blue
                      ),
                      Text(
                        "Submit",
                        style: GoogleFonts.notoSans(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          color: Colors.blue
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: Colors.transparent,

                ),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return MenuPage();
                  }));
                },
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.arrow_back,
                        size: MediaQuery.of(context).size.width * 0.12,
                        color: Colors.blue
                      ),
                      Text(
                        "Menu",
                        style: GoogleFonts.notoSans(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          color: Colors.blue
                        ),
                      )
                    ],
                  ),
                ),
              ),
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
      appBar: AppBar(
          title: Text("Hasil Akhir"),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent),
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
