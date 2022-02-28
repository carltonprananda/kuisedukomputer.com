part of 'gamelist.dart';

class Tour1Screen extends StatefulWidget {
  const Tour1Screen({
    Key key,
    this.pertanyaan,
    this.gamescore,
    this.totalbenar,
    this.totalsalah,
    this.timerplus,
    this.qindex,
    this.stage, this.round, this.user,
  }) : super(key: key);

  final List<Question> pertanyaan;
  final int gamescore;
  final int totalbenar;
  final int totalsalah;
  final int timerplus;
  final int qindex;
  final String stage;
  final int round;
  final String user;
  @override
  _Tour1ScreenState createState() => _Tour1ScreenState();
}

class _Tour1ScreenState extends State<Tour1Screen> {
  List<Question> _pertanyaan = tourstage111;
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
  static var questionrandomtake = questionrandom.take(4);
  String stage = "Basic Computer";

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
    super.dispose();
  }

  void toResultgame(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => new ResultTour(
          jawabanbenar: _totalbenar,
          jawabansalah: _totalsalah,
          score: _gamescore,
          answertime: _totaltime, 
          stage: 1,
          user: "Dean",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Text(
              _totaltime.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 10.sp),
            ),
            Text(
              "$_gamescore",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 10.sp),
            ),
            Text(
              "Round 1/3",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 10.sp),
            ),
            Text(
              getQuestion.question,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 10.sp),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: getQuestion.listanswers.length,
                  itemBuilder: (context, index) {
                    int jawabanbenar = 100;
                    int jawabansalah = -50;
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

                          Future.delayed(const Duration(milliseconds: 150), () {
                            if (questionindex ==
                                4 /*widget.pertanyaan.length - 1*/) {
                              toResultgame(context);
                              _timerplus.cancel();
                              questionindex = 0; //mereset index
                              jawabanbenar = 0;
                              jawabansalah = 0;
                              return;
                            }
                            setState(() {
                              questionindex++;
                              print(
                                  "Random Question" + questionindex.toString());
                              myanswer = '';
                            });
                          });
                        });
                  }),
            )
          ],
        ),
      ),
    );
  }
}