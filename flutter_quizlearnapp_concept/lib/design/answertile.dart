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
      color: warnajawaban,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: ListTile(
          onTap: () => klik(),
          title: Text(jawaban,
              style: TextStyle(
                fontSize: 11.sp,
                color: dipilih ? Colors.white70 : Colors.white,
              ), textAlign: TextAlign.center,)),
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
}
