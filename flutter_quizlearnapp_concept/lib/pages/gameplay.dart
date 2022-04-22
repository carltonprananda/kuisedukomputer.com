part of 'pages.dart';

class Tour1Screen extends StatefulWidget {
  const Tour1Screen(
      {Key key,
      this.pertanyaan,
      this.gamescore,
      this.totalbenar,
      this.totalsalah,
      this.timerplus,
      this.qindex,
      this.stage,
      this.round,
      this.user,
      this.roundscore,
      this.stagemodel})
      : super(key: key);

  final List<Question> pertanyaan;
  final int gamescore;
  final int totalbenar;
  final int totalsalah;
  final int timerplus;
  final int qindex;
  final String stage;
  final int stagemodel;
  final int round;
  final String user;
  final int roundscore;
  @override
  _Tour1ScreenState createState() => _Tour1ScreenState();
}

class _Tour1ScreenState extends State<Tour1Screen> {
  List<Question> _pertanyaan = tourstage111;
  int _totaltime;
  Timer _timerplus;
  static int _gamescore = 0;
  static int _roundscore = 0;
  static int _totalbenar = 0;
  static int _totalsalah = 0;
  static int questionindex = 0;
  static int roundjawabanbenar = 10;
  static var questionrandom = List<int>.generate(tourstage111.length, (i) => i)
    ..shuffle();
  static var questionrandomtake = questionrandom.take(tourstage111.length);
  final soundbenar = AudioCache();
  static String stage;
  static int _stagemodel;
  List<Color> warnamode = [
    Colors.greenAccent.shade700,
    Colors.greenAccent.shade400
  ];

  String myanswer = '';
  @override
  void initState() {
    super.initState();
    _pertanyaan = widget.pertanyaan;
    questionrandom = List<int>.generate(_pertanyaan.length, (i) => i)
      ..shuffle();
    _totaltime = widget.timerplus;
    _timerplus = Timer.periodic(Duration(seconds: 1), (timer) {
      print(_totaltime);
      setState(() {
        _totaltime++;
      });
    });
    _gamescore = widget.gamescore;
  }

  @override
  void dispose() {
    _timerplus.cancel();
    _gamescore = 0;
    _roundscore = 0;
    _totalbenar = 0;
    _totalsalah = 0;
    super.dispose();
  }

  void toResultgame(BuildContext context) {
    print(widget.stage);
    print("stage model" + widget.stagemodel.toString());
    if (_stagemodel == 0) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => ResultTour(
            jawabanbenar: _totalbenar,
            jawabansalah: _totalsalah,
            score: _gamescore,
            answertime: _totaltime,
            stage: widget.round,
            mode: widget.stage,
            roundscore: _roundscore,
            stagemodel: 0,
            pertanyaan: widget.pertanyaan,
          ),
        ),
      );
    }
    if (_stagemodel == 1) {
      if (widget.round == 1) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => new ResultTour(
              jawabanbenar: _totalbenar,
              jawabansalah: _totalsalah,
              score: _gamescore,
              answertime: _totaltime,
              stage: widget.round,
              mode: widget.stage,
              roundscore: _roundscore,
              stagemodel: 1,
              pertanyaan: widget.pertanyaan,
            ),
          ),
        );
      }
      if (widget.round == 2) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => new ResultTour(
              jawabanbenar: _totalbenar,
              jawabansalah: _totalsalah,
              score: _gamescore,
              answertime: _totaltime,
              stage: widget.round,
              mode: stage,
              roundscore: _roundscore,
              stagemodel: 1,
              pertanyaan: widget.pertanyaan,
            ),
          ),
        );
      }
      if (widget.round == 3) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => new ResultTour(
              jawabanbenar: _totalbenar,
              jawabansalah: _totalsalah,
              score: _gamescore,
              answertime: _totaltime,
              stage: widget.round,
              mode: widget.stage,
              roundscore: _roundscore,
              stagemodel: 1,
              pertanyaan: widget.pertanyaan,
            ),
          ),
        );
      }
    }
    if (_stagemodel == 2) {
      if (widget.round == 1) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => new ResultTour(
              jawabanbenar: _totalbenar,
              jawabansalah: _totalsalah,
              score: _gamescore,
              answertime: _totaltime,
              stage: widget.round,
              mode: widget.stage,
              roundscore: _roundscore,
              stagemodel: 2,
              pertanyaan: widget.pertanyaan,
            ),
          ),
        );
      }
      if (widget.round == 2) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => new ResultTour(
              jawabanbenar: _totalbenar,
              jawabansalah: _totalsalah,
              score: _gamescore,
              answertime: _totaltime,
              stage: widget.round,
              mode: widget.stage,
              roundscore: _roundscore,
              stagemodel: 2,
              pertanyaan: widget.pertanyaan,
            ),
          ),
        );
      }
      if (widget.round == 3) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => new ResultTour(
              jawabanbenar: _totalbenar,
              jawabansalah: _totalsalah,
              score: _gamescore,
              answertime: _totaltime,
              stage: widget.round,
              mode: widget.stage,
              roundscore: _roundscore,
              stagemodel: 2,
              pertanyaan: widget.pertanyaan,
            ),
          ),
        );
      }
    }
    if (_stagemodel == 3) {
      if (widget.round == 1) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => new ResultTour(
              jawabanbenar: _totalbenar,
              jawabansalah: _totalsalah,
              score: _gamescore,
              answertime: _totaltime,
              stage: widget.round,
              mode: widget.stage,
              roundscore: _roundscore,
              stagemodel: 3,
              pertanyaan: widget.pertanyaan,
            ),
          ),
        );
      }
      if (widget.round == 2) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => new ResultTour(
              jawabanbenar: _totalbenar,
              jawabansalah: _totalsalah,
              score: _gamescore,
              answertime: _totaltime,
              stage: widget.round,
              mode: widget.stage,
              roundscore: _roundscore,
              stagemodel: 3,
              pertanyaan: widget.pertanyaan,
            ),
          ),
        );
      }
      if (widget.round == 3) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => new ResultTour(
              jawabanbenar: _totalbenar,
              jawabansalah: _totalsalah,
              score: _gamescore,
              answertime: _totaltime,
              stage: widget.round,
              mode: widget.stage,
              roundscore: _roundscore,
              stagemodel: 3,
              pertanyaan: widget.pertanyaan,
            ),
          ),
        );
      }
    }
  }

  void toMainmenu(BuildContext context) {
    dispose;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => MenuPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    stage = widget.stage;
    _stagemodel = widget.stagemodel;
    int _roundgame = widget.round;
    int jumlahsoal = 10;

    if (_roundgame == 1) {
      jumlahsoal = 3;
      roundjawabanbenar = 25;
    } else {
      jumlahsoal = 9;
      roundjawabanbenar = 10;
    }
    if (_roundgame == 0) {
      warnamode = [Colors.blueAccent.shade200, Colors.blueAccent.shade400];
    }
    print(questionrandomtake);
    //final randomquestion = widget.pertanyaan.shuffle();
    final getQuestion = widget.pertanyaan[questionrandom[questionindex]];
    print("Soal:" + getQuestion.toString());
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: warnamode)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(getQuestion.questiontitle, style: GoogleFonts.notoSans()),
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              if (_stagemodel != 0) ...[
                MultiScoreTile(
                  timer: _totaltime,
                  questionindex: questionindex,
                  round: widget.round,
                  roundskor: _gamescore,
                  skor: widget.gamescore,
                )
              ] else ...[
                ScoreTile(
                  timer: _totaltime,
                  questionindex: questionindex,
                  skor: _gamescore,
                )
              ],
              QTile(pertanyaan: getQuestion.question),
              Expanded(
                child: ListView.builder(
                    itemCount: getQuestion.listanswers.length,
                    itemBuilder: (context, index) {
                      int jawabanbenar = roundjawabanbenar;
                      int jawabansalah = 0;
                      final jawaban = getQuestion.listanswers[index];
                      return ATile(
                          dipilih: jawaban == myanswer,
                          jawaban: jawaban,
                          jawabanbenar: getQuestion.questioncorrect,
                          klik: () {
                            setState(() {
                              myanswer = jawaban;
                            });
                            if (_stagemodel != 0) {
                              if (jawaban == getQuestion.questioncorrect) {
                                soundbenar.play('audios/correct-answer.wav');
                                _gamescore = _gamescore + jawabanbenar;
                                _roundscore = _roundscore + jawabanbenar;
                                _totalbenar++;
                              } else {
                                soundbenar.play('audios/sound-wrong.wav');
                                _gamescore = _gamescore + jawabansalah;
                                _roundscore = _roundscore + jawabansalah;
                                _totalsalah++;
                              }
                            } else {
                              if (jawaban == getQuestion.questioncorrect) {
                                soundbenar.play('audios/correct-answer.wav');
                                _gamescore = _gamescore + jawabanbenar;
                                _totalbenar++;
                              } else {
                                soundbenar.play('audios/sound-wrong.wav');
                                _gamescore = _gamescore + jawabansalah;
                                _totalsalah++;
                              }
                            }
                            Future.delayed(const Duration(milliseconds: 150),
                                () {
                              if (questionindex ==
                                  jumlahsoal /*widget.pertanyaan.length - 1*/) {
                                soundbenar.play('audios/level-win.wav');
                                toResultgame(context);
                                _timerplus.cancel();
                                questionindex = 0; //mereset index
                                jawabanbenar = 0;
                                jawabansalah = 0;
                                return;
                              }
                              setState(() {
                                soundbenar.respectSilence == true;
                                questionindex++;
                                myanswer = '';
                              });
                            });
                          });
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
