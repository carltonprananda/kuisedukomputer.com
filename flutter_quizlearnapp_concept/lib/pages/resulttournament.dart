part of 'pages.dart';

class ResultTour extends StatefulWidget {
  ResultTour(
      {Key key,
      this.score,
      this.jawabanbenar,
      this.jawabansalah,
      this.answertime,
      this.stage,
      this.user,
      this.mode,
      this.roundscore})
      : super(key: key);

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
      if (widget.stage == 1) {
        return (persentasebenar / 4) * 100;
      }
      if (widget.stage == 2) {
        return (persentasebenar / 8) * 100;
      }
      if (widget.stage == 3) {
        return (persentasebenar / 10) * 100;
      }
    }

    hasilpersenbenar = persenbenar().toDouble();
    persentasesalah = widget.jawabansalah;
    double persensalah() {
      if (widget.stage == 1) {
        return (persentasesalah / 4) * 100;
      }
      if (widget.stage == 2) {
        return (persentasesalah / 8) * 100;
      }
      if (widget.stage == 3) {
        return (persentasesalah / 10) * 100;
      }
    }

    hasilpersensalah = persensalah().toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text(widget.mode,
            style: GoogleFonts.notoSans(
                fontWeight: FontWeight.bold, color: Colors.green)),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,),
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: <
          Widget>[
                CircularPercentIndicator(
              radius: 60,
              percent: widget.score / 100,
              lineWidth: 10,
              animation: true,
              header: Text('Skor Anda', style: GoogleFonts.notoSans(fontSize: 24)),
              center: Text('${widget.score}', style: TextStyle(fontSize: 32),),
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
              header: Text("Benar", style: GoogleFonts.notoSans(fontSize: 14)),
              center: Text(hasilpersenbenar.toString() + "%", style: GoogleFonts.notoSans(fontSize: 14)),
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
              header: Text("Salah", style: GoogleFonts.notoSans(fontSize: 14)),
              center: Text(hasilpersensalah.toString() + "%", style: GoogleFonts.notoSans(fontSize: 14)),
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
                          widget.roundscore);
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
                          widget.roundscore);
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
                                stage: 'Komputer Dasar - Konfigurasi Komputer',
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
                          widget.roundscore);
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
                                stage: "Postest 1",
                              )));
                    }
                  },
                  child: Text("Postest 1")),
            ),
            Expanded(
              child: ElevatedButton(
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
                          widget.roundscore);
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
                                stage: "Postest 2",
                              )));
                    }
                  },
                  child: Text("Postest 2")),
            ),
            Expanded(
              child: ElevatedButton(
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
                          widget.roundscore);
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
                                pertanyaan: tourstage133,
                                gamescore: widget.score,
                                totalbenar: 0,
                                totalsalah: 0,
                                qindex: 0,
                                timerplus: 0,
                                round: 3,
                                roundscore: 0,
                                stage: "Postest 3",
                              )));
                    }
                  },
                  child: Text("Postest 3")),
            ),
          ] else if (widget.stage == 3) ...[
            Expanded(
                child: ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(40)),
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
                      widget.roundscore);
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
            ))
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
    this.mode, this.roundscore,
    
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
  _ResultTour2State createState() => _ResultTour2State();
}

class _ResultTour2State extends State<ResultTour2> {
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
      if (widget.stage == 1) {
        return (persentasebenar / 4) * 100;
      }
      if (widget.stage == 2) {
        return (persentasebenar / 8) * 100;
      }
      if (widget.stage == 2) {
        return (persentasebenar / 10) * 100;
      }
    }

    hasilpersenbenar = persenbenar().toDouble();
    persentasesalah = widget.jawabansalah;
    double persensalah() {
      if (widget.stage == 1) {
        return (persentasesalah / 4) * 100;
      }
      if (widget.stage == 2) {
        return (persentasesalah / 8) * 100;
      }
      if (widget.stage == 2) {
        return (persentasesalah / 10) * 100;
      }
    }

    hasilpersensalah = persensalah().toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text(widget.mode,
            style: GoogleFonts.notoSans(
                fontWeight: FontWeight.bold, color: Colors.green)),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,),
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: <
          Widget>[
        CircularPercentIndicator(
              radius: 60,
              percent: widget.score / 100,
              lineWidth: 10,
              animation: true,
              header: Text('Skor Anda', style: GoogleFonts.notoSans(fontSize: 24)),
              center: Text('${widget.score}', style: TextStyle(fontSize: 32),),
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
              header: Text("Benar", style: GoogleFonts.notoSans(fontSize: 14)),
              center: Text(hasilpersenbenar.toString() + "%", style: GoogleFonts.notoSans(fontSize: 14)),
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
              header: Text("Salah", style: GoogleFonts.notoSans(fontSize: 14)),
              center: Text(hasilpersensalah.toString() + "%", style: GoogleFonts.notoSans(fontSize: 14)),
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
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          if (widget.stage == 1) ...[
            Expanded(
              child: ElevatedButton(
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
                          widget.roundscore);
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
                          builder: (context) => Tour2Screen(
                                pertanyaan: tourstage221,
                                gamescore: widget.score,
                                totalbenar: 0,
                                totalsalah: 0,
                                qindex: 0,
                                timerplus: 0,
                                stage: 'Sistem Operasi - Windows',
                                round: 2,
                                roundscore: 0,
                              )));
                    }
                  },
                  child: Text("Windows")),
            ),
            Expanded(
              child: ElevatedButton(
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
                          widget.roundscore);
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
                          builder: (context) => Tour2Screen(
                                pertanyaan: tourstage222,
                                gamescore: 0,
                                totalbenar: widget.score,
                                totalsalah: 0,
                                qindex: 0,
                                timerplus: 0,
                                stage: 'Sistem Operasi - Mac OS',
                                round: 2,
                                roundscore: 0,
                              )));
                    }
                  },
                  child: Text("Mac OS")),
            ),
            Expanded(
              child: ElevatedButton(
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
                          widget.roundscore);
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
                          builder: (context) => Tour2Screen(
                                pertanyaan: tourstage223,
                                gamescore: 0,
                                totalbenar: widget.score,
                                totalsalah: 0,
                                qindex: 0,
                                timerplus: 0,
                                stage: 'Sistem Operasi - Windows dan Mac OS',
                                round: 2,
                                roundscore: 0,
                              )));
                    }
                  },
                  child: Text("Mix Windows Mac OS")),
            ),
          ] else if (widget.stage == 2) ...[
            Expanded(
              child: ElevatedButton(
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
                          widget.roundscore);
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
                          builder: (context) => Tour2Screen(
                                pertanyaan: tourstage231,
                                gamescore: widget.score,
                                totalbenar: 0,
                                totalsalah: 0,
                                qindex: 0,
                                timerplus: 0,
                                round: 3,
                                stage: "Postest 1",
                              )));
                    }
                  },
                  child: Text("Postest 1")),
            ),
            Expanded(
              child: ElevatedButton(
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
                          widget.roundscore);
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
                          builder: (context) => Tour2Screen(
                                pertanyaan: tourstage232,
                                gamescore: widget.score,
                                totalbenar: 0,
                                totalsalah: 0,
                                qindex: 0,
                                timerplus: 0,
                                round: 3,
                                roundscore: 0,
                                stage: "Postest 2",
                              )));
                    }
                  },
                  child: Text("Postest 2")),
            ),
          ] else if (widget.stage == 3) ...[
            Expanded(
                child: ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(40)),
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
                      widget.roundscore);
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
            ))
          ]
        ]),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => MenuPage()));
            },
            child: Text("Back")),
      ]),
    );
  }
}
