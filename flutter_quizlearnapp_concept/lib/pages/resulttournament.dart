part of 'pages.dart';

class ResultTour extends StatefulWidget {
  ResultTour({
    Key key,
    this.score,
    this.jawabanbenar,
    this.jawabansalah,
    this.answertime,
    this.stage,
    this.user,
    this.mode,
    this.roundscore
  }) : super(key: key);

  final int score;
  final int jawabanbenar;
  final int jawabansalah;
  final int answertime;
  final int stage;
  final String user;
  final String mode;
  final int roundscore;

  @override
  _ResultTourState createState() => _ResultTourState();
}

class _ResultTourState extends State<ResultTour> {
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
  static DateTime waktuselesai = DateTime.now();
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
    super.initState();
    persentasebenar = widget.jawabanbenar;
    double persenbenar() {
      return (persentasebenar / 10) * 100;
    }

    hasilpersenbenar = persenbenar();
    persentasesalah = widget.jawabansalah;
    double persensalah() {
      return (persentasesalah / 10) * 100;
    }

    hasilpersensalah = persensalah().toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text("Your Result"), automaticallyImplyLeading: false),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
          Widget>[
        Text('Skor Anda: ${widget.score}'),
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
        Text("Apakah " +
            (name ?? '') +
            " sudah paham setelah menjawab quiz ini?"),
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
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          if (widget.stage == 1) ...[
            Expanded(
              child: ElevatedButton(
                  onPressed: () async {
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
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Tour1Screen(
                                pertanyaan: tourstage121,
                                gamescore: widget.score,
                                totalbenar: 0,
                                totalsalah: 0,
                                qindex: 0,
                                timerplus: 0,
                                stage: 'Komputer Dasar - Keamanan Komputer',
                                round: 2,
                                roundscore: 0,
                              )));
                    }
                  },
                  child: Text("Keamanan Komputer")),
            ),
            Expanded(
              child: ElevatedButton(
                  onPressed: () async {
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
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Tour1Screen(
                                pertanyaan: tourstage122,
                                gamescore: 0,
                                totalbenar: widget.score,
                                totalsalah: 0,
                                qindex: 0,
                                timerplus: 0,
                                stage: 'Komputer Dasar - Keamanan Komputer',
                                round: 2,
                                roundscore: 0,
                              )));
                    }
                  },
                  child: Text("Konfigurasi Komputer")),
            ),
          ] else if (widget.stage == 2) ...[
            Expanded(
              child: ElevatedButton(
                  onPressed: () async {
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

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Tour1Screen(
                                pertanyaan: tourstage131,
                                gamescore: widget.score,
                                totalbenar: 0,
                                totalsalah: 0,
                                qindex: 0,
                                timerplus: 0,
                                round: 3,
                              )));
                    }
                  },
                  child: Text("Postest 1")),
            ),
            Expanded(
              child: ElevatedButton(
                  onPressed: () async {
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
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Tour1Screen(
                                pertanyaan: tourstage132,
                                gamescore: widget.score,
                                totalbenar: 0,
                                totalsalah: 0,
                                qindex: 0,
                                timerplus: 0,
                                round: 3,
                                roundscore: 0,
                              )));
                    }
                  },
                  child: Text("Postest 2")),
            ),
            Expanded(
              child: ElevatedButton(
                  onPressed: () async {
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
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Tour1Screen(
                              pertanyaan: tourstage133,
                              gamescore: widget.score,
                              totalbenar: 0,
                              totalsalah: 0,
                              qindex: 0,
                              timerplus: 0,
                              round: 3,
                              roundscore: 0,
                            )));
                }
                  },
                  child: Text("Postest 3")),
            ),
          ]
        ]),
        ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return MenuPage();
              }));
            },
            child: Text("Back")),
      ]),
    );
  }
}

class ResultTour2 extends StatefulWidget {
  ResultTour2({
    Key key,
    this.score,
    this.jawabanbenar,
    this.jawabansalah,
    this.answertime,
    this.stage,
    this.user,
    this.mode,
  }) : super(key: key);

  final int score;
  final int jawabanbenar;
  final int jawabansalah;
  final int answertime;
  final int stage;
  final String user;
  final String mode;

  @override
  _ResultTour2State createState() => _ResultTour2State();
}

class _ResultTour2State extends State<ResultTour2> {
  static double ratingnilai = 3, ratingkepahaman = 3;
  static int persentasebenar = 0;
  static int persenbenar() {
    return persentasebenar ~/ 5 * 100;
  }

  static double hasilpersenbenar = persenbenar().toDouble();

  static int persentasesalah = 0;
  static int persensalah() {
    return persentasebenar ~/ 5 * 100;
  }

  static double hasilpersensalah = persensalah().toDouble();

  @override
  void initState() {
    super.initState();
    persentasebenar = widget.jawabanbenar;
    int persenbenar() {
      return persentasebenar ~/ 5 * 100;
    }

    hasilpersenbenar = persenbenar().toDouble();
    persentasesalah = widget.jawabansalah;
    int persensalah() {
      return persentasesalah ~/ 5 * 100;
    }

    hasilpersensalah = persensalah().toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text("Your Result"), automaticallyImplyLeading: false),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Skor Anda: ${widget.score}'),
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
            Text("Bagaimana Hasil Kami " + widget.user + " ?"),
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
            Text("Apakah ${widget.user} sudah paham setelah menjawab quiz ini"),
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
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => GameplayScreen(
                                  pertanyaan: tourstage131,
                                  gamescore: widget.score,
                                  totalbenar: 0,
                                  totalsalah: 0,
                                  qindex: 0,
                                  timerplus: 0,
                                )));
                      },
                      child: Text("Postest 1")),
                ),
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => GameplayScreen(
                                  pertanyaan: tourstage132,
                                  gamescore: widget.score,
                                  totalbenar: 0,
                                  totalsalah: 0,
                                  qindex: 0,
                                  timerplus: 0,
                                )));
                      },
                      child: Text("Postest 2")),
                ),
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => GameplayScreen(
                                  pertanyaan: tourstage133,
                                  gamescore: widget.score,
                                  totalbenar: 0,
                                  totalsalah: 0,
                                  qindex: 0,
                                  timerplus: 0,
                                )));
                      },
                      child: Text("Postest 3")),
                ),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MenuPage()));
                },
                child: Text("Back")),
          ]),
    );
  }
}
