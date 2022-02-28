part of 'pages.dart';

class ResultTour extends StatefulWidget {
  ResultTour({
    Key key,
    this.score,
    this.jawabanbenar,
    this.jawabansalah,
    this.answertime,
    this.stage, this.user, this.mode,
  }) : super(key: key);

  final int score;
  final int jawabanbenar;
  final int jawabansalah;
  final int answertime;
  final int stage;
  final String user;
  final String mode;

  @override
  _ResultTourState createState() => _ResultTourState();
}

class _ResultTourState extends State<ResultTour> {
  static double persentasebenar = 0;
  static int persenbenar() {
    return persentasebenar ~/ 5 * 100;
  }

  static int hasilpersenbenar = persenbenar();

  static double persentasesalah = 0;
  static int persensalah() {
    return persentasebenar ~/ 5 * 100;
  }

  static double hasilpersensalah = persensalah().toDouble();

  @override
  void initState() {
    super.initState();
    persentasebenar = widget.jawabanbenar.toDouble();
    int persenbenar() {
      return persentasebenar ~/ 5 * 100;
    }

    hasilpersenbenar = persenbenar();
    persentasesalah = widget.jawabansalah.toDouble();
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
            Spacer(),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Tour2Screen(
                            pertanyaan: tourstage121,
                            gamescore: widget.score,
                            totalbenar: 0,
                            totalsalah: 0,
                            qindex: 0,
                            timerplus: 0,
                            stage: 'Komputer Dasar - Keamanan Komputer',
                          )));
                },
                child: Text("Next Stage 1")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Tour2Screen(
                            pertanyaan: tourstage122,
                            gamescore: 0,
                            totalbenar: widget.score,
                            totalsalah: 0,
                            qindex: 0,
                            timerplus: 0,
                            stage: 'Komputer Dasar - Keamanan Komputer',
                          )));
                },
                child: Text("Next Stage 2")),
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

class ResultTour2 extends StatefulWidget {
  ResultTour2({
    Key key,
    this.score,
    this.jawabanbenar,
    this.jawabansalah,
    this.answertime,
    this.stage, this.user, this.mode,
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
            Spacer(),
            ElevatedButton(
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
                child: Text("Next Stage 1")),
            ElevatedButton(
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
                child: Text("Next Stage 2")),
            ElevatedButton(
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
            child: Text("Next Stage 3")),
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
