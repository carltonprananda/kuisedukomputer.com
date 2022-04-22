part of 'pages.dart';

class MenuPage extends StatefulWidget {
  MenuPage({Key key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  bool isLoading;
  int selectedIndex = 1;
  String judul;
  Color onitemcolor = Colors.blueAccent;
  Color appbottomcolor = Colors.lightBlueAccent;
  static CollectionReference<Map<String, dynamic>> userCollection =
      FirebaseFirestore.instance.collection("users");
  static User auth = FirebaseAuth.instance.currentUser;

  String name, email;
  void getUserUpdate() async {
    userCollection.doc(auth.uid).snapshots().listen((event) {
      name = event.data()['name'];
      email = event.data()['email'];
      setState(() {});
    });
  }

  void _launchURLBrowser() async {
    const url = 'https://forms.gle/t1LsthPcy9G7jx3T9';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  //PageController pageController;
  static List<Widget> widgetOptions = <Widget>[
    HighscorePage(),
    SelectPage(),
    ProfilePage(),
  ];
  void _onItemtapped(int index) {
    setState(() {
      selectedIndex = index;
      //pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.easeIn);
      switch (index) {
        case 0:
          {
            judul = "High Score";
            onitemcolor = Colors.lightBlueAccent.shade100;
            appbottomcolor = Colors.lightBlueAccent.shade400;
          }
          break;
        case 1:
          {
            judul = "Pilih Quiz";
            onitemcolor = Colors.green;
            appbottomcolor = Colors.greenAccent.shade400;
          }
          break;
        case 2:
          {
            judul = "Profil";
            onitemcolor = Colors.blueAccent.shade200;
            appbottomcolor = Colors.blueAccent.shade700;
          }
          break;
      }
    });
  }

  @override
  void initState() {
    widgetOptions.add(HighscorePage());
    widgetOptions.add(SelectPage());
    widgetOptions.add(ProfilePage());
    judul = "Quiz Komputer";
    //pageController = PageController();
    getUserUpdate();
    super.initState();
  }

  @override
  void dispose() {
    //pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text(judul,
            style: GoogleFonts.notoSans(
                fontWeight: FontWeight.bold, color: onitemcolor)),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: Icon(Icons.menu, color: onitemcolor)),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: appbottomcolor,
          elevation: 4,
          child: const Icon(Icons.play_arrow),
          onPressed: () => _onItemtapped(1)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawer: Drawer(
        backgroundColor: Colors.transparent,
        elevation: 1,
        child: ListView(
          children: <Widget>[
            DrawerHeader(
                child: Column(
              children: <Widget>[
                Text(name ?? '',
                    style: GoogleFonts.openSans(fontSize: 12, color: Colors.white)),
                Text(email ?? '',
                    style: GoogleFonts.openSans(fontSize: 12, color: Colors.white)),
              ],
            )),
            ListTile(
              leading: Icon(Icons.info, color: Colors.white),
              title: Text("Tentang Game",
                  style: GoogleFonts.openSans(fontSize: 12, color: Colors.white)),
              onTap: () {
                showGeneralDialog(
                    pageBuilder: (context, an1, an2) {},
                    barrierDismissible: true,
                    barrierLabel: "Tentang Game",
                    context: context,
                    barrierColor: Colors.transparent.withOpacity(0.75),
                    transitionDuration: Duration(milliseconds: 300),
                    transitionBuilder: (context, a1, a2, wi) {
                      return Transform.scale(
                        scale: a1.value,
                        child: AlertDialog(
                          title: Text("Game Edukasi Non-Linear Komputer",
                              textAlign: TextAlign.center),
                          content: Text(
                              "2022, Game dibuat oleh Vincentius Dean Prananda \tGame ini dibuat untuk memenuhi Tugas Akhir Vincentius Dean Prananda"),
                        ),
                      );
                    });
              },
            ),
            ListTile(
              onTap: () async {
                String url = "https://forms.gle/t1LsthPcy9G7jx3T9";
                var urllaunchable = await canLaunch(
                    url); //canLaunch is from url_launcher package
                if (urllaunchable) {
                  await launch(
                      url); //launch is from url_launcher package to launch URL
                } else {
                  print("URL can't be launched.");
                }
              },
              leading: Icon(Icons.open_in_browser, color: Colors.white),
              title: Text("Survey tentang Game",
                  style: GoogleFonts.openSans(fontSize: 12, color: Colors.white)),
            ),
            ListTile(
              onTap: () {
                showGeneralDialog(
                    pageBuilder: (context, an1, an2) {},
                    barrierDismissible: true,
                    barrierLabel: "Bantuan Game",
                    context: context,
                    barrierColor: Colors.transparent.withOpacity(0.75),
                    transitionDuration: Duration(milliseconds: 300),
                    transitionBuilder: (context, a1, a2, wi) {
                      return Transform.scale(
                        scale: a1.value,
                        child: AlertDialog(
                          title:
                              Text("Cara Bermain", textAlign: TextAlign.center),
                          content: Text(
                              "Game ini terdiri atas 2 mode game,\t Single Round Gameplay dan Multiround Gameplay, Single Round merupakan game dengan jenis satu babak yang bertujuan untuk melatih kepahaman pengguna dalam komputer sedangkan multi-round gameplay adalah "),
                        ),
                      );
                    });
              },
              leading: Icon(Icons.help_rounded, color: Colors.white),
              title: Text("Bantuan",
                  style: GoogleFonts.openSans(fontSize: 12, color: Colors.white)),
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.white),
              title: Text("Signout",
                  style: GoogleFonts.openSans(fontSize: 12, color: Colors.white)),
              onTap: () {
                showGeneralDialog(
                    barrierDismissible: false,
                    context: context,
                    barrierColor: Colors.transparent.withOpacity(0.75),
                    transitionDuration: Duration(milliseconds: 300),
                    transitionBuilder: (context, a1, a2, wi) {
                      return Transform.scale(
                          scale: a1.value,
                          child: AlertDialog(
                            title: Text(
                              "Konfirmasi",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.notoSans(
                                  fontWeight: FontWeight.bold, fontSize: 24),
                            ),
                            content: Text("Apakah Anda ingin signout?",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.notoSans()),
                            actions: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.redAccent,
                                      textStyle: GoogleFonts.notoSans(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    onPressed: () async {
                                      setState(() {
                                        isLoading = true;
                                      });
                                      await AuthServices.signout()
                                          .then((value) {
                                        if (value) {
                                          Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                              return LoginRegisterPage();
                                            }),
                                            (route) => false,
                                          );
                                          setState(() {
                                            isLoading = false;
                                          });
                                        } else {
                                          setState(() {
                                            isLoading = false;
                                          });
                                        }
                                      });
                                    },
                                    child: Text("Ya"),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      textStyle: GoogleFonts.notoSans(),
                                    ),
                                    child: Text("Tidak"),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  )
                                ],
                              ),
                            ],
                          ));
                    },
                    pageBuilder: (context, an1, an2) {});
              },
            )
          ],
        ),
      ),
      body: IndexedStack(index: selectedIndex, children: widgetOptions),
      bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          child: BottomAppBar(
            shape: CircularNotchedRectangle(),
            notchMargin: 1,
            color: appbottomcolor,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Stack(children: [
                  IconButton(
                    highlightColor: Colors.white,
                    icon: Icon(Icons.list),
                    onPressed: () => _onItemtapped(0),
                  ),
                ]),
                IconButton(
                    highlightColor: Colors.white,
                    icon: Icon(Icons.person),
                    onPressed: () => _onItemtapped(2)),
              ],
            ),
          )),
    );
  }
}
