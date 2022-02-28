part of 'gamelist.dart';

class TruefalseScreen extends StatefulWidget {
  TruefalseScreen({
    Key key,
    this.pertanyaan,
    this.gamescore,
    this.totalbenar,
    this.totalsalah,
    this.timerplus,
    this.qindex,
  }) : super(key: key);

  final List<TrueFalse> pertanyaan;
  final int gamescore;
  final int totalbenar;
  final int totalsalah;
  final int timerplus;
  final int qindex;

  @override
  _TruefalseScreenState createState() => _TruefalseScreenState();
}

class _TruefalseScreenState extends State<TruefalseScreen> {
  List<TrueFalse> _pertanyaan = truefalse1;
  int _totaltime;
  int _countdowntimer;
  Timer _timerplus;
  Timer _timerminus;
  static int _gamescore = 0;
  static int _totalbenar = 0;
  static int _totalsalah = 0;
  static int questionindex = 0;
  static var questionrandom = List<int>.generate(truefalse1.length, (i) => i)
    ..shuffle();
  static var questionrandomtake = questionrandom.take(5);

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
        builder: (context) => ResultGame(
          jawabanbenar: _totalbenar,
          jawabansalah: _totalsalah,
          score: _gamescore,
          answertime: _totaltime,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(questionrandomtake);
    //final randomquestion = widget.pertanyaan.shuffle();
    final getQuestion = widget.pertanyaan[questionrandom[questionindex]];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          getQuestion.truefalsetitle,
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
              "Soal Anda $questionindex",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 10.sp),
            ),
            Text(
              "Skor Anda $_gamescore",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 10.sp),
            ),
            Text(
              getQuestion.truefalsequestion,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 10.sp),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: getQuestion.truefalseanswers.length,
                  itemBuilder: (context, index) {
                    int jawabanbenar = 50;
                    int jawabansalah = -25;
                    final jawaban = getQuestion.truefalseanswers[index];
                    return TFTile(
                        dipilih: jawaban == myanswer,
                        jawaban: jawaban,
                        jawabanbenar: getQuestion.truefalsecorrect,
                        klik: () {
                          setState(() {
                            myanswer = jawaban;
                          });

                          if (jawaban == getQuestion.truefalsecorrect) {
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
                              questionindex = 0;
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
