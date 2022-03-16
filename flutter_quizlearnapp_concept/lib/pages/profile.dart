part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name, email, firstnl;
  User auth = FirebaseAuth.instance.currentUser;
  CollectionReference<Map<String, dynamic>> userCollection =
      FirebaseFirestore.instance.collection("users");
  bool isLoading;

    void getUserUpdate() async {
    userCollection.doc(auth.uid).snapshots().listen((event) {
      name = event.data()['name'];
      email = event.data()['email'];
      firstnl = name.substring(0,1);
      setState(() {});
    });
  }

  @override
  void initState() {
    getUserUpdate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
                height: 20.h,
                child: Container(
                  color: Colors.blueAccent,
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Spacer(),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          radius: 30,
                          child: Text(firstnl ?? ''),
                        ), 
                        Text(name ?? '', style: TextStyle(fontSize: 10.sp)),
                        Text(email ?? '', style: TextStyle(fontSize: 10.sp)),
                        ButtonBar(
                          alignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(onPressed: (){
                              Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MateriKomputerPage()));
                            }, child: Text("Materi")),
                            ElevatedButton(onPressed: () {
                              showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            
                            title: Text("Konfirmasi"),
                            content: Text("Apakah Anda ingin signout?"),
                            actions: [
                              TextButton(
                                onPressed: () async {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  await AuthServices.signout().then((value) {
                                    if (value) {
                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(builder: (context) {
                                        return LoginPage();
                                      }));
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
                              TextButton(
                                child: Text("Tidak"),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              )
                            ],
                          );
                        });
                            }
                            , child: Text("Signout"))
                          ],
                        )
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
