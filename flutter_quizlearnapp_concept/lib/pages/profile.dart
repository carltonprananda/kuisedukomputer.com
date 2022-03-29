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
  CollectionReference<Map<String, dynamic>> productCollection =
      FirebaseFirestore.instance.collection("highscores");
  Query<Map<String, dynamic>> productquery =
      FirebaseFirestore.instance.collection("highscores");
  bool isLoading;

  void getUserUpdate() async {
    userCollection.doc(auth.uid).snapshots().listen((event) {
      name = event.data()['name'];
      email = event.data()['email'];
      firstnl = name.substring(0, 1);
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
      body: Stack(children: [
        Container(
          padding: EdgeInsets.only(bottom: 20),
          child: Column(children: <Widget>[
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
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          MateriKomputerPage()));
                                },
                                child: Text("Materi")),
                            ElevatedButton(
                                onPressed: () {
                                  showGeneralDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      barrierColor:
                                          Colors.transparent.withOpacity(0.75),
                                      transitionDuration:
                                          Duration(milliseconds: 300),
                                      transitionBuilder: (context, a1, a2, wi) {
                                        return Transform.scale(
                                            scale: a1.value,
                                            child: AlertDialog(
                                              title: Text(
                                                "Konfirmasi",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold, fontSize: 24.sp),
                                              ),
                                              content: Text(
                                                "Apakah Anda ingin signout?",
                                                textAlign: TextAlign.center,
                                              ),
                                              actions: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children: [
                                                    ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        primary:
                                                            Colors.redAccent,
                                                        textStyle: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      onPressed: () async {
                                                        setState(() {
                                                          isLoading = true;
                                                        });
                                                        await AuthServices
                                                                .signout()
                                                            .then((value) {
                                                          if (value) {
                                                            Navigator
                                                                .pushAndRemoveUntil(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) {
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
                                child: Text("Signout"))
                          ],
                        )
                      ],
                    ),
                  ),
                )),
            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream:
                  productquery.where("username", isEqualTo: name).snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.hasError) {
                  return Text("Gagal menampilkan data");
                }
                if (snapshot.hasData == false) {
                  return Text("Data belum ada");
                }
                if (snapshot.data.docs.isEmpty == true) {
                  return Center(
                    child: Column(children: <Widget>[
                      Text("Data belum ada"),
                      Text("Silahkan main quiz terlebih dahulu")
                    ]),
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SpinKitCircle(
                    size: 50,
                    color: Colors.blueAccent,
                  );
                }
                return Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    children: snapshot.data.docs
                        .map((DocumentSnapshot<Map<String, dynamic>> doc) {
                      return ProfileScoreTile(
                        highScore: HighScore(
                          doc.data()['id'],
                          doc.data()['score'],
                          doc.data()['ratingquiz'],
                          doc.data()['ratingkepahaman'],
                          doc.data()['username'],
                          doc.data()['submitdata'],
                          doc.data()['round'],
                          doc.data()['mode'],
                          doc.data()['roundscore'],
                        ),
                      );
                    }).toList(),
                  ),
                );
              },
            )
          ]),
        ),
        isLoading == true
            ? Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.transparent,
                child: SpinKitCircle(size: 50, color: Colors.blueAccent))
            : Container()
      ]),
    );
  }
}
