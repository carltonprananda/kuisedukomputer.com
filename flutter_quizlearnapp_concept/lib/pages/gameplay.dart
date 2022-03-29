part of 'pages.dart';

class GameplayScreen extends StatefulWidget {
  GameplayScreen(
      {Key key,
      this.pertanyaan,
      this.gamescore,
      this.totalbenar,
      this.totalsalah,
      this.timerplus,
      this.qindex,
      this.user,
      this.stage})
      : super(key: key);

  final List<Question> pertanyaan;
  final int gamescore;
  final int totalbenar;
  final int totalsalah;
  final int timerplus;
  final int qindex;
  final String user;
  final String stage;
  @override
  _GameplayScreenState createState() => _GameplayScreenState();
}

class _GameplayScreenState extends State<GameplayScreen> {
  List<Question> _pertanyaan = questiontype1;
  int _totaltime;
  int _countdowntimer;
  Timer _timerplus;
  Timer _timerminus;
  static int _gamescore = 0;
  static int _totalbenar = 0;
  static int _totalsalah = 0;
  static int questionindex = 0;
  static var questionrandom = List<int>.generate(questiontype1.length, (i) => i)
    ..shuffle();
  static var questionrandomtake = questionrandom.take(10);
  String stage;

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
    _totalbenar = 0;
    _totalsalah = 0;
    questionindex = 0;
    super.dispose();
  }

  void toResultgame(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => ResultGame(
          jawabanbenar: _totalbenar,
          jawabansalah: _totalsalah,
          score: _gamescore,
          answertime: _totaltime,
          mode: stage,
          pertanyaan: widget.pertanyaan,
          stage: 0,
        ),
      ),
    );
  }

  void toMainmenu(BuildContext context) {
    dispose;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => ResultGame(
          jawabanbenar: _totalbenar,
          jawabansalah: _totalsalah,
          score: _gamescore,
          answertime: _totaltime,
          mode: stage,
          pertanyaan: widget.pertanyaan,
          stage: 0,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    stage = widget.stage;
    print(questionrandomtake);
    //final randomquestion = widget.pertanyaan.shuffle();
    final getQuestion = widget.pertanyaan[questionrandom[questionindex]];
    print("Soal:" + getQuestion.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          getQuestion.questiontitle,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    color: Colors.lightBlueAccent,
                    child: Padding(
                      padding: EdgeInsets.all(2),
                      child: Column(
                        children: [
                          Text("Waktu",
                              style: GoogleFonts.notoSans(
                                  fontWeight: FontWeight.bold)),
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            child: Container(
                              color: Colors.blue,
                              padding: EdgeInsets.all(10),
                              width: double.infinity,
                              child: Text(
                                _totaltime.toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 14.sp),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.lightBlueAccent,
                    child: Padding(
                      padding: EdgeInsets.all(2),
                      child: Column(
                        children: [
                          Text("Skor",
                              style: GoogleFonts.notoSans(
                                  fontWeight: FontWeight.bold)),
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            child: Container(
                              color: Colors.blue,
                              padding: EdgeInsets.all(10),
                              width: double.infinity,
                              child: Text(
                                "$_gamescore",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 14.sp),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: LinearPercentIndicator(
                lineHeight: 20.0,
                animation: true,
                percent: (((questionindex+1)*100)/1000),
                progressColor: Colors.blue,
                fillColor: Colors.lightBlue,
              ),
            ),
            QTile(pertanyaan: getQuestion.question),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: getQuestion.listanswers.length,
                  itemBuilder: (context, index) {
                    int jawabanbenar = 10;
                    int jawabansalah = -5;
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
                            _gamescore = _gamescore + jawabanbenar;
                            _totalbenar++;
                          } else {
                            _gamescore = _gamescore + jawabansalah;
                            _totalsalah++;
                          }

                          Future.delayed(const Duration(milliseconds: 50), () {
                            if (questionindex ==
                                9 /*widget.pertanyaan.length - 1*/) {
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
            ),
          ],
        ),
      ),
    );
  }
}
