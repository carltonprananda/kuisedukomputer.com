part of 'pages.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Sign In
  final ctrlEmail = TextEditingController();
  final ctrlPassword = TextEditingController();
  bool isLoading = false;
  bool loginpassword = true;

  @override
  void dispose() {
    ctrlEmail.dispose();
    ctrlPassword.dispose();

    super.dispose();
  }

  void clearForm() {
    ctrlEmail.clear();
    ctrlPassword.clear();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(brightness: Brightness.light),
        themeMode: ThemeMode.system,
        darkTheme: ThemeData(brightness: Brightness.dark),
        home: Scaffold(
            appBar: AppBar(
              title: Text("Masuk"),
            ),
            body: Stack(
              children: <Widget>[
              Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 20),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: ctrlEmail,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        labelText: 'Email',
                        hintText: "Tuliskan Email Anda",
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: ctrlPassword,
                    obscureText: loginpassword,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.password),
                        labelText: 'Password',
                        border: OutlineInputBorder(),
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
                    icon: isLoading ? Icon(Icons.lock_clock) : Icon(Icons.login),
                    label: const Text("Masuk"),
                    onPressed: () async {
                      if (ctrlEmail.text == "" || ctrlPassword.text == "") {
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
                        if (result == "success") {
                          Fluttertoast.showToast(
                            msg: "success",
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
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return MenuPage();
                          }));
                        }
                      }
                    },
                  ),
                  ElevatedButton.icon(
                    icon: isLoading ? Icon(Icons.lock_clock) : Icon(Icons.login),
                    label: const Text("Daftar"),
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return RegisterPage();
                      }));
                    },
                  ),
                ],
              )
              ),
              isLoading == true
              ? Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.transparent,
                  child: SpinKitDualRing(
                    size: 50,
                    color: Colors.blue,
                  ),
                )
              : Container()
              ]
            )

            ));
  }
}
