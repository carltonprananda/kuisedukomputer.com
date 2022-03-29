part of 'pages.dart';

class SelectGamePage extends StatelessWidget {
  const SelectGamePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SizedBox(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("Multi Round Game", textAlign: TextAlign.left, style:TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
                Text("Uji kepahaman komputer dengan 3 babak yang berbeda",
                    textAlign: TextAlign.left),
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
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/images/monitor1.jpg'),
                              ),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                colors: [
                                  Colors.greenAccent.shade700.withOpacity(0.8),
                                  Colors.green.shade900.withOpacity(0.8),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.topRight,
                              )),
                              child: ListTile(
                                tileColor: Colors.greenAccent,
                                title: Text("Quiz Komputer Dasar",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                subtitle: Text(
                                  "3 Round seputar Komputer Dasar",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
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
                                    stage: "Multi Round - Sistem Operasi",
                                    round: 1,
                                  )));
                        },
                        child: Card(
                            child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage('assets/images/laptop1.jpg'),
                                  ),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                    colors: [
                                      Colors.greenAccent.shade700
                                          .withOpacity(0.8),
                                      Colors.green.shade900.withOpacity(0.8),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.topRight,
                                  )),
                                  child: ListTile(
                                    tileColor: Colors.greenAccent,
                                    title: Text(
                                      "Quiz Sistem Operasi Komputer",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    subtitle: Text(
                                      "3 Quiz Tentang Seputar Sistem Operasi",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ))))
                  ],
                ),
              ]),
        ),
      ),
    );
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
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("Single Round Quiz", textAlign: TextAlign.left, style:TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
                Text("Cocok untuk latihan dan basic",
                    textAlign: TextAlign.left),
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
                                  stage: "Komputer Dasar",
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
                                  stage: "Sistem Operasi",
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
                                  stage: "Keamanan Komputer",
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
                                  stage: "Microsoft Windows",
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
                ConstrainedBox(
                  constraints: new BoxConstraints(minHeight: 12.h),
                  child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => GameplayScreen(
                                  pertanyaan: tourstage222,
                                  gamescore: 0,
                                  totalbenar: 0,
                                  totalsalah: 0,
                                  qindex: 0,
                                  timerplus: 0,
                                  stage: "MacOS",
                                )));
                      },
                      child: Card(
                        child: ListTile(
                          tileColor: Colors.blue,
                          title: Text(
                            "MacOS",
                            textAlign: TextAlign.center,
                          ),
                          subtitle: Text(
                            "Latihan Kuis tentang MacOS | 10 Pertanyaan",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )),
                ),
              ]),
        ),
      ),
    );
  }
}

class SelectPage extends StatefulWidget {
  SelectPage({Key key}) : super(key: key);

  @override
  State<SelectPage> createState() => _SelectPageState();
}

class _SelectPageState extends State<SelectPage>
    with SingleTickerProviderStateMixin {
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

  int indextab = 0;
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
          labelColor: Colors.blueGrey,
          unselectedLabelColor: Colors.blueAccent[200],
          indicatorColor: Colors.blueAccent,
          tabs: [
            Tab(
              text: 'Multi Round',
            ),
            Tab(
              text: 'Single Round',
            ),
          ],
        ),
        body: const TabBarView(children: [SelectGamePage(), SelectGamePage2()]),
      ),
    );
  }
}
