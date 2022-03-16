part of 'pages.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isLoading = false;
  bool loginpassword = true;
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
  void dispose() {
    ctrlEmail.dispose();
    ctrlPassword.dispose();
    ctrlName.dispose();
    ctrlUsia.dispose();
    ctrlProfesi.dispose();
    ctrlconfirmPassword.dispose();
    super.dispose();
  }

  void clearForm() {
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
        title: Text("Pilih Profesi saat ini"),
        content: SizedBox(
          height: 100,
          child: CupertinoPicker(
            itemExtent: 30,
            backgroundColor: Colors.transparent,
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
        title: Text("Usia Saat ini"),
        content: SizedBox(
          height: 100,
          child: CupertinoPicker(
            itemExtent: 30,
            backgroundColor: Colors.transparent,
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
      theme: ThemeData(brightness: Brightness.light),
      themeMode: ThemeMode.system,
      darkTheme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Daftar"),
        ),
        body: Stack(children: <Widget>[
          Container(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 10),
                  SingleChildScrollView(
                      child: Column(children: <Widget>[
                    TextFormField(
                      controller: ctrlName,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          labelText: 'Nama',
                          hintText: "Tuliskan nama Anda",
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      onTap: () => usiapicker(context),
                      onChanged: (text) {
                        currentusia;
                      },
                      inputFormatters: [LengthLimitingTextInputFormatter(2)],
                      keyboardType: TextInputType.number,
                      controller: ctrlUsia,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.onetwothree),
                          labelText: 'Usia',
                          hintText: "Tuliskan usia Anda",
                          border: OutlineInputBorder()),
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
                    SizedBox(height: 10),
                    TextFormField(
                      onTap: () => jobpicker(context),
                      onChanged: (text) {
                        currentprofesi;
                      },
                      keyboardType: TextInputType.none,
                      controller: ctrlProfesi,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.business_center),
                          labelText: 'Profesi',
                          hintText: "Tuliskan usia Anda",
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: ctrlEmail,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          labelText: 'Email',
                          hintText: "Tuliskan email Anda",
                          border: OutlineInputBorder()),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Mohon Masukan Email';
                        }
                        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                            .hasMatch(value)) {
                          return 'Mohon isikan email dengan format nama@email.domain';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: ctrlPassword,
                      obscureText: true,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.password),
                          labelText: 'Password',
                          border: OutlineInputBorder()),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Masukan Password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: ctrlconfirmPassword,
                      obscureText: true,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.password),
                          labelText: 'Konfirmasi Password',
                          border: OutlineInputBorder()),
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
                    label: Text("Daftar"),
                    icon: isLoading
                        ? Icon(Icons.app_registration_rounded)
                        : Icon(Icons.upload),
                    onPressed: () async {
                      if (ctrlName.text == "" ||
                          ctrlEmail.text == "" ||
                          ctrlPassword.text == "" ||
                          ctrlUsia.text == "" ||
                          ctrlProfesi.text == "") {
                        Fluttertoast.showToast(
                          msg: "Mohon masukan semua data",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
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
                        if (result == result) {
                          Fluttertoast.showToast(
                            msg: "Sukses",
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
                          Fluttertoast.showToast(
                            msg: result,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                          setState(() {
                            isLoading = false;
                            clearForm();
                          });
                        }
                      }
                    },
                  ),
                  ElevatedButton.icon(
                    icon:
                        isLoading ? Icon(Icons.lock_clock) : Icon(Icons.login),
                    label: const Text("Masuk"),
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return LoginPage();
                      }));
                    },
                  )
                ],
              ),
            ),
          ),
          isLoading == true
              ? Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.transparent,
                  child: SpinKitFadingCircle(
                    size: 50,
                    color: Colors.blue,
                  ),
                )
              : Container()
        ]),
      ),
    );
  }
}
