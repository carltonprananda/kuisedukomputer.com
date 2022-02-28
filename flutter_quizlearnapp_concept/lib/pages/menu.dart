part of 'pages.dart';

class MenuPage extends StatefulWidget {
  MenuPage({Key key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}


class _MenuPageState extends State<MenuPage> {
  int selectedIndex = 1;
  String judul;
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
        {judul = "High Score";}
        break;
        case 1:
        {judul = "Pilih Quiz";}
        break;
        case 2:
        {judul = "Profil";}
        break;
      }
    });
  }

  @override
  void initState(){
    widgetOptions.add(HighscorePage());
    widgetOptions.add(SelectPage());
    widgetOptions.add(ProfilePage());
    judul = "Quiz Komputer";
    //pageController = PageController();
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
          body: IndexedStack(index: selectedIndex, children: widgetOptions),
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10)
            ),
            child: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(icon: Icon(Icons.format_list_numbered_rtl),label: 'High Score'),
                BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),      
                BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profil'),
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


