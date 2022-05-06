part of 'models.dart';

class HighScore extends Equatable {
  final String id;
  final int score;
  final double ratingquiz;
  final double ratingkepahaman;
  final String username;
  final String submitdate;
  final String round;
  final String mode;
  final int roundscore;

  const HighScore(this.id, this.score, this.ratingquiz, this.ratingkepahaman, this.username, this.submitdate, this.round, this.mode, this.roundscore);

    @override
  List<Object> get props => [id, score, ratingquiz, ratingkepahaman, username, submitdate, round, mode, roundscore];
  
  }
