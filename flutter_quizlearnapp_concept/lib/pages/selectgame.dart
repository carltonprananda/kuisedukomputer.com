part of 'pages.dart';

class SelectGamePage extends StatelessWidget {
  const SelectGamePage({Key key, this.stagemode}) : super(key: key);

  final int stagemode;

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
    List<String> judul2 = [
      "Komputer Dasar",
      "Sistem Operasi",
      "Keamanan Komputer",
      "Microsoft Windows",
      "Mac OS",
      "True False Komputer Dasar",
      "True False Windows"
    ];
    List<String> deskripsijudul2 = [
      "Latihan Quiz Komputer Dasar",
      "Latihan Quiz Sistem Operasi",
      "Latihan Quiz Keamanan Komputer",
      "Latihan Quiz Microsoft Windows",
      "Latihan Quiz Mac OS",
      "Latihan Quiz Komputer Dasar dalam True False",
      "Latihan Quiz Windows dalam True False",
    ];
    List<String> juduldenganmode2 = [
      "Single Round - Komputer Dasar",
      "Single Round - Sistem Operasi",
      "Single Round - Keamanan Komputer",
      "Single Round - Microsoft Windows",
      "Single Round - Mac OS",
      "True False - Komputer Dasar",
      "True False - Windows",
    ];
    List<String> deskripsi2 = [
      "Tentang Komputer Dasar mengenai komponen komputer serta definisi dasar tentang komputer",
      "Tentang Sistem Operasi mengenai OS-OS jenis serta contohnya",
      "Tentang Keamanan Komputer seperti Virus dan sejenisnya",
      "Seputar Microsoft Windows dan hal yang perlu diketahui tentang Microsoft Windows",
      "Seputar Mac OS dan hal yang perlu diketahui tentang Mac OS",
      "Latihan Quiz Komputer Dasar dalam True False",
      "Latihan Quiz Windows dalam True False",
    ];
    List<List<Question>> tourstage2 = [
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
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (stagemode == 0) ...[
                  JudulMode(
                    mode: "Multi Round",
                    deskripsimode:
                        "Uji kepahaman komputer dengan 3 babak yang berbeda",
                    imageasset: 'assets/pngs/hierarchy-300x300.png',
                    warnagaris: Colors.greenAccent,
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
                ] else if (stagemode == 1) ...[
                  JudulMode(
                    mode: "Single Round",
                    deskripsimode: "Cocok untuk latihan dan basic",
                    imageasset: 'assets/pngs/category-300x300.png',
                    warnagaris: Colors.blueAccent,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: judul2.length,
                    itemBuilder: (context, index) {
                      return ListMenuGameplay1(
                        judul: judul2[index],
                        deskripsijudul: deskripsijudul2[index],
                        juduldenganmode: juduldenganmode2[index],
                        deskripsi: deskripsi2[index],
                        tourstage: tourstage2[index],
                      );
                    },
                  ),
                ]
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
        body: const TabBarView(children: [
          SelectGamePage(stagemode: 0),
          SelectGamePage(stagemode: 1)
        ]),
      ),
    );
  }
}
