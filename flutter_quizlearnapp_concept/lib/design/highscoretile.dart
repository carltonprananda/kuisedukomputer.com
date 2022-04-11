part of 'designs.dart';

class HighScoreTile extends StatelessWidget {
  const HighScoreTile({this.highScore});

  final HighScore highScore;

  @override
  Widget build(BuildContext context) {
    return Card(
        borderOnForeground: true,
        margin: EdgeInsets.all(0),
        elevation: 0,
        color: Colors.transparent,
        shadowColor: Colors.lightBlueAccent.shade100,
        child: ListTile(
          title: Text(highScore.username, style: GoogleFonts.openSans(fontSize: 16, color: Colors.white)),
          trailing: Text(
            highScore.roundscore.toString(),
            style: GoogleFonts.openSans(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            highScore.mode,
            style: GoogleFonts.openSans(fontSize: 14, color: Colors.white),
          ),
        ));
  }
}

class ProfileScoreTile extends StatelessWidget {
  const ProfileScoreTile({this.highScore});

  final HighScore highScore;

  @override
  Widget build(BuildContext context) {
    return Card(
        borderOnForeground: true,
        elevation: 0,
        margin: EdgeInsets.all(4),
        color: Colors.transparent,
        shadowColor: Colors.lightBlueAccent,
        child: ListTile(
          onTap: () async {
            await showGeneralDialog(
                context: context,
                barrierDismissible: true,
                barrierLabel: "Batal",
                barrierColor: Colors.transparent.withOpacity(0.75),
                transitionDuration: Duration(milliseconds: 300),
                transitionBuilder: (context, a1, a2, wi) {
                  return Transform.scale(
                      scale: a1.value,
                      child: AlertDialog(
                        actions: [
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.redAccent),
                              onPressed: () async {
                                bool result =
                                    await HighScoreServices.deleteProduct(
                                        highScore.id);
                                if (result == true) {
                                  Fluttertoast.showToast(
                                      msg: "Data sudah dihapus",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER_RIGHT,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.yellow,
                                      fontSize: 16.0);
                                }
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.delete),
                              label: Text("Hapus"),
                            ),
                          ),
                        ],
                        title: Text("Detail Data", textAlign: TextAlign.center,),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              title: Text("Babak"),
                              subtitle: Text(highScore.mode),
                            ),
                            ListTile(
                              title: Text("Skor"),
                              trailing: Text(highScore.roundscore.toString()),
                            ),
                            ListTile(
                              title: Text("Babak yang dimainkan"),
                              subtitle: Text(highScore.mode),
                            )
                          ],
                        ),
                      ));
                },
                pageBuilder: (context, an1, an2) {});
            
          },
          isThreeLine: false,
          title: Text(highScore.mode, style: GoogleFonts.openSans(fontSize: 16, color: Colors.blueAccent, fontWeight: FontWeight.bold)),
          trailing: Text(
            highScore.score.toString(),
            style: GoogleFonts.openSans(fontSize: 14, color: Colors.blueAccent),
          ),
          leading: Column(
            children: <Widget>[
              Icon(Icons.star),
              Text(
                highScore.ratingquiz.toString(),
                style: GoogleFonts.openSans(fontSize: 12, color: Colors.blueAccent),
              ),
            ],
          ),
        ));
  }
}
