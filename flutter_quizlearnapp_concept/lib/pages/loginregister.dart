part of 'pages.dart';

class LoginRegisterPage extends StatefulWidget {
  LoginRegisterPage({Key key}) : super(key: key);

  @override
  State<LoginRegisterPage> createState() => _LoginRegisterPageState();
}

class _LoginRegisterPageState extends State<LoginRegisterPage> {
  
  //Sign In
  final ctrlEmail = TextEditingController();
  final ctrlPassword = TextEditingController();
  bool isLoading = false;
  //Sign Up
  final ctrlName = TextEditingController();
  final ctrlUsia = TextEditingController();
  final ctrlProfesi = TextEditingController();

  @override
  void dispose() {
    ctrlEmail.dispose();
    ctrlPassword.dispose();
    ctrlName.dispose();
    ctrlUsia.dispose();
    ctrlProfesi.dispose();
    super.dispose();
  }

  void clearForm() {
    ctrlEmail.clear();
    ctrlPassword.clear();
    ctrlName.clear();
    ctrlUsia.clear();
    ctrlProfesi.clear();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 20.h,
                child: Center(
                  child: Text("Quiz Game Edukasi Komputer"),
                ),
              ),
              SizedBox(
                child: TabBar(tabs: [
                  Tab(
                    text: "Masuk",
                  ),
                  Tab(
                    text: "Daftar",
                  ),
                  Expanded(
                      child: TabBarView(
                    children: <Widget>[
                      //Login
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: 20),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: ctrlEmail,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.account_circle_outlined),
                                labelText: 'Email',
                                hintText: "Tuliskan Email Anda",
                                border: OutlineInputBorder()),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: ctrlPassword,
                            obscureText: true,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.password),
                                labelText: 'Password',
                                border: OutlineInputBorder()),
                          ),
                          SizedBox(height: 30),
                          ButtonBar(
                            alignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ElevatedButton.icon(
                                icon: Icon(Icons.login),
                                label: const Text("Sign In"),
                                onPressed: () async {
                                  if (ctrlEmail.text == "" ||
                                      ctrlPassword.text == "") {
                                    Fluttertoast.showToast(
                                      msg: "Masukan semua data terlebih dahulu",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      backgroundColor: Colors.redAccent,
                                      textColor: Colors.white,
                                      fontSize: 16.0,
                                    );
                                  } else {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    String result = await AuthServices.signIn(
                                        ctrlEmail.text, ctrlPassword.text);
                                    if (result == "sukses") {
                                      Fluttertoast.showToast(
                                        msg: "Sukses",
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
                                        return SelectPage();
                                      }));
                                    } else {
                                      Fluttertoast.showToast(
                                        msg: result,
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        backgroundColor: Colors.redAccent,
                                        textColor: Colors.white,
                                        fontSize: 16.0,
                                      );
                                      setState(() {
                                        isLoading = false;
                                      });
                                    }
                                  }
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      //Register
                      Column(
                        children: <Widget>[
                          SizedBox(height: 10),
                          TextFormField(
                            controller: ctrlName,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.account_circle),
                                labelText: 'Nama',
                                hintText: "Tuliskan nama Anda",
                                border: OutlineInputBorder()),
                          ),
                          TextFormField(
                            controller: ctrlUsia,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.account_circle),
                                labelText: 'Usia',
                                hintText: "Tuliskan usia Anda",
                                border: OutlineInputBorder()),
                          ),
                          TextFormField(
                            controller: ctrlProfesi,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.account_circle),
                                labelText: 'Usia',
                                hintText: "Tuliskan usia Anda",
                                border: OutlineInputBorder()),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: ctrlEmail,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.account_circle),
                                labelText: 'Email',
                                hintText: "Tuliskan email Anda",
                                border: OutlineInputBorder()),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Please a Enter';
                              }
                              if (!RegExp(
                                      "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                  .hasMatch(value)) {
                                return 'Please a valid Email';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: ctrlPassword,
                            obscureText: true,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.account_circle),
                                labelText: 'Password',
                                border: OutlineInputBorder()),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Please a Enter Password';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 40),
                          ElevatedButton.icon(
                            icon: Icon(Icons.upload),
                            onPressed: () async {
                              if (ctrlName.text == "" ||
                                  ctrlEmail.text == "" ||
                                  ctrlPassword.text == "" ||
                                  ctrlUsia.text == "" ||
                                  ctrlProfesi.text == "") {
                                Fluttertoast.showToast(
                                  msg: "Please fill all fields",
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
                                if (result == "Success") {
                                  Fluttertoast.showToast(
                                    msg: "Success",
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
                                    return MenuPage();
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
                        ],
                      )
                    ],
                  ))
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
