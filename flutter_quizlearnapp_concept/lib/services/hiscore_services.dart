part of 'services.dart';

class HighScoreServices {
  static CollectionReference productCollection =
      FirebaseFirestore.instance.collection("highscores");
  static DocumentReference productDoc;

  static Reference ref;
  static UploadTask uploadTask;

  static Future<bool> addHighscore(HighScore highScore) async {
    await Firebase.initializeApp();
    
    productDoc = await productCollection.add({
      'id': "",
      'score': highScore.score,
      'ratingquiz': highScore.ratingquiz,
      'ratingkepahaman': highScore.ratingkepahaman,
      'username': highScore.username,
      'submitdate': highScore.submitdate,
      'round': highScore.round,
      'mode': highScore.mode,
      'roundscore' : highScore.roundscore
    });

    if (productDoc.id != null) {
      productCollection.doc(productDoc.id).update({
        'id': productDoc.id,
      });

      return true;
    } else {
      return false;
    }
  }

    static Future deleteProduct(String productID) async {

    await productCollection.doc(productID).delete();
    
  }
}
