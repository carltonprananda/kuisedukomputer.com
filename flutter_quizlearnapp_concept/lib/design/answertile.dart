part of 'designs.dart';

class ATile extends StatelessWidget {
  const ATile(
      {Key key,
      this.dipilih,
      this.jawaban,
      this.jawabanbenar,
      this.klik})
      : super(key: key);

  final bool dipilih;
  final String jawaban;
  final String jawabanbenar;
  final Function klik;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top:5),

      //color: warnajawaban,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors:gradasiwarnajawaban,
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
          )
        ),
        child: ListTile(
            onTap: () => klik(),
            title: Text(jawaban,
                style: TextStyle(
                  fontSize: 14,
                  color: dipilih ? Colors.white70 : Colors.white,
                ), textAlign: TextAlign.center,)),
      ),
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

  List<Color> get gradasiwarnajawaban{
  if (!dipilih) return [Colors.transparent.withOpacity(0.4), Colors.transparent.withOpacity(0.5)];
    if (jawaban == jawabanbenar) {
      return [Colors.green.shade500, Colors.green.shade700];
    } else {
      return [Colors.red.shade500, Colors.red.shade700];
    }
  }
}
