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
      this.roundscore,
      this.stagemodel,
      this.pertanyaan})
      : super(key: key);

  final int score;
  final int jawabanbenar;
  final int jawabansalah;
  final int answertime;
  final int stage;
  final String user;
  final String mode;
  final int roundscore;
  final int stagemodel;
  final List<Question> pertanyaan;

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

  List<Question> _pertanyaan = tourstage111;
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
  static int _stagemodel;

  @override
  void initState() {
    getUserUpdate();
    super.initState();
    persentasebenar = widget.jawabanbenar;
    double persenbenar() {
      if (widget.stage == 1) {
        return (persentasebenar / 4) * 100;
      }
      return (persentasebenar / 10) * 100;
    }

    hasilpersenbenar = persenbenar().toDouble();
    persentasesalah = widget.jawabansalah;
    double persensalah() {
      if (widget.stage == 1) {
        return (persentasesalah / 4) * 100;
      }
      return (persentasesalah / 10) * 100;
    }

    hasilpersensalah = persensalah().toDouble();
  }

  @override
  Widget build(BuildContext context) {
    _stagemodel = widget.stagemodel;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.mode,
            style: GoogleFonts.notoSans(
                fontWeight: FontWeight.bold, color: Colors.green)),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body:
          Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        if (_stagemodel != 0) ...[
          CircularPercentIndicator(
            radius: 60,
            percent: widget.roundscore / 100,
            lineWidth: 10,
            animation: true,
            header:
                Text('Skor Anda', style: GoogleFonts.notoSans(fontSize: 24)),
            center: Text(
              '${widget.roundscore}',
              style: TextStyle(fontSize: 32),
            ),
            footer: Text(
              '${widget.score}',
              style: TextStyle(fontSize: 24),
            ),
            linearGradient: LinearGradient(
              colors: [Colors.green, Colors.blue],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ] else if (_stagemodel == 0) ...[
          CircularPercentIndicator(
            radius: 60,
            percent: widget.score / 100,
            lineWidth: 10,
            animation: true,
            header:
                Text('Skor Anda', style: GoogleFonts.notoSans(fontSize: 24)),
            center: Text(
              '${widget.score}',
              style: GoogleFonts.notoSans(fontSize: 32),
            ),
            linearGradient: LinearGradient(
              colors: [Colors.green, Colors.blue],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ],
        TBSResult(
            hasilpersenbenar: hasilpersenbenar,
            hasilpersensalah: hasilpersensalah,
            answertime: widget.answertime,
            jawabanbenar: widget.jawabanbenar,
            jawabansalah: widget.jawabansalah),
        RatingResult(
          kepahamanrating: ratingkepahaman,
          nilairating: ratingnilai,
          name: name,
        ),
        if (_stagemodel != 0) ...[
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                if (_stagemodel == 1) ...[
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
                                  await HighScoreServices.addHighscore(
                                      highScore);
                              if (result == true) {
                                Fluttertoast.showToast(
                                    msg:
                                        "Rating penilaian dan skor telah disubmit :-)",
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
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Tour1Screen(
                                            pertanyaan: tourstage121,
                                            gamescore: widget.score,
                                            totalbenar: 0,
                                            totalsalah: 0,
                                            qindex: 0,
                                            timerplus: 0,
                                            stage:
                                                'Komputer Dasar - Keamanan Komputer',
                                            round: 2,
                                            roundscore: 0,
                                            stagemodel: 1,
                                          )));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            primary: Colors.transparent,
                          ),
                          child: Text(
                            "Keamanan Komputer",
                            style: GoogleFonts.notoSans(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.04,
                                color: Colors.green),
                          )),
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
                                  await HighScoreServices.addHighscore(
                                      highScore);
                              if (result == true) {
                                Fluttertoast.showToast(
                                    msg:
                                        "Rating penilaian dan skor telah disubmit :-)",
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
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Tour1Screen(
                                            pertanyaan: tourstage122,
                                            gamescore: 0,
                                            totalbenar: widget.score,
                                            totalsalah: 0,
                                            qindex: 0,
                                            timerplus: 0,
                                            stage:
                                                'Komputer Dasar - Konfigurasi Komputer',
                                            round: 2,
                                            roundscore: 0,
                                            stagemodel: 1,
                                          )));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            primary: Colors.transparent,
                          ),
                          child: Text(
                            "Konfigurasi Komputer",
                            style: GoogleFonts.notoSans(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.04,
                                color: Colors.green),
                          )),
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
                                  await HighScoreServices.addHighscore(
                                      highScore);
                              if (result == true) {
                                Fluttertoast.showToast(
                                    msg:
                                        "Rating penilaian dan skor telah disubmit :-)",
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

                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Tour1Screen(
                                            pertanyaan: tourstage131,
                                            gamescore: widget.score,
                                            totalbenar: 0,
                                            totalsalah: 0,
                                            qindex: 0,
                                            timerplus: 0,
                                            round: 3,
                                            stage: "Komputer Dasar - Postest 1",
                                            stagemodel: 1,
                                          )));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            primary: Colors.transparent,
                          ),
                          child: Text(
                            "Postest 1",
                            style: GoogleFonts.notoSans(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.04,
                                color: Colors.green),
                          )),
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
                                  msg:
                                      "Rating penilaian dan skor telah disubmit :-)",
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
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Tour1Screen(
                                          pertanyaan: tourstage132,
                                          gamescore: widget.score,
                                          totalbenar: 0,
                                          totalsalah: 0,
                                          qindex: 0,
                                          timerplus: 0,
                                          round: 3,
                                          roundscore: 0,
                                          stage: "Komputer Dasar - Postest 2",
                                          stagemodel: 1,
                                        )));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: Colors.transparent,
                        ),
                        child: Text(
                          "Postest 2",
                          style: GoogleFonts.notoSans(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                              color: Colors.green),
                        ),
                      ),
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
                                  await HighScoreServices.addHighscore(
                                      highScore);
                              if (result == true) {
                                Fluttertoast.showToast(
                                    msg:
                                        "Rating penilaian dan skor telah disubmit :-)",
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
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Tour1Screen(
                                            pertanyaan: tourstage133,
                                            gamescore: widget.score,
                                            totalbenar: 0,
                                            totalsalah: 0,
                                            qindex: 0,
                                            timerplus: 0,
                                            round: 3,
                                            roundscore: 0,
                                            stage: "Komputer Dasar - Postest 3",
                                            stagemodel: 1,
                                          )));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            primary: Colors.transparent,
                          ),
                          child: Text(
                            "Postest 3",
                            style: GoogleFonts.notoSans(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.04,
                                color: Colors.green),
                          )),
                    ),
                  ] else if (widget.stage == 3) ...[
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
                              widget.roundscore);
                          bool result =
                              await HighScoreServices.addHighscore(highScore);
                          if (result == true) {
                            Fluttertoast.showToast(
                                msg:
                                    "Rating penilaian dan skor telah disubmit :-)",
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
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MenuPage()));
                        }
                      },
                      child: Text(
                        "Submit",
                        style: GoogleFonts.notoSans(
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            color: Colors.green),
                      ),
                    ))
                  ]
                ] else if (_stagemodel == 2) ...[
                  if (widget.stage == 1) ...[
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
                                  widget.roundscore);
                              bool result =
                                  await HighScoreServices.addHighscore(
                                      highScore);
                              if (result == true) {
                                Fluttertoast.showToast(
                                    msg:
                                        "Rating penilaian dan skor telah disubmit :-)",
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
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Tour1Screen(
                                            pertanyaan: tourstage221,
                                            gamescore: widget.score,
                                            totalbenar: 0,
                                            totalsalah: 0,
                                            qindex: 0,
                                            timerplus: 0,
                                            stage: 'Sistem Operasi - Windows',
                                            round: 2,
                                            roundscore: 0,
                                            stagemodel: 2,
                                          )));
                            }
                          },
                          child: Text(
                            "Windows",
                            style: GoogleFonts.notoSans(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.04,
                                color: Colors.green),
                          )),
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
                                  widget.roundscore);
                              bool result =
                                  await HighScoreServices.addHighscore(
                                      highScore);
                              if (result == true) {
                                Fluttertoast.showToast(
                                    msg:
                                        "Rating penilaian dan skor telah disubmit :-)",
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
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Tour1Screen(
                                            pertanyaan: tourstage222,
                                            gamescore: 0,
                                            totalbenar: widget.score,
                                            totalsalah: 0,
                                            qindex: 0,
                                            timerplus: 0,
                                            stage: 'Sistem Operasi - Mac OS',
                                            round: 2,
                                            roundscore: 0,
                                            stagemodel: 2,
                                          )));
                            }
                          },
                          child: Text(
                            "Mac OS",
                            style: GoogleFonts.notoSans(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.04,
                                color: Colors.green),
                          )),
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
                                  widget.roundscore);
                              bool result =
                                  await HighScoreServices.addHighscore(
                                      highScore);
                              if (result == true) {
                                Fluttertoast.showToast(
                                    msg:
                                        "Rating penilaian dan skor telah disubmit :-)",
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
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Tour1Screen(
                                            pertanyaan: tourstage223,
                                            gamescore: 0,
                                            totalbenar: widget.score,
                                            totalsalah: 0,
                                            qindex: 0,
                                            timerplus: 0,
                                            stage:
                                                'Sistem Operasi - Windows dan Mac OS',
                                            round: 2,
                                            roundscore: 0,
                                            stagemodel: 2,
                                          )));
                            }
                          },
                          child: Text(
                            "Mix Windows Mac OS",
                            style: GoogleFonts.notoSans(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.04,
                                color: Colors.green),
                          )),
                    ),
                  ] else if (widget.stage == 2) ...[
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
                                  widget.roundscore);
                              bool result =
                                  await HighScoreServices.addHighscore(
                                      highScore);
                              if (result == true) {
                                Fluttertoast.showToast(
                                    msg:
                                        "Rating penilaian dan skor telah disubmit :-)",
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

                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Tour1Screen(
                                            pertanyaan: tourstage231,
                                            gamescore: widget.score,
                                            totalbenar: 0,
                                            totalsalah: 0,
                                            qindex: 0,
                                            timerplus: 0,
                                            round: 3,
                                            stage: "Sistem Operasi -Postest 1",
                                            stagemodel: 2,
                                          )));
                            }
                          },
                          child: Text(
                            "Postest 1",
                            style: GoogleFonts.notoSans(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.04,
                                color: Colors.green),
                          )),
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
                                  widget.roundscore);
                              bool result =
                                  await HighScoreServices.addHighscore(
                                      highScore);
                              if (result == true) {
                                Fluttertoast.showToast(
                                    msg:
                                        "Rating penilaian dan skor telah disubmit :-)",
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
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Tour1Screen(
                                            pertanyaan: tourstage232,
                                            gamescore: widget.score,
                                            totalbenar: 0,
                                            totalsalah: 0,
                                            qindex: 0,
                                            timerplus: 0,
                                            round: 3,
                                            roundscore: 0,
                                            stage: "Sistem Operasi - Postest 2",
                                            stagemodel: 2,
                                          )));
                            }
                          },
                          child: Text(
                            "Postest 2",
                            style: GoogleFonts.notoSans(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.04,
                                color: Colors.green),
                          )),
                    ),
                  ] else if (widget.stage == 3) ...[
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
                              widget.roundscore);
                          bool result =
                              await HighScoreServices.addHighscore(highScore);
                          if (result == true) {
                            Fluttertoast.showToast(
                                msg:
                                    "Rating penilaian dan skor telah disubmit :-)",
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
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MenuPage()));
                        }
                      },
                      child: Text(
                        "Submit",
                        style: GoogleFonts.notoSans(
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            color: Colors.green),
                      ),
                    ))
                  ]
                ] else if (_stagemodel == 3) ...[
                  if (widget.stage == 1) ...[
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
                                  widget.roundscore);
                              bool result =
                                  await HighScoreServices.addHighscore(
                                      highScore);
                              if (result == true) {
                                Fluttertoast.showToast(
                                    msg:
                                        "Rating penilaian dan skor telah disubmit :-)",
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
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Tour1Screen(
                                            pertanyaan: tourstage321,
                                            gamescore: widget.score,
                                            totalbenar: 0,
                                            totalsalah: 0,
                                            qindex: 0,
                                            timerplus: 0,
                                            stage: 'Sistem Operasi - Windows',
                                            round: 2,
                                            roundscore: 0,
                                            stagemodel: 3,
                                          )));
                            }
                          },
                          child: Text(
                            "Windows",
                            style: GoogleFonts.notoSans(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.04,
                                color: Colors.green),
                          )),
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
                                  widget.roundscore);
                              bool result =
                                  await HighScoreServices.addHighscore(
                                      highScore);
                              if (result == true) {
                                Fluttertoast.showToast(
                                    msg:
                                        "Rating penilaian dan skor telah disubmit :-)",
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
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Tour1Screen(
                                            pertanyaan: tourstage322,
                                            gamescore: 0,
                                            totalbenar: widget.score,
                                            totalsalah: 0,
                                            qindex: 0,
                                            timerplus: 0,
                                            stage: 'Sistem Operasi - Mac OS',
                                            round: 2,
                                            roundscore: 0,
                                            stagemodel: 3,
                                          )));
                            }
                          },
                          child: Text(
                            "Mac OS",
                            style: GoogleFonts.notoSans(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.04,
                                color: Colors.green),
                          )),
                    ),
                  ] else if (widget.stage == 2) ...[
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
                                  widget.roundscore);
                              bool result =
                                  await HighScoreServices.addHighscore(
                                      highScore);
                              if (result == true) {
                                Fluttertoast.showToast(
                                    msg:
                                        "Rating penilaian dan skor telah disubmit :-)",
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

                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Tour1Screen(
                                            pertanyaan: tourstage331,
                                            gamescore: widget.score,
                                            totalbenar: 0,
                                            totalsalah: 0,
                                            qindex: 0,
                                            timerplus: 0,
                                            round: 3,
                                            stage: "True False - Postest 1",
                                            stagemodel: 3,
                                          )));
                            }
                          },
                          child: Text(
                            "Postest 1",
                            style: GoogleFonts.notoSans(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.04,
                                color: Colors.green),
                          )),
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
                                  widget.roundscore);
                              bool result =
                                  await HighScoreServices.addHighscore(
                                      highScore);
                              if (result == true) {
                                Fluttertoast.showToast(
                                    msg:
                                        "Rating penilaian dan skor telah disubmit :-)",
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
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Tour1Screen(
                                            pertanyaan: tourstage332,
                                            gamescore: widget.score,
                                            totalbenar: 0,
                                            totalsalah: 0,
                                            qindex: 0,
                                            timerplus: 0,
                                            round: 3,
                                            roundscore: 0,
                                            stage: "True False - Postest 2",
                                            stagemodel: 3,
                                          )));
                            }
                          },
                          child: Text(
                            "Postest 2",
                            style: GoogleFonts.notoSans(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.04,
                                color: Colors.green),
                          )),
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
                                  widget.roundscore);
                              bool result =
                                  await HighScoreServices.addHighscore(
                                      highScore);
                              if (result == true) {
                                Fluttertoast.showToast(
                                    msg:
                                        "Rating penilaian dan skor telah disubmit :-)",
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
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Tour1Screen(
                                            pertanyaan: tourstage332,
                                            gamescore: widget.score,
                                            totalbenar: 0,
                                            totalsalah: 0,
                                            qindex: 0,
                                            timerplus: 0,
                                            round: 3,
                                            roundscore: 0,
                                            stage: "True False - Postest 3",
                                            stagemodel: 3,
                                          )));
                            }
                          },
                          child: Text(
                            "Postest 3",
                            style: GoogleFonts.notoSans(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.04,
                                color: Colors.green),
                          )),
                    ),
                  ] else if (widget.stage == 3) ...[
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
                                  widget.roundscore);
                              bool result =
                                  await HighScoreServices.addHighscore(
                                      highScore);
                              if (result == true) {
                                Fluttertoast.showToast(
                                    msg:
                                        "Rating penilaian dan skor telah disubmit :-)",
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
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MenuPage()));
                            }
                          },
                          child: Text(
                            "Submit",
                            style: GoogleFonts.notoSans(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.04,
                                color: Colors.green),
                          )),
                    )
                  ]
                ]
              ]),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return MenuPage();
              }));
            },
            style: ElevatedButton.styleFrom(
              elevation: 0,
              primary: Colors.transparent,
            ),
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.arrow_back,
                    size: MediaQuery.of(context).size.width * 0.12,
                    color: Colors.green,
                  ),
                  Text(
                    "Menu",
                    style: GoogleFonts.notoSans(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      color: Colors.green,
                    ),
                  )
                ],
              ),
            ),
          ),
        ] else if (_stagemodel == 0) ...[
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
                            builder: (context) => Tour1Screen(
                                  pertanyaan: widget.pertanyaan,
                                  gamescore: 0,
                                  totalbenar: 0,
                                  totalsalah: 0,
                                  qindex: 0,
                                  timerplus: 0,
                                  stage: widget.mode,
                                  roundscore: 0,
                                  round: 0,
                                  stagemodel: 0,
                                )));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.refresh,
                            size: MediaQuery.of(context).size.width * 0.12,
                            color: Colors.blue),
                        Text(
                          "Ulang",
                          style: GoogleFonts.notoSans(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                              color: Colors.blue),
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
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => MenuPage()));
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.add,
                            size: MediaQuery.of(context).size.width * 0.12,
                            color: Colors.blue),
                        Text(
                          "Submit",
                          style: GoogleFonts.notoSans(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                              color: Colors.blue),
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
                        Icon(Icons.arrow_back,
                            size: MediaQuery.of(context).size.width * 0.12,
                            color: Colors.blue),
                        Text(
                          "Menu",
                          style: GoogleFonts.notoSans(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                              color: Colors.blue),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]
      ]),
    );
  }
}
