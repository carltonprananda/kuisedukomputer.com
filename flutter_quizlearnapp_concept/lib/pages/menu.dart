part of 'pages.dart';

class MenuPage extends StatefulWidget {
  MenuPage({Key key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  bool isloading;
  int selectedIndex = 1;
  String judul;
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
          }
          break;
        case 1:
          {
            judul = "Pilih Quiz";
          }
          break;
        case 2:
          {
            judul = "Profil";
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
    return AnimatedSwitcher(
      transitionBuilder: AnimatedSwitcher.defaultTransitionBuilder,
      duration: const Duration(milliseconds: 500),
      switchInCurve: Curves.easeInOut,
      child: Scaffold(
        appBar: AppBar(
          title: Text(judul),
          centerTitle: true,
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                  child: Column(
                children: <Widget>[
                  Text(name ?? '', style: TextStyle(fontSize: 10.sp)),
                  Text(email ?? '', style: TextStyle(fontSize: 10.sp)),
                ],
              )),
              ListTile(
                leading: Icon(Icons.info),
                title: Text("Tentang Game"),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Game Edukasi Non-Linear Komputer",
                              textAlign: TextAlign.center),
                          content: Text(
                              "2022, Game dibuat oleh Vincentius Dean Prananda \nGame ini dibuat untuk memenuhi Tugas Akhir Vincentius Dean Prananda"),
                        );
                      });
                },
              ),
              ListTile(
                leading: Icon(Icons.open_in_browser),
                title: Text("Survey tentang Game"),
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text("Signout"),
                onTap: () {
                  showDialog(
                      barrierColor: Colors.blueAccent.withAlpha(200),
                      barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title:
                              Text("Konfirmasi", textAlign: TextAlign.center),
                          content: Text("Apakah Anda ingin signout?"),
                          actions: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: TextButton(
                                      onPressed: () async {
                                        setState(() {
                                          isloading = true;
                                          SpinKitCircle(
                                            color: Colors.blueAccent,
                                            size: 50,
                                          );
                                        });
                                        await AuthServices.signout()
                                            .then((value) {
                                          if (value) {
                                            Fluttertoast.showToast(
                                              msg: "berhasil keluar, terimakasih telah menggunakan aplikasi ini",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              backgroundColor:
                                                  Colors.greenAccent,
                                              textColor: Colors.white,
                                              fontSize: 16.0,
                                            );
                                            Navigator.pushReplacement(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return LoginRegisterPage();
                                            }));
                                            setState(() {
                                              isloading = false;
                                            });
                                          } else {
                                            setState(() {
                                              isloading = false;
                                            });
                                          }
                                        });
                                      },
                                      child: Text("Ya"),
                                    ),
                                  ),
                                  Expanded(
                                    child: TextButton(
                                      child: Text("Tidak"),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  )
                                ])
                          ],
                        );
                      });
                },
              )
            ],
          ),
        ),
        body: IndexedStack(index: selectedIndex, children: widgetOptions),
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.format_list_numbered_rtl),
                  label: 'High Score'),
              BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profil'),
            ],
            currentIndex: selectedIndex,
            backgroundColor: Colors.blueAccent,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.lightBlueAccent,
            onTap: _onItemtapped,
            iconSize: 18,
          ),
        ),
      ),
    );
  }
}
