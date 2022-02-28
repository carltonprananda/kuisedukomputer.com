part of 'models.dart';

class HighScore extends Equatable {
  final String id;
  final int score;
  final String ratingquiz;
  final String ratingkepahaman;
  final String username;
  final String submitdate;
  final String round;
  final String mode;

  HighScore(this.id, this.score, this.ratingquiz, this.ratingkepahaman, this.username, this.submitdate, this.round, this.mode);

    @override
  List<Object> get props => [id, score, ratingquiz, ratingkepahaman, username, submitdate, round, mode];
  
  }
