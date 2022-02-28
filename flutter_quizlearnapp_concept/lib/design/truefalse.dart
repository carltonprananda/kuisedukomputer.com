part of 'designs.dart';

class TFTile extends StatelessWidget {
  const TFTile(
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
      child: ListTile(
          onTap: () => klik(),
          title: Text(jawaban,
              style: TextStyle(
                fontSize: 11.sp,
                color: dipilih ? Colors.greenAccent : Colors.grey,
              ))),
    );
  }

  Color get warnajawaban {
    if (!dipilih) return Colors.blueAccent;
    if (jawaban == jawabanbenar) {
      return Colors.blueAccent;
    } else {
      return Colors.redAccent;
    }
  }
}