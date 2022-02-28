part of 'pages.dart';

class SelectGamePage extends StatelessWidget {
  const SelectGamePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: SizedBox(
              child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Real Quiz Game"),
                Text("Waktunya bermain"),
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                          onTap: () {
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
                          child: Card(
                            child: ListTile(
                              tileColor: Colors.greenAccent,
                              title: Text(
                                "Basic Computer Quiz",
                                textAlign: TextAlign.center,
                              ),
                              subtitle: Text(
                                "3 Round seputar Komputer",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )),
                      InkWell(
                          onTap: null,
                          child: Card(
                            child: ListTile(
                              tileColor: Colors.blueAccent,
                              title: Text(
                                "Advanced Computer Quiz",
                                textAlign: TextAlign.center,
                              ),
                              subtitle: Text(
                                "2 Round + 3 Jenis Quiz",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ))
                    ],
                  ),]
                ),
              
            ),
          ),
        ));
  }
}

class SelectGamePage2 extends StatelessWidget {
  const SelectGamePage2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: SizedBox(
              child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Single Round Quiz"),
                Text("Cocok untuk latihan dan basic"),
                ConstrainedBox(
                  constraints: new BoxConstraints(minHeight: 12.h),
                  child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => GameplayScreen(
                                  pertanyaan: questiontype1,
                                  gamescore: 0,
                                  totalbenar: 0,
                                  totalsalah: 0,
                                  qindex: 0,
                                  timerplus: 0,
                                  user: "Dean",
                                )));
                      },
                      child: Card(
                        child: ListTile(
                          tileColor: Colors.blue,
                          title: Text(
                            "Pilihan Ganda",
                            textAlign: TextAlign.center,
                          ),
                          subtitle: Text(
                            "Pilih salah satu jawaban benar | 5 Pertanyaan",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )),
                ),
                ConstrainedBox(
                  constraints: new BoxConstraints(minHeight: 12.h),
                  child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => TruefalseScreen(
                                  pertanyaan: truefalse1,
                                  gamescore: 0,
                                  totalbenar: 0,
                                  totalsalah: 0,
                                  qindex: 0,
                                  timerplus: 0,
                                )));
                      },
                      child: Card(
                        child: ListTile(
                          tileColor: Colors.blue,
                          title: Text(
                            "True or False",
                            textAlign: TextAlign.center,
                          ),
                          subtitle: Text(
                            "Tebak benar atau salah | 5 Pertanyaan",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )),
                ),
                
               ]
                ),
              
            ),
          ),
        )
    );
  }
}

class SelectPage extends StatefulWidget {
  SelectPage({Key key}) : super(key: key);

  @override
  State<SelectPage> createState() => _SelectPageState();
}

class _SelectPageState extends State<SelectPage> with SingleTickerProviderStateMixin{
  int indextab= 0;
  TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      animationDuration: Duration(milliseconds: 500),
      length: 2,
      child: Scaffold(
        appBar: TabBar(
          labelColor: Colors.black87,
          unselectedLabelColor: Colors.black12,
          tabs: [
            Tab(
              text: 'Multi Round',
            ),
            Tab(
              text: 'Single Round',
            ),
            ],
          ),
        body: const TabBarView(
          children: [
            SelectGamePage(),
            SelectGamePage2()
          ]),
      ),
    );
  }
}