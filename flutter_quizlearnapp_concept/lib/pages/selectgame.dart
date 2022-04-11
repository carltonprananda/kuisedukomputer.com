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
                ListTile(
                  title: Text("Multi Round",
                      style: GoogleFonts.notoSans(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  subtitle: Text(
                      "Uji kepahaman komputer dengan 3 babak yang berbeda",
                      style: GoogleFonts.notoSans(fontSize: 14)),
                  trailing: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.asset('assets/pngs/hierarchy-300x300.png'),
                  ),
                ),
                Divider(
                  color: Colors.greenAccent,
                  thickness: 5,
                  endIndent: 100,
                ),
                ListMenuGameplay2(
                    judul: "Quiz Komputer Dasar",
                    deskripsijudul: "3 Round seputar Komputer Dasar",
                    juduldenganmode: "Multi Round - Komputer Dasar",
                    deskripsi: "Uji Kemampuan Komputer Dasar dengan 3 Babak",
                    tourstage: tourstage111,
                    assetfolder: "assets/docs/GEKomnon_KomputerDasar.pdf"),
                ListMenuGameplay2(
                    judul: "Quiz Sistem Operasi",
                    deskripsijudul: "3 Round seputar Komputer Dasar",
                    juduldenganmode: "Multi Round - Sistem Operasi",
                    deskripsi: "Uji Kemampuan Sistem Operasi dengan 3 Babak",
                    tourstage: tourstage121,
                    assetfolder: "assets/docs/GEKomnon_SistemOperasi.pdf"),
                ListMenuGameplay2(
                    judul: "True False Sistem Operasi",
                    deskripsijudul: "3 Round seputar Komputer Dasar",
                    juduldenganmode: "Multi Round - True False Sistem Operasi",
                    deskripsi: "Uji Kemampuan Sistem Operasi dengan 3 Babak",
                    tourstage: tourstage311,
                    assetfolder: "assets/docs/GEKomnon_SistemOperasi.pdf"),
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
          height: MediaQuery.of(context).size.height,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ListTile(
                  title: Text("Single Round",
                      style: GoogleFonts.notoSans(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  subtitle: Text("Cocok untuk latihan dan basic",
                      style: GoogleFonts.notoSans(fontSize: 14)),
                  trailing: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.asset('assets/pngs/category-300x300.png'),
                  ),
                ),
                Divider(
                  color: Colors.blueAccent,
                  thickness: 5,
                  endIndent: 100,
                ),
                ListMenuGameplay1(
                    judul: "Komputer Dasar",
                    deskripsijudul: "Latihan Quiz Komputer Dasar",
                    juduldenganmode: "Single Round - Komputer Dasar",
                    deskripsi:
                        "Tentang Komputer Dasar mengenai komponen komputer serta definisi dasar tentang komputer",
                    tourstage: tourstage111),
                ListMenuGameplay1(
                    judul: "Sistem Operasi",
                    deskripsijudul: "Latihan Quiz Sistem Operasi",
                    juduldenganmode: "Single Round - Sistem Operasi",
                    deskripsi:
                        "Tentang Sistem Operasi mengenai OS-OS jenis serta contohnya",
                    tourstage: tourstage121),
                ListMenuGameplay1(
                    judul: "Keamanan Komputer",
                    deskripsijudul: "Latihan Quiz Keamanan Komputer",
                    juduldenganmode: "Single Round - Keamanan Komputer",
                    deskripsi:
                        "Tentang Keamanan Komputer seperti Virus dan sejenisnya",
                    tourstage: tourstage122),
                ListMenuGameplay1(
                    judul: "Microsoft Windows",
                    deskripsijudul: "Latihan Quiz Microsoft Windows",
                    juduldenganmode: "Single Round - Microsoft Windows",
                    deskripsi:
                        "Seputar Microsoft Windows dan hal yang perlu diketahui tentang Microsoft Windows",
                    tourstage: tourstage221),
                ListMenuGameplay1(
                    judul: "Mac OS",
                    deskripsijudul: "Latihan Quiz Mac OS",
                    juduldenganmode: "Single Round - Mac OS",
                    deskripsi:
                        "Seputar Mac OS dan hal yang perlu diketahui tentang Mac OS",
                    tourstage: tourstage222),
                ListMenuGameplay1(
                    judul: "True False Komputer Dasar",
                    deskripsijudul:
                        "Latihan Quiz Komputer Dasar dalam True False",
                    juduldenganmode: "True False - Mac OS",
                    deskripsi: "True False seputar Komputer Dasar",
                    tourstage: tourstage311),
                ListMenuGameplay1(
                    judul: "True False Windows ",
                    deskripsijudul: "Latihan Quiz Windows dalam True False",
                    juduldenganmode: "True False - Windows",
                    deskripsi: "True False seputar Windows",
                    tourstage: tourstage321),
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
          labelColor: Colors.blueAccent[200],
          unselectedLabelColor: Colors.blueGrey,
          indicatorColor: Colors.blueAccent,
          labelStyle: GoogleFonts.openSans(fontWeight: FontWeight.bold),
          unselectedLabelStyle:
              GoogleFonts.openSans(fontWeight: FontWeight.normal),
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
