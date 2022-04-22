part of 'pages.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  String uid, name;
  User auth = FirebaseAuth.instance.currentUser;
  CollectionReference<Map<String, dynamic>> userCollection =
      FirebaseFirestore.instance.collection("users");

  void getUserUpdate() async {
    userCollection.doc(auth.uid).snapshots().listen((event) {
      uid = event.data()[auth.uid];
      name = event.data()['name'];
      setState(() {});
    });
  }

  @override
  void initState() {
    getUserUpdate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                "Selamat Datang di Game Edukasi Komputer",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            ListView(
              shrinkWrap: true,
              padding: EdgeInsets.all(10),
              children: <Widget>[
                ListTile(
                    isThreeLine: true,
                    subtitle: Text(
                        "Uji Kemampuan dengan Pre-test, Test dan Post-test."),
                    title: Text("Multi-Round Mode",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    leading: Icon(
                      Icons.list,
                      color: Colors.blueAccent,
                    )),
                ListTile(
                    isThreeLine: true,
                    subtitle: Text("Latih kepahaman tentang Komputer"),
                    title: Text("Single Round Mode",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    leading: Icon(
                      Icons.drag_handle_outlined,
                      color: Colors.blueAccent,
                    )),
                ListTile(
                    isThreeLine: true,
                    subtitle: Text(
                        "Nilai hasil penilaian dan Ukur Kepahaman Anda dalam komputer"),
                    title: Text("Rating Nilai dan Rating Kepahaman",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    leading: Icon(
                      Icons.star,
                      color: Colors.yellowAccent,
                    )),
                ListTile(
                    isThreeLine: true,
                    subtitle: Text("Melihat hasil pengguna lainnya dalam quiz"),
                    title: Text("Highscore",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    leading: Icon(Icons.scoreboard, color: Colors.blueAccent)),
                ListTile(
                    isThreeLine: true,
                    subtitle: Text("Materi tentang Komputer seperti"),
                    title: Text("Materi Quiz tentang Komputer",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    leading: Icon(
                      Icons.menu_book,
                      color: Colors.orangeAccent,
                    )),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return MenuPage();
                  }));
                },
                child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Lanjut",
                      textAlign: TextAlign.center,
                    ))),
          ],
        ),
      ),
    );
  }
}

class FirstPage extends StatefulWidget {
  FirstPage({Key key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final GlobalKey<ScaffoldState> _globalKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final pages = [
      PageViewModel(
        image: Center(
            child: Image.asset(
          'assets/pngs/undraw_flowers_vx06.png',
          scale: 0.25,
        )),
        title: 'Selamat Datang di Game Edukasi Komputer Non-Linear',
        body:
            'Selamat Datang di Game Edukasi Komputer Non-Linear berbasis Flutter dan Firebase',
        decoration: PageDecoration(
            titleTextStyle: GoogleFonts.notoSans(
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.width * 0.08),
            bodyTextStyle: GoogleFonts.notoSans()),
      ),
      PageViewModel(
        image: Center(
            child: Image.asset(
          'assets/pngs/undraw_online_test_gba7.png',
          scale: 0.25,
        )),
        title: '2 Mode dalam 1 Game',
        body:
            'Ada single round untuk latihan dalam kepahaman komputer dan multiround untuk menguji kepahaman dalam 3 tahap yaitu pre-test, test, dan post-test',
        decoration: PageDecoration(
            titleTextStyle: GoogleFonts.notoSans(
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.width * 0.08),
            bodyTextStyle: GoogleFonts.notoSans()),
      ),
      PageViewModel(
        image: Center(
            child: Image.asset(
          'assets/pngs/undraw_choose_re_7d5a.png',
          scale: 0.25,
        )),
        title: 'Multi-round Mode',
        body:
            'Uji kepahaman dalam 3 tahap yaitu pre-test, test, dan post-test. Bisa memilih stage dalam akhir quiz',
        decoration: PageDecoration(
            titleTextStyle: GoogleFonts.notoSans(
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.width * 0.08),
            bodyTextStyle: GoogleFonts.notoSans()),
      ),
      PageViewModel(
        image: Center(
            child: Image.asset(
          'assets/pngs/undraw_select_option_re_u4qn.png',
          scale: 0.25,
        )),
        title: 'Pilih Stage sesuai minat',
        body: 'Pilih stage di dalam game ini sesuai dengan minat',
        decoration: PageDecoration(
            titleTextStyle: GoogleFonts.notoSans(
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.width * 0.08),
            bodyTextStyle: GoogleFonts.notoSans()),
      ),
    ];
    return Scaffold(
      extendBody: false,
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.75,
          child: IntroductionScreen(
            pages: pages,
            showSkipButton: true,
            skip: Text("Lewat", style:GoogleFonts.notoSans()),
            next: Text("Lanjut", style:GoogleFonts.notoSans()),
            done: Text("Selesai", style:GoogleFonts.notoSans()),
            isProgress: true,
            onSkip: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return LoginRegisterPage();
              }));
            },
            onDone: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return LoginRegisterPage();
              }));
            },
            dotsDecorator: DotsDecorator(
                size: const Size.square(10.0),
                activeSize: const Size(20.0, 10.0),
                activeColor: Colors.blueAccent,
                color: Colors.black,
                spacing: const EdgeInsets.symmetric(horizontal: 3.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0))),
          ),
        ),
      ),
    );
  }
}