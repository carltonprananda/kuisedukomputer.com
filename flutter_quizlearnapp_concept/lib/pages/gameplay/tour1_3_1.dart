part of 'gamelist.dart';

class Tour3Screen extends StatefulWidget {
  Tour3Screen(
      {Key key,
      this.pertanyaan,
      this.gamescore,
      this.totalbenar,
      this.totalsalah,
      this.timerplus,
      this.qindex,
      this.round,
      this.user,
      this.roundscore,
      this.stage})
      : super(key: key);

  final List<Question> pertanyaan;
  final int gamescore;
  final int totalbenar;
  final int totalsalah;
  final int timerplus;
  final int qindex;
  final String stage;
  final int round;
  final String user;
  final int roundscore;
  @override
  _Tour3ScreenState createState() => _Tour3ScreenState();
}

class _Tour3ScreenState extends State<Tour3Screen> {
  List<Question> _pertanyaan = tourstage311;
  int _totaltime;
  int _countdowntimer;
  Timer _timerplus;
  Timer _timerminus;
  static int _gamescore = 0;
  static int _roundscore = 0;
  static int _totalbenar = 0;
  static int _totalsalah = 0;
  static int questionindex = 0;
  static int roundjawabanbenar = 100;
  static int roundjawabansalah = 0;
  static var questionrandom = List<int>.generate(questiontype1.length, (i) => i)
    ..shuffle();
  static var questionrandomtake = questionrandom.take(4);
  final soundbenar = AudioCache();
  static String stage;

  String myanswer = '';
  @override
  void initState() {
    super.initState();
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
    if (widget.round == 1) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => new ResultTour3(
            jawabanbenar: _totalbenar,
            jawabansalah: _totalsalah,
            score: _gamescore,
            answertime: _totaltime,
            stage: widget.round,
            mode: widget.stage,
            roundscore: _roundscore,
          ),
        ),
      );
    }
    if (widget.round == 2) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => new ResultTour3(
            jawabanbenar: _totalbenar,
            jawabansalah: _totalsalah,
            score: _gamescore,
            answertime: _totaltime,
            stage: widget.round,
            mode: widget.stage,
            roundscore: _roundscore,
          ),
        ),
      );
    }
    if (widget.round == 3) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => new ResultTour3(
            jawabanbenar: _totalbenar,
            jawabansalah: _totalsalah,
            score: _gamescore,
            answertime: _totaltime,
            stage: widget.round,
            mode: widget.stage,
            roundscore: _roundscore,
          ),
        ),
      );
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    print(questionrandomtake);
    int _roundgame = widget.round;
    int jumlahsoal = 10;
    if (_roundgame == 1) {
      jumlahsoal = 3;
      roundjawabanbenar = 25;
    }
    if (_roundgame == 2) {
      jumlahsoal = 9;
      roundjawabanbenar = 10;
    }
    if (_roundgame == 3) {
      jumlahsoal = 9;
      roundjawabanbenar = 10;
    }
    //final randomquestion = widget.pertanyaan.shuffle();
    final getQuestion = widget.pertanyaan[questionrandom[questionindex]];
    print("Soal:" + getQuestion.toString());
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            Colors.greenAccent.shade700,
            Colors.greenAccent.shade400
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(getQuestion.questiontitle, style: GoogleFonts.notoSans()),
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              MultiScoreTile(
                timer: _totaltime,
                questionindex: questionindex,
                round: widget.round,
                roundskor: _roundscore,
                skor: widget.gamescore,
              ),
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
