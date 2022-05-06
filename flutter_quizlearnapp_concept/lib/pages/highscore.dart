part of "pages.dart";

class HighscorePage extends StatefulWidget {
  HighscorePage({Key key}) : super(key: key);

  @override
  State<HighscorePage> createState() => _HighscorePageState();
}

class _HighscorePageState extends State<HighscorePage> {
  bool isLoading = false;
  User auth = FirebaseAuth.instance.currentUser;
  CollectionReference<Map<String, dynamic>> userCollection =
      FirebaseFirestore.instance.collection("users");
  CollectionReference<Map<String, dynamic>> productCollection =
      FirebaseFirestore.instance.collection("highscores");
  Query<Map<String, dynamic>> productquery =
      FirebaseFirestore.instance.collection("highscores");
  num ratingquiz, ratingkepahaman;

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.blueAccent,
            Colors.lightBlueAccent,
          ],
        )),
        width: double.infinity,
        height: double.infinity,
        child: Column(children: <Widget>[
          ListTile(
            title: Text("Semua Data",
                style: GoogleFonts.notoSans(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            trailing: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Image.asset('assets/pngs/contest-300x300.png'),
            ),
          ),
          Divider(
            color: Colors.white,
            thickness: 5,
            endIndent: 100,
          ),
          Flexible(
              child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: productquery
                .orderBy('roundscore', descending: true)
                .snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (snapshot.hasError) {
                return Text("Gagal menampilkan data");
              }
              if (snapshot.hasData == false) {
                return Text("Data tidak ada");
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SpinKitSpinningCircle(
                  size: 50,
                  color: Colors.blueAccent,
                );
              }
              return AnimatedSwitcher(
                switchInCurve: Curves.linear,
                duration: Duration(seconds: 1),
                child: ListView(
                  shrinkWrap: true,
                  children: snapshot.data.docs
                      .map((DocumentSnapshot<Map<String, dynamic>> doc) {
                    return HighScoreTile(
                      highScore: HighScore(
                          doc.data()['id'],
                          doc.data()['score'],
                          doc.data()[ratingquiz],
                          doc.data()[ratingkepahaman],
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
          ))
        ]),
      ),
      isLoading == true
          ? Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.transparent,
              child: SpinKitSpinningCircle(size: 50, color: Colors.blueAccent))
          : Container()
    ]);
  }
}
