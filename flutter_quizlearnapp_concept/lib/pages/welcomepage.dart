part of 'pages.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  String uid, name, email;
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
            Text("Selamat Datang di Kuis Edukasi Komputer berbasis Flutter",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp)),
            ListView(
              shrinkWrap: true,
              padding: EdgeInsets.all(10),
              children: <Widget>[
                ListTile(
                  isThreeLine: true,
                  subtitle: Text(
                      "Uji Kemampuan dengan Pre-test, Test dan Post-test."),
                  title: Text("Multi-Round Mode", style:TextStyle(fontWeight: FontWeight.bold)),
                  leading: Icon(Icons.list, color: Colors.blueAccent,)),
                ListTile(
                  isThreeLine: true,
                  subtitle: Text("Latih kepahaman Komputer"),
                  title: Text("Single Round Mode", style:TextStyle(fontWeight: FontWeight.bold)),
                  leading: Icon(Icons.drag_handle_outlined, color: Colors.blueAccent,)
                ),
                ListTile(
                  isThreeLine: true,
                  subtitle: Text("Nilai hasil penilaian dan Ukur Kepahaman Anda dalam komputer"),
                  title:
                      Text("Rating Nilai dan Rating Kepahaman", style:TextStyle(fontWeight: FontWeight.bold)),
                  leading: Icon(Icons.star, color: Colors.yellowAccent,)
                ),
                ListTile(
                  isThreeLine: true,
                  subtitle: Text("Melihat hasil pengguna lainnya dalam quiz"),
                  title:
                      Text("Highscore", style:TextStyle(fontWeight: FontWeight.bold)),
                  leading: Icon(Icons.scoreboard, color: Colors.blueAccent)
                ),
                ListTile(
                  isThreeLine: true,
                  subtitle: Text("Materi tentang Komputer seperti"),
                  title:
                      Text("Materi Quiz tentang Komputer", style:TextStyle(fontWeight: FontWeight.bold)),
                  leading: Icon(Icons.menu_book, color: Colors.orangeAccent,)
                ),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              height: 10.h,
              child: Container(
                color: Colors.blueAccent,
                child: Center(
                  child: AnimatedTextKit(
                    isRepeatingAnimation: true,
                      animatedTexts: [
                        ColorizeAnimatedText(
        "Kuis Edukasi Komputer berbasis Flutter".toUpperCase(),
        colors: [Colors.white54, Colors.white70],
        textStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.sp
        ),
        textAlign: TextAlign.center
      ),
                        ],
                      ),
                ),
              ),
            ),
            ListView(
              shrinkWrap: true,
              padding: EdgeInsets.all(10),
              children: <Widget>[
                ListTile(
                  isThreeLine: true,
                  subtitle: Text(
                      "Pilih salah satu dari 2 Mode Uji Kemampuan Kepahaman Anda tentang Komputer"),
                  title: Text("Two Quiz Mode", style:TextStyle(fontWeight: FontWeight.bold)),
                  leading: Icon(Icons.list, color: Colors.blueAccent,)),
                ListTile(
                  isThreeLine: true,
                  subtitle: Text("Nilai hasil penilaian dan Ukur Kepahaman Anda dalam komputer"),
                  title:
                      Text("Rating Nilai dan Rating Kepahaman", style:TextStyle(fontWeight: FontWeight.bold)),
                  leading: Icon(Icons.star, color: Colors.yellowAccent,)
                ),
                ListTile(
                  isThreeLine: true,
                  subtitle: Text("Baca Materi Quiz tentang Komputer dan terkait Komputer"),
                  title:
                      Text("Materi Quiz tentang Komputer", style:TextStyle(fontWeight: FontWeight.bold)),
                  leading: Icon(Icons.menu_book, color: Colors.orangeAccent,)
                ),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return LoginRegisterPage();
                  }));
                },
                child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Masuk",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.permanentMarker(
                        fontSize: 24.sp
                      )
                    ))),
          ],
        ),
      ),
    );
  }
}
