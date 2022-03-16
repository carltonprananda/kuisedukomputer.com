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
                Text("Multi Round Game"),
                Text("Uji kepahaman komputer dengan 3 babak yang berbeda"),
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
                                  stage: "Multi Round - Komputer Dasar",
                                  round: 1,
                                )));
                      },
                          child: Card(
                            child: ListTile(
                              tileColor: Colors.greenAccent,
                              title: Text(
                                "Quiz Komputer Dasar",
                                textAlign: TextAlign.center,
                              ),
                              subtitle: Text(
                                "3 Round seputar Komputer Dasar",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )),
                      InkWell(
                          onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Tour1Screen(
                                  pertanyaan: tourstage121,
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
                                "Quiz Sistem Operasi Komputer",
                                textAlign: TextAlign.center,
                              ),
                              subtitle: Text(
                                "3 Quiz Tentang Seputar Sistem Operasi",
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
                                  pertanyaan: tourstage111,
                                  gamescore: 0,
                                  totalbenar: 0,
                                  totalsalah: 0,
                                  qindex: 0,
                                  timerplus: 0,
                                  stage: "0",
                                )));
                      },
                      child: Card(
                        child: ListTile(
                          tileColor: Colors.blue,
                          title: Text(
                            "Komputer Dasar",
                            textAlign: TextAlign.center,
                          ),
                          subtitle: Text(
                            "Latihan Quiz Komputer Dasar | 10 Pertanyaan",
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
                            builder: (context) => GameplayScreen(
                                  pertanyaan: tourstage121,
                                  gamescore: 0,
                                  totalbenar: 0,
                                  totalsalah: 0,
                                  qindex: 0,
                                  timerplus: 0,
                                  stage: "0",
                                )));
                      },
                      child: Card(
                        child: ListTile(
                          tileColor: Colors.blue,
                          title: Text(
                            "Sistem Operasi",
                            textAlign: TextAlign.center,
                          ),
                          subtitle: Text(
                            "Latihan Kuis Sistem Operasi | 10 Pertanyaan",
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
                            builder: (context) => GameplayScreen(
                                  pertanyaan: tourstage122,
                                  gamescore: 0,
                                  totalbenar: 0,
                                  totalsalah: 0,
                                  qindex: 0,
                                  timerplus: 0,
                                  stage: "0",
                                )));
                      },
                      child: Card(
                        child: ListTile(
                          tileColor: Colors.blue,
                          title: Text(
                            "Keamanan Komputer",
                            textAlign: TextAlign.center,
                          ),
                          subtitle: Text(
                            "Latihan Kuis Keamanan Komputer | 10 Pertanyaan",
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
                            builder: (context) => GameplayScreen(
                                  pertanyaan: tourstage221,
                                  gamescore: 0,
                                  totalbenar: 0,
                                  totalsalah: 0,
                                  qindex: 0,
                                  timerplus: 0,
                                  stage: "0",
                                )));
                      },
                      child: Card(
                        child: ListTile(
                          tileColor: Colors.blue,
                          title: Text(
                            "Microsoft Windows",
                            textAlign: TextAlign.center,
                          ),
                          subtitle: Text(
                            "Latihan Kuis tentang Windows | 10 Pertanyaan",
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
  static String name;
  User auth = FirebaseAuth.instance.currentUser;
  CollectionReference<Map<String, dynamic>> userCollection =
      FirebaseFirestore.instance.collection("users");
  bool isLoading;

    void getUserUpdate() async {
    userCollection.doc(auth.uid).snapshots().listen((event) {
      name = event.data()['name'];
      setState(() {});
    });
  }

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