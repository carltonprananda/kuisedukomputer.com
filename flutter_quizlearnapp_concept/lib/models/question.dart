part of 'models.dart';

class Question {
  final String questionid;
  final String question;
  final List<String> listanswers;
  final String questiontitle;
  final String questioncorrect;
  Question({
    this.questionid,
    this.question,
    this.listanswers,
    this.questiontitle,
    this.questioncorrect,
  });

  Question copyWith({
    String questionid,
    String question,
    List<String> listanswers,
    String questionexplanation,
    String questiontitle,
    String questioncorrect,
  }) {
    return Question(
      questionid: questionid ?? this.questionid,
      question: question ?? this.question,
      listanswers: listanswers ?? this.listanswers,
      questiontitle: questiontitle ?? this.questiontitle,
      questioncorrect: questioncorrect ?? this.questioncorrect,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'questionid': questionid,
      'question': question,
      'listanswers': listanswers,
      'questiontitle': questiontitle,
      'questioncorrect': questioncorrect,
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      questionid: map['questionid'],
      question: map['question'],
      listanswers: List<String>.from(map['listanswers']),
      questiontitle: map['questiontitle'],
      questioncorrect: map['questioncorrect'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Question.fromJson(String source) =>
      Question.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Question(questionid: $questionid, question: $question, listanswers: $listanswers, questiontitle: $questiontitle)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Question &&
        other.questionid == questionid &&
        other.question == question &&
        listEquals(other.listanswers, listanswers) &&
        other.questiontitle == questiontitle;
  }

  @override
  int get hashCode {
    return questionid.hashCode ^
        question.hashCode ^
        listanswers.hashCode ^
        questiontitle.hashCode;
  }
}
