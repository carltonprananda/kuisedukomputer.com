part of 'pages.dart';

class PretestMulti1 extends StatefulWidget {
  PretestMulti1({Key key, this.assetfolder, this.judulquiz}) : super(key: key);
  //assets/docs/GEKomnon_KomputerDasar.pdf
  final String assetfolder;
  final String judulquiz;


  @override
  State<PretestMulti1> createState() => _PretestMulti1State();
}


class _PretestMulti1State extends State<PretestMulti1> {
  
  @override
  Widget build(BuildContext context) {
    String judulquiz = widget.judulquiz;
    String folderaset() {
      if (widget.assetfolder != null) {
        return widget.assetfolder;
      } else {
      return 'assets/docs/GEKomnon_KomputerDasar.pdf';
      }
      }
      final pdfPinchController = PdfControllerPinch(
  document: PdfDocument.openAsset(folderaset()));
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(judulquiz),
      ),
      body: Stack(
        children: [
          PdfViewPinch(
            controller: pdfPinchController,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ElevatedButton.icon(
              label: Text("Main"),
              icon: Icon(Icons.play_arrow),
              onPressed: () {
                if (judulquiz == "Multi Round - Komputer Dasar") {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Tour1Screen(
                          pertanyaan: tourstage111,
                          gamescore: 0,
                          totalbenar: 0,
                          totalsalah: 0,
                          qindex: 0,
                          timerplus: 0,
                          stage: "Multi Round - Komputer Dasar",
                          round: 1,
                          roundscore: 0,
                        )));
                } else if (judulquiz == "Multi Round - Sistem Operasi") {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Tour2Screen(
                          pertanyaan: tourstage121,
                          gamescore: 0,
                          totalbenar: 0,
                          totalsalah: 0,
                          qindex: 0,
                          timerplus: 0,
                          stage: "Multi Round - Sistem Operasi",
                          round: 1,
                          roundscore: 0,
                        )));
                } else if (judulquiz == "Multi Round - True False Sistem Operasi") {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Tour3Screen(
                          pertanyaan: tourstage311,
                          gamescore: 0,
                          totalbenar: 0,
                          totalsalah: 0,
                          qindex: 0,
                          timerplus: 0,
                          stage: "Multi Round - True False Sistem Operasi",
                          round: 1,
                          roundscore: 0,
                        )));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
