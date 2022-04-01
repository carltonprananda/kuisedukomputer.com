part of 'designs.dart';

class QTile extends StatelessWidget {
  const QTile({Key key, this.pertanyaan}) : super(key: key);

  final String pertanyaan;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.shade700,
      margin: EdgeInsets.only(top: 20),
      height: MediaQuery.of(context).size.height * 0.2,
      child: Stack(children: [
        Transform.translate(
          offset: Offset(0, -10),
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              color: Colors.black,
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.025,
              child: Text(
                "Pertanyaan",
                style: GoogleFonts.notoSans(color: Colors.white, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        Center(
          child: Card(
            color: Colors.transparent,
            margin: EdgeInsets.all(2),
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: ListTile(
                title: Text(
              pertanyaan,
              style: GoogleFonts.notoSans(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            )),
          ),
        ),
      ]),
    );
  }
}
