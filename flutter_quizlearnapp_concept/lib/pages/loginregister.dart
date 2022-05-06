part of 'pages.dart';

class LoginRegisterPage extends StatefulWidget {
  LoginRegisterPage({Key key}) : super(key: key);

  @override
  State<LoginRegisterPage> createState() => _LoginRegisterPageState();
}

class _LoginRegisterPageState extends State<LoginRegisterPage>
    with SingleTickerProviderStateMixin {
  //Sign In
  final ctrlLoginEmail = TextEditingController();
  final ctrlLoginPassword = TextEditingController();
  bool isLoading = false;
  bool loginpassword = true;
  bool regpassword = true;
  bool regconfirmpassword = true;
  //Sign Up
  final ctrlEmail = TextEditingController();
  final ctrlPassword = TextEditingController();
  final ctrlName = TextEditingController();
  final ctrlUsia = TextEditingController();
  final ctrlProfesi = TextEditingController();
  final ctrlconfirmPassword = TextEditingController();
  int umur;
  List<String> profesi = [
    "",
    "Siswa",
    "Mahasiswa",
    "Guru",
    "Dosen",
    "Pekerja",
    "Wiraswasta",
    "Ibu Rumah Tangga",
    "Non-Mahasiswa"
  ];
  String currentprofesi, currentusia;
  TabController tabController;
  var usia = [for (var i = 6; i <= 99; i++) i];

  @override
  void initState() {
    tabController = new TabController(length: 2, vsync: this);
    loginpassword = true;
    super.initState();
  }

  @override
  void dispose() {
    ctrlLoginEmail.dispose();
    ctrlLoginPassword.dispose();
    ctrlEmail.dispose();
    ctrlPassword.dispose();
    ctrlName.dispose();
    ctrlUsia.dispose();
    ctrlProfesi.dispose();
    ctrlconfirmPassword.dispose();
    tabController.dispose();
    super.dispose();
  }

  void clearForm() {
    ctrlLoginEmail.clear();
    ctrlLoginPassword.clear();
    ctrlEmail.clear();
    ctrlPassword.clear();
    ctrlName.clear();
    ctrlUsia.clear();
    ctrlProfesi.clear();
    ctrlconfirmPassword.clear();
  }

  void jobpicker(BuildContext bc) {
    showDialog(
      context: bc,
      barrierColor: Colors.lightBlueAccent.withOpacity(0.5),
      barrierDismissible: true,
      builder: (bc) => AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        title: Text(
          "Pilih Profesi saat ini",
          style: GoogleFonts.notoSans(fontWeight: FontWeight.bold),
        ),
        content: SizedBox(
          height: 100,
          child: CupertinoPicker(
            itemExtent: 30,
            backgroundColor: Colors.transparent.withOpacity(0.1),
            children: <Widget>[for (var item in profesi) Text(item)],
            onSelectedItemChanged: (value) {
              ctrlProfesi.text = profesi[value];
            },
          ),
        ),
      ),
    );
  }

  void usiapicker(BuildContext bc) {
    showDialog(
      context: bc,
      barrierColor: Colors.lightBlueAccent.withOpacity(0.5),
      barrierDismissible: true,
      builder: (bc) => AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        title: Text(
          "Usia Saat ini",
          style: GoogleFonts.notoSans(fontWeight: FontWeight.bold),
        ),
        content: SizedBox(
          height: 100,
          child: CupertinoPicker(
            itemExtent: 30,
            backgroundColor: Colors.transparent.withOpacity(0.1),
            children: <Widget>[for (var item in usia) Text(item.toString())],
            onSelectedItemChanged: (value) {
              ctrlUsia.text = usia[value].toString();
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.light),
      themeMode: ThemeMode.system,
      darkTheme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
          body: Container(
              child: Column(
        children: <Widget>[
          Container(
            color: Colors.blueAccent,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.14,
              child: Align(
                alignment: Alignment.center,
                child: AnimatedTextKit(
                  isRepeatingAnimation: true,
                  animatedTexts: [
                    ColorizeAnimatedText("Kuis Edukasi Komputer".toUpperCase(),
                        colors: [Colors.white54, Colors.white70],
                        textStyle: GoogleFonts.openSans(
                            fontWeight: FontWeight.bold, fontSize: 16),
                        textAlign: TextAlign.center),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            child: TabBar(
                labelPadding: EdgeInsets.symmetric(horizontal: 50),
                labelColor: Colors.blueAccent,
                indicatorColor: Colors.blueAccent,
                isScrollable: true,
                controller: tabController,
                labelStyle: GoogleFonts.openSans(fontWeight: FontWeight.bold),
                tabs: <Widget>[
                  Tab(
                    text: "Masuk",
                  ),
                  Tab(
                    text: "Daftar",
                  ),
                ]),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: <Widget>[
                //Login
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      style: GoogleFonts.openSans(),
                      keyboardType: TextInputType.emailAddress,
                      controller: ctrlLoginEmail,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(8),
                          prefixIcon: Icon(Icons.email),
                          labelText: 'Email',
                          hintText: "Tuliskan Email Anda",
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)))),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      style: GoogleFonts.openSans(),
                      controller: ctrlLoginPassword,
                      obscureText: loginpassword,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(8),
                          prefixIcon: Icon(Icons.password),
                          labelText: 'Password',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                loginpassword = !loginpassword;
                              });
                            },
                            child: Icon(loginpassword
                                ? Icons.visibility_off
                                : Icons.visibility),
                          )),
                    ),
                    SizedBox(height: 30),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: Colors.transparent,
                      ),
                      icon: isLoading
                          ? Icon(Icons.lock_clock, color: Colors.blueAccent)
                          : Icon(Icons.login, color: Colors.blueAccent),
                      label: Text("Masuk",
                          style: GoogleFonts.notoSans(
                              fontSize: 18, color: Colors.blueAccent)),
                      onPressed: () async {
                        if (ctrlLoginEmail.text == "" ||
                            ctrlLoginPassword.text == "") {
                          MotionToast(
                            description:
                                Text("Masukan semua data terlebih dahulu"),
                            primaryColor: Colors.redAccent,
                            secondaryColor: Colors.red[100],
                            icon: Icons.error,
                            enableAnimation: true,
                            animationCurve: Curves.fastOutSlowIn,
                            borderRadius: 25,
                            title: Text("Gagal"),
                            backgroundType: BACKGROUND_TYPE.transparent,
                            animationDuration: Duration(microseconds: 50),
                          ).show(context);
                        } else {
                          setState(() {
                            isLoading = true;
                          });
                          String result = await AuthServices.signIn(
                              ctrlLoginEmail.text, ctrlLoginPassword.text);
                          if (result == "success") {
                            Fluttertoast.showToast(
                              msg: "sukses",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.greenAccent,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                            setState(() {
                              isLoading = false;
                            });
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return MenuPage();
                            }));
                          } else {
                            MotionToast(
                              description: Text(result),
                              primaryColor: Colors.redAccent,
                              secondaryColor: Colors.red[100],
                              icon: Icons.error,
                              enableAnimation: true,
                              animationCurve: Curves.fastOutSlowIn,
                              borderRadius: 25,
                              title: Text("Gagal"),
                              backgroundType: BACKGROUND_TYPE.transparent,
                              animationDuration: Duration(microseconds: 50),
                            ).show(context);
                            setState(() {
                              isLoading = false;
                            });
                          }
                        }
                      },
                    ),
                  ],
                ),
                //Register
                SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 15),
                      SingleChildScrollView(
                          child: Column(children: <Widget>[
                        TextFormField(
                          style: GoogleFonts.openSans(),
                          controller: ctrlName,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(8),
                              prefixIcon: Icon(Icons.person),
                              labelText: 'Nama',
                              hintText: "Tuliskan nama Anda",
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)))),
                        ),
                        SizedBox(height: 15),
                        TextFormField(
                          style: GoogleFonts.openSans(),
                          onTap: () => usiapicker(context),
                          onChanged: (text) {
                            currentusia;
                          },
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(2)
                          ],
                          keyboardType: TextInputType.none,
                          controller: ctrlUsia,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(8),
                              prefixIcon: Icon(Icons.onetwothree),
                              labelText: 'Usia',
                              hintText: "Tuliskan usia Anda",
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)))),
                          validator: (String value) {
                            int value2 = int.parse(value);
                            if (value.isEmpty) {
                              return "Mohon masukaan Umur";
                            }
                            if (value2 < 6 || value2 > 100) {
                              return "Usia tidak mencukupi";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 15),
                        TextFormField(
                          style: GoogleFonts.openSans(),
                          onTap: () => jobpicker(context),
                          onChanged: (text) {
                            currentprofesi;
                          },
                          keyboardType: TextInputType.none,
                          controller: ctrlProfesi,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(8),
                              prefixIcon: Icon(Icons.business_center),
                              labelText: 'Profesi',
                              hintText: "Tuliskan usia Anda",
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)))),
                        ),
                        SizedBox(height: 15),
                        TextFormField(
                          style: GoogleFonts.openSans(),
                          keyboardType: TextInputType.emailAddress,
                          controller: ctrlEmail,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(8),
                              prefixIcon: Icon(Icons.email),
                              labelText: 'Email',
                              hintText: "Tuliskan email Anda",
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)))),
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Mohon Masukan Email';
                            }
                            if (!RegExp(
                                    "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                .hasMatch(value)) {
                              return 'Mohon isikan email dengan format nama@email.domain';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 15),
                        TextFormField(
                          style: GoogleFonts.openSans(),
                          controller: ctrlPassword,
                          obscureText: regpassword,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(8),
                              prefixIcon: Icon(Icons.password),
                              labelText: 'Password',
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    regpassword = !regpassword;
                                  });
                                },
                                child: Icon(regpassword
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                              )),
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Masukan Password';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 15),
                        TextFormField(
                          style: GoogleFonts.openSans(),
                          controller: ctrlconfirmPassword,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(8),
                              prefixIcon: Icon(Icons.password),
                              labelText: 'Konfirmasi Password',
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    regconfirmpassword = !regconfirmpassword;
                                  });
                                },
                                child: Icon(regconfirmpassword
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                              )),
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Please a Enter Password';
                            }
                            if (ctrlconfirmPassword != ctrlPassword) {
                              return 'Samakan password yang telah dimasukkan';
                            }
                            return null;
                          },
                        ),
                      ])),
                      SizedBox(height: 40),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: Colors.transparent,
                        ),
                        label: Text("Daftar",
                            style: GoogleFonts.notoSans(
                                fontSize: 18, color: Colors.blueAccent)),
                        icon: isLoading
                            ? Icon(Icons.app_registration_rounded,
                                color: Colors.blueAccent)
                            : Icon(Icons.upload, color: Colors.blueAccent),
                        onPressed: () async {
                          if (ctrlName.text == "" ||
                              ctrlEmail.text == "" ||
                              ctrlPassword.text == "" ||
                              ctrlUsia.text == "" ||
                              ctrlProfesi.text == "") {
                            MotionToast(
                              description: Text("Isikan semua data"),
                              primaryColor: Colors.redAccent,
                              secondaryColor: Colors.red[100],
                              icon: Icons.error,
                              enableAnimation: true,
                              animationCurve: Curves.fastOutSlowIn,
                              borderRadius: 25,
                              title: Text("Gagal"),
                              backgroundType: BACKGROUND_TYPE.transparent,
                              animationDuration: Duration(microseconds: 50),
                            ).show(context);
                          } else {
                            setState(() {
                              isLoading = true;
                            });
                            String result = await AuthServices.signUp(
                                ctrlEmail.text,
                                ctrlPassword.text,
                                ctrlName.text,
                                ctrlUsia.text,
                                ctrlProfesi.text);
                            if (result == "success") {
                              Fluttertoast.showToast(
                                msg: "sukses",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );
                              setState(() {
                                isLoading = false;
                                clearForm();
                              });
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return WelcomePage();
                              }));
                            } else {
                              MotionToast(
                                description: Text(result),
                                primaryColor: Colors.redAccent,
                                secondaryColor: Colors.red[100],
                                icon: Icons.error,
                                enableAnimation: true,
                                animationCurve: Curves.fastOutSlowIn,
                                borderRadius: 25,
                                title: Text("Gagal"),
                                backgroundType: BACKGROUND_TYPE.transparent,
                                animationDuration: Duration(microseconds: 50),
                              ).show(context);
                              setState(() {
                                isLoading = false;
                                clearForm();
                              });
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ))),
    );
  }
}
