part of 'designs.dart';

class ATile extends StatelessWidget {
  const ATile(
      {Key key, this.dipilih, this.jawaban, this.jawabanbenar, this.klik})
      : super(key: key);

  final bool dipilih;
  final String jawaban;
  final String jawabanbenar;
  final Function klik;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4),
      width: double.maxFinite,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          shape: BoxShape.rectangle,
          gradient: LinearGradient(
            colors: gradasiwarnajawaban,
            begin: Alignment.topLeft,
            end: Alignment.topRight,
          )),
      child: ListTile(
          onTap: () => klik(),
          title: Text(
            jawaban,
            style: GoogleFonts.openSans(
              fontSize: 14,
              color: dipilih ? Colors.white70 : Colors.white,
            ),
            textAlign: TextAlign.center,
          )),
    );
  }

  Color get warnajawaban {
    if (!dipilih) return Colors.transparent;
    if (jawaban == jawabanbenar) {
      return Colors.greenAccent;
    } else {
      return Colors.redAccent;
    }
  }

  List<Color> get gradasiwarnajawaban {
    if (!dipilih)
      return [
        Colors.transparent.withOpacity(0.4),
        Colors.transparent.withOpacity(0.5)
      ];
    if (jawaban == jawabanbenar) {
      return [Colors.green.shade500, Colors.green.shade700];
    } else {
      return [Colors.red.shade500, Colors.red.shade700];
    }
  }
}
