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
            )
          ),
        width: double.infinity,
        height: double.infinity,
        child: Column(children: <Widget>[
          Text("Semua Data", style: GoogleFonts.notoSans(fontSize: 18.sp)),
          Flexible(
              child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: productquery.orderBy('score', descending: true).snapshots(),
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
              return ListView(
                shrinkWrap: true,
                children: snapshot.data.docs
                    .map((DocumentSnapshot<Map<String, dynamic>> doc) {
                  return HighScoreTile(
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
