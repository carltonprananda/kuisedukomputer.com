part of 'pages.dart';

class PretestMulti1 extends StatefulWidget {
  PretestMulti1({Key key}) : super(key: key);

  @override
  State<PretestMulti1> createState() => _PretestMulti1State();
}

class _PretestMulti1State extends State<PretestMulti1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Materi Pretest"),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(child: MateriKomputerDasarTile()),
          ),
          ElevatedButton.icon(
            icon: Icon(Icons.play_arrow),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Tour1Screen(
                        pertanyaan: tourstage111,
                        gamescore: 0,
                        totalbenar: 0,
                        totalsalah: 0,
                        qindex: 0,
                        timerplus: 0,
                        stage: "1",
                      )));
            },
          ),
        ],
      ),
    );
  }
}
