part of 'designs.dart';

class HighScoreTile extends StatelessWidget {
  const HighScoreTile({this.highScore});

  final HighScore highScore;

  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: true,
      margin: EdgeInsets.all(4),
      color: Colors.blueAccent,
      shadowColor: Colors.lightBlueAccent,
      child: ListTile(
        isThreeLine: true,
        title: Text(highScore.username,style: TextStyle(fontSize: 16.sp)),
        trailing: Text(highScore.score.toString(), style: TextStyle(fontSize: 14.sp),),
        subtitle: Text(highScore.mode, style: TextStyle(fontSize: 12.sp),),
        leading: Column(
          children: <Widget>[
            Icon(Icons.star),
            Text(highScore.ratingquiz.toString(), style: TextStyle(fontSize: 12.sp),),
          ],
        ),
      )
    );
  }
}