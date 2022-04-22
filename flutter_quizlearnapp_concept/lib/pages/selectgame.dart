part of 'pages.dart';

class SelectGamePage extends StatelessWidget {
  const SelectGamePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> judul = [
      "Quiz Komputer Dasar",
      "Quiz Sistem Operasi",
      "True False Sistem Operasi"
    ];
    List<String> deskripsijudul = [
      "3 Round seputar Komputer Dasar",
      "3 Round seputar Sistem Operasi",
      "3 Round Sistem Operasi dalam True False"
    ];
    List<String> juduldenganmode = [
      "Multi Round - Komputer Dasar",
      "Multi Round - Sistem Operasi",
      "Multi Round - True False Sistem Operasi"
    ];
    List<String> deskripsi = [
      "Uji Kemampuan Komputer Dasar dengan 3 Babak",
      "Uji Kemampuan Sistem Operasi dengan 3 Babak",
      "Uji Kemampuan True False Sistem Operasi dengan 3 Babak"
    ];
    List<List<Question>> tourstage = [tourstage111, tourstage121, tourstage311];
    List<String> assetfolder = [
      "assets/docs/GEKomnon_KomputerDasar.pdf",
      "assets/docs/GEKomnon_SistemOperasi.pdf",
      "assets/docs/GEKomnon_SistemOperasi.pdf"
    ];
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
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: judul.length,
                  itemBuilder: (context, index) {
                    return ListMenuGameplay2(
                        judul: judul[index],
                        deskripsijudul: deskripsijudul[index],
                        juduldenganmode: juduldenganmode[index],
                        deskripsi: deskripsi[index],
                        tourstage: tourstage[index],
                        assetfolder: assetfolder[index]);
                  },
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
    List<String> judul = [
      "Komputer Dasar",
      "Sistem Operasi",
      "Keamanan Komputer",
      "Microsoft Windows",
      "Mac OS",
      "True False Komputer Dasar",
      "True False Windows"
    ];
    List<String> deskripsijudul = [
      "Latihan Quiz Komputer Dasar",
      "Latihan Quiz Sistem Operasi",
      "Latihan Quiz Keamanan Komputer",
      "Latihan Quiz Microsoft Windows",
      "Latihan Quiz Mac OS",
      "Latihan Quiz Komputer Dasar dalam True False",
      "Latihan Quiz Windows dalam True False",
    ];
    List<String> juduldenganmode = [
      "Single Round - Komputer Dasar",
      "Single Round - Sistem Operasi",
      "Single Round - Keamanan Komputer",
      "Single Round - Microsoft Windows",
      "Single Round - Mac OS",
      "True False - Komputer Dasar",
      "True False - Windows",
    ];
    List<String> deskripsi = [
      "Tentang Komputer Dasar mengenai komponen komputer serta definisi dasar tentang komputer",
      "Tentang Sistem Operasi mengenai OS-OS jenis serta contohnya",
      "Tentang Keamanan Komputer seperti Virus dan sejenisnya",
      "Seputar Microsoft Windows dan hal yang perlu diketahui tentang Microsoft Windows",
      "Seputar Mac OS dan hal yang perlu diketahui tentang Mac OS",
      "Latihan Quiz Komputer Dasar dalam True False",
      "Latihan Quiz Windows dalam True False",
    ];
    List<List<Question>> tourstage = [
      tourstage111,
      tourstage121,
      tourstage122,
      tourstage221,
      tourstage222,
      tourstage311,
      tourstage321,
    ];
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
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: judul.length,
                  itemBuilder: (context, index) {
                    return ListMenuGameplay1(
                      judul: judul[index],
                      deskripsijudul: deskripsijudul[index],
                      juduldenganmode: juduldenganmode[index],
                      deskripsi: deskripsi[index],
                      tourstage: tourstage[index],
                    );
                  },
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
