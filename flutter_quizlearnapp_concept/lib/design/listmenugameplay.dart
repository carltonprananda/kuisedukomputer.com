part of 'designs.dart';

class ListMenuGameplay1 extends StatelessWidget {
  const ListMenuGameplay1(
      {Key key,
      this.judul,
      this.deskripsijudul,
      this.juduldenganmode,
      this.deskripsi,
      this.tourstage})
      : super(key: key);

  final String judul;
  final String deskripsijudul;
  final String juduldenganmode;
  final String deskripsi;
  final List<Question> tourstage;

  void showgamedialog(BuildContext context) {
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel: "Batal",
        barrierColor: Colors.transparent.withOpacity(0.75),
        transitionDuration: Duration(milliseconds: 300),
        transitionBuilder: (context, a1, a2, wi) {
          return Transform.scale(
              scale: a1.value,
              child: AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    side: BorderSide(color: Colors.blue, width: 5)),
                actions: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      style:
                          ElevatedButton.styleFrom(primary: Colors.blueAccent),
                      onPressed: () {
                        Navigator.pop(context, true);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => GameplayScreen(
                                  pertanyaan: tourstage,
                                  gamescore: 0,
                                  totalbenar: 0,
                                  totalsalah: 0,
                                  qindex: 0,
                                  timerplus: 0,
                                  stage: juduldenganmode,
                                )));
                      },
                      icon: Icon(Icons.play_arrow),
                      label: Text("Main"),
                    ),
                  ),
                ],
                title: Container(
                  color: Colors.blueAccent,
                  child: Text(
                    judul,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.notoSans(
                      fontSize: 24,
                    ),
                  ),
                ),
                titlePadding: const EdgeInsets.all(8),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(deskripsi),
                    ListTile(
                      leading: Icon(Icons.list),
                      title: Text("Jumlah soal"),
                      trailing: Text("10"),
                    )
                  ],
                ),
              ));
        },
        pageBuilder: (context, an1, an2) {});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => showgamedialog(context),
        child: Card(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/monitor1.jpg'),
              ),
            ),
            child: Stack(children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.09,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [
                    Colors.lightBlueAccent.shade400.withOpacity(0.8),
                    Colors.lightBlueAccent.shade700.withOpacity(0.8),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                )),
                child: Stack(children: [
                  Transform.translate(
                    offset: Offset(0, 10),
                    child: Divider(
                      color: Colors.white,
                      thickness: 5,
                      endIndent: 100,
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(0, 15),
                    child: ListTile(
                      title: Text(judul,
                          textAlign: TextAlign.left,
                          style: GoogleFonts.notoSans(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 18)),
                      subtitle: Text(
                        deskripsijudul,
                        textAlign: TextAlign.left,
                        style: GoogleFonts.notoSans(color: Colors.white),
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(0, -15),
                    child: Align(
                        alignment: Alignment.topRight,
                        child: Image.asset(
                          'assets/pngs/computer-dynamic-color.png',
                          fit: BoxFit.fitHeight,
                        )),
                  )
                ]),
              ),
            ]),
          ),
        ));
  }
}

class ListMenuGameplay2 extends StatelessWidget {
  const ListMenuGameplay2(
      {Key key,
      this.judul,
      this.deskripsijudul,
      this.juduldenganmode,
      this.deskripsi,
      this.tourstage})
      : super(key: key);

  final String judul;
  final String deskripsijudul;
  final String juduldenganmode;
  final String deskripsi;
  final List<Question> tourstage;

  void showgamedialog(BuildContext context) {
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel: "Batal",
        barrierColor: Colors.transparent.withOpacity(0.75),
        transitionDuration: Duration(milliseconds: 300),
        transitionBuilder: (context, a1, a2, wi) {
          return Transform.scale(
              scale: a1.value,
              child: AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    side: BorderSide(color: Colors.green, width: 5)),
                actions: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      style:
                          ElevatedButton.styleFrom(primary: Colors.greenAccent),
                      onPressed: () {
                        Navigator.pop(context, true);
                        if (juduldenganmode == "Multi Round - Komputer Dasar") {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Tour1Screen(
                                    pertanyaan: tourstage,
                                    gamescore: 0,
                                    totalbenar: 0,
                                    totalsalah: 0,
                                    qindex: 0,
                                    timerplus: 0,
                                    round: 1,
                                    roundscore: 0,
                                    stage: juduldenganmode,
                                  )));
                        } else if (juduldenganmode ==
                            "Multi Round - Sistem Operasi") {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Tour2Screen(
                                    pertanyaan: tourstage,
                                    gamescore: 0,
                                    totalbenar: 0,
                                    totalsalah: 0,
                                    qindex: 0,
                                    timerplus: 0,
                                    round: 1,
                                    roundscore: 0,
                                    stage: juduldenganmode,
                                  )));
                        }
                      },
                      icon: Icon(Icons.play_arrow),
                      label: Text("Main"),
                    ),
                  ),
                ],
                title: Container(
                  color: Colors.blueAccent,
                  child: Text(
                    judul,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.notoSans(
                      fontSize: 24,
                    ),
                  ),
                ),
                titlePadding: const EdgeInsets.all(8),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(deskripsi),
                    ListTile(
                      leading: Icon(Icons.list),
                      title: Text("Jumlah soal Pre-test(Babak Pertama)"),
                      trailing: Text("4"),
                    ),
                    ListTile(
                      leading: Icon(Icons.list),
                      title: Text("Jumlah soal Test(Babak Kedua)"),
                      trailing: Text("8"),
                    ),
                    ListTile(
                      leading: Icon(Icons.list),
                      title: Text("Jumlah soal Post-Test(Babak Ketiga)"),
                      trailing: Text("10"),
                    ),
                  ],
                ),
              ));
        },
        pageBuilder: (context, an1, an2) {});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => showgamedialog(context),
        child: Card(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/monitor1.jpg'),
              ),
            ),
            child: Stack(children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.09,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [
                    Colors.lightGreenAccent.shade400.withOpacity(0.8),
                    Colors.lightGreenAccent.shade700.withOpacity(0.8),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                )),
                child: Stack(children: [
                  Transform.translate(
                    offset: Offset(0, 10),
                    child: Divider(
                      color: Colors.white,
                      thickness: 5,
                      endIndent: 100,
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(0, 15),
                    child: ListTile(
                      title: Text(judul,
                          textAlign: TextAlign.left,
                          style: GoogleFonts.notoSans(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 18)),
                      subtitle: Text(
                        deskripsijudul,
                        textAlign: TextAlign.left,
                        style: GoogleFonts.notoSans(color: Colors.white),
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(0, -15),
                    child: Align(
                        alignment: Alignment.topRight,
                        child: Image.asset(
                          'assets/pngs/computer-dynamic-premium.png',
                          fit: BoxFit.fitHeight,
                        )),
                  )
                ]),
              ),
            ]),
          ),
        ));
  }
}
