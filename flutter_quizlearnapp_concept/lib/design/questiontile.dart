part of 'designs.dart';

class QTile extends StatelessWidget {
  const QTile(
      {Key key,
      this.pertanyaan})
      : super(key: key);

  final String pertanyaan;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: ListTile(
          title: Text(pertanyaan,
              style: TextStyle(
                fontSize: 13.sp,
                color: Colors.blueAccent,
              ), textAlign: TextAlign.left,)),
    );
  }
}
