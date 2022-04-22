part of 'designs.dart';

class RatingResult extends StatelessWidget {
  const RatingResult({
    this.name,
    this.kepahamanrating,
    this.nilairating
  });

  final String name;
  final double nilairating;
  final double kepahamanrating;

  @override
  Widget build(BuildContext context) {
      double ratingnilai = nilairating;
      double ratingkepahaman = kepahamanrating;
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      width: double.maxFinite,
      child: Column(
        children: <Widget>[
        Text(
          "Bagaimana Hasil Kami " + (name ?? '') + " ?",
          textAlign: TextAlign.center,
          style: GoogleFonts.openSans(),
        ),
        RatingBar.builder(
          initialRating: ratingnilai,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
          itemSize: 48,
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.orangeAccent,
          ),
          onRatingUpdate: (rating) {
            ratingnilai = rating;
          },
        ),
        Text(
          "Apakah " + (name ?? '') + " sudah paham setelah menjawab quiz ini?",
          textAlign: TextAlign.center,
          style: GoogleFonts.openSans(),
        ),
        RatingBar.builder(
          initialRating: ratingkepahaman,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
          itemSize: 48,
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.orangeAccent,
          ),
          onRatingUpdate: (rating) {
            ratingkepahaman= rating;
          },
        ),
        ],
      ),
    );
  }
}

class TBSResult extends StatelessWidget {
  const TBSResult({
    this.answertime,
    this.jawabanbenar,
    this.jawabansalah, this.hasilpersenbenar, this.hasilpersensalah,
  }
  );
  final double hasilpersenbenar;
  final double hasilpersensalah;
  final int answertime;
  final int jawabanbenar;
  final int jawabansalah;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: CircularPercentIndicator(
                radius: 40,
                percent: 1,
                lineWidth: 10,
                animation: true,
                header:
                    Text("Benar", style: GoogleFonts.notoSans(fontSize: 14)),
                center: Text(hasilpersenbenar.toString() + "%",
                    style: GoogleFonts.notoSans(fontSize: 14)),
                linearGradient: LinearGradient(
                  colors: [Colors.green, Colors.lightGreenAccent],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ),
            Expanded(
              child: CircularPercentIndicator(
                radius: 40,
                percent: 1,
                lineWidth: 10,
                animation: true,
                header:
                    Text("Salah", style: GoogleFonts.notoSans(fontSize: 14)),
                center: Text(hasilpersensalah.toString() + "%",
                    style: GoogleFonts.notoSans(fontSize: 14)),
                linearGradient: LinearGradient(
                  colors: [Colors.red, Colors.redAccent],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
                Expanded(
                    child: Column(
                  children: [
                    Icon(Icons.timer),
                    Text('Waktu Menjawab'),
                    Text('$answertime'),
                  ],
                )),
                Expanded(
                    child: Column(
                  children: [
                    Icon(Icons.check),
                    Text('Jumlah Benar'),
                    Text('$jawabanbenar'),
                  ],
                )),
                Expanded(
                    child: Column(
                  children: [
                    Icon(Icons.close),
                    Text('Jumlah Salah'),
                    Text('$jawabansalah'),
                  ],
                )),
              ],
        ),
      ],
    );
  }
}
