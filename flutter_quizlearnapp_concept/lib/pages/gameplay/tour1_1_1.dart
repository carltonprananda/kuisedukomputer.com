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
    this.stage, this.round, this.user, this.roundscore
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
  final int roundscore;
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
  static int _roundscore = 0;
  static int _totalbenar = 0;
  static int _totalsalah = 0;
  static int questionindex = 0;
  static var questionrandom = List<int>.generate(questiontype1.length, (i) => i)
    ..shuffle();
  static var questionrandomtake = questionrandom.take(4);
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
  if (widget.round == 1){
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
        ),
      ),
    );
  }
  if (widget.round == 2){
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
        ),
      ),
    );
  } 
  if (widget.round == 3){
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
        ),
      ),
    );
  };
  }

  @override
  Widget build(BuildContext context) {
    
    int _roundgame = widget.round;
    int jumlahsoal = 10;
    if (_roundgame == 1){
      jumlahsoal = 3;
    }
    if (_roundgame == 2){
      jumlahsoal = 7;
    }
    if (_roundgame == 3){
      jumlahsoal = 9;
    }
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
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Expanded(
                  child: Container(
                    color: Colors.lightBlueAccent,
                    child: Padding(
                      padding: EdgeInsets.all(2),
                      child: Column(
                        children: [
                          Text("Babak",
                              style: GoogleFonts.notoSans(
                                  fontWeight: FontWeight.bold)),
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            child: Container(
                              color: Colors.blue,
                              padding: EdgeInsets.all(10),
                              width: double.infinity,
                              child: Text(
                                "$_roundgame/3",
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
              Spacer()
              ],
            ),
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
            Text(
              "Round $_roundgame /3",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 10.sp),
            ),
            Text(
              getQuestion.question,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 10.sp),
            ),
            QTile(pertanyaan: getQuestion.question),
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
                            _roundscore = _roundscore + jawabanbenar;
                            _totalbenar++;
                          } else {
                            _gamescore = _gamescore + jawabansalah;
                            _roundscore = _roundscore + jawabansalah;
                            _totalsalah++;
                          }

                          Future.delayed(const Duration(milliseconds: 150), () {
                            if (questionindex ==
                                jumlahsoal /*widget.pertanyaan.length - 1*/) {
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