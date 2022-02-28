part of 'models.dart';

class TrueFalse {
  final String truefalseid;
  final String truefalsequestion;
  final List<String> truefalseanswers;
  final String truefalsecorrect;
  final String truefalsetitle;
  TrueFalse({
    this.truefalseid,
    this.truefalsequestion,
    this.truefalseanswers,
    this.truefalsecorrect,
    this.truefalsetitle,
  });



  @override
  String toString() {
    return 'TrueFalse(truefalseid: $truefalseid, truefalsequestion: $truefalsequestion, truefalseanswers: $truefalseanswers, truefalsecorrect: $truefalsecorrect, truefalsetitle: $truefalsetitle)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is TrueFalse &&
      other.truefalseid == truefalseid &&
      other.truefalsequestion == truefalsequestion &&
      other.truefalseanswers == truefalseanswers &&
      other.truefalsecorrect == truefalsecorrect &&
      other.truefalsetitle == truefalsetitle;
  }

  @override
  int get hashCode {
    return truefalseid.hashCode ^
      truefalsequestion.hashCode ^
      truefalseanswers.hashCode ^
      truefalsecorrect.hashCode ^
      truefalsetitle.hashCode;
  }

  TrueFalse copyWith({
    String truefalseid,
    String truefalsequestion,
    List<String> truefalseanswers,
    String truefalsecorrect,
    String truefalsetitle,
  }) {
    return TrueFalse(
      truefalseid: truefalseid ?? this.truefalseid,
      truefalsequestion: truefalsequestion ?? this.truefalsequestion,
      truefalseanswers: truefalseanswers ?? this.truefalseanswers,
      truefalsecorrect: truefalsecorrect ?? this.truefalsecorrect,
      truefalsetitle: truefalsetitle ?? this.truefalsetitle,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'truefalseid': truefalseid,
      'truefalsequestion': truefalsequestion,
      'truefalseanswers': truefalseanswers,
      'truefalsecorrect': truefalsecorrect,
      'truefalsetitle': truefalsetitle,
    };
  }

  factory TrueFalse.fromMap(Map<String, dynamic> map) {
    return TrueFalse(
      truefalseid: map['truefalseid'],
      truefalsequestion: map['truefalsequestion'],
      truefalseanswers: List<String>.from(map['truefalseanswers']),
      truefalsecorrect: map['truefalsecorrect'],
      truefalsetitle: map['truefalsetitle'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TrueFalse.fromJson(String source) => TrueFalse.fromMap(json.decode(source));
}

List<TrueFalse> truefalse1 = [
TrueFalse(
      truefalseid: '1',
      truefalsequestion: 'Z Fold 3 adalah HP termahal Samsung di tahun 2021',
      truefalseanswers: ['True','False'],
      truefalsecorrect: 'True',
      truefalsetitle: 'HandPhone',
),
TrueFalse(
      truefalseid: '2',
      truefalsequestion: 'Oppo Reno 5 Dirilis pada tahun 2020',
      truefalseanswers: ['True','False'],
      truefalsecorrect: 'True',
      truefalsetitle: 'HandPhone',
),
TrueFalse(
      truefalseid: '3',
      truefalsequestion: 'Galaxy A Series tahun 2020 menerapkan Dynamic AMOLED',
      truefalseanswers: ['True','False'],
      truefalsecorrect: 'False',
      truefalsetitle: 'HandPhone',
),
TrueFalse(
      truefalseid: '4',
      truefalsequestion: 'One UI yang pertama kali dirilis tahun 2018',
      truefalseanswers: ['True','False'],
      truefalsecorrect: 'False',
      truefalsetitle: 'HandPhone',
),
TrueFalse(
      truefalseid: '5',
      truefalsequestion: 'iPhone 12 Pro Max lebih baik daripada iPhone 11 Pro',
      truefalseanswers: ['True','False'],
      truefalsecorrect: 'True',
      truefalsetitle: 'HandPhone',
),
TrueFalse(
      truefalseid: '6',
      truefalsequestion: 'Macbook Pro cocok digunakan dalam gaming',
      truefalseanswers: ['True','False'],
      truefalsecorrect: 'False',
      truefalsetitle: 'MacBook',
),
TrueFalse(
      truefalseid: '7',
      truefalsequestion: 'versi MacOS yang dirilis pada tahun 2019 adalah Big Sur',
      truefalseanswers: ['True','False'],
      truefalsecorrect: 'False',
      truefalsetitle: 'MacBook',
),
TrueFalse(
      truefalseid: '8',
      truefalsequestion: 'Harga Laptop Gaming i9 generasi 11 adalah paling mahal',
      truefalseanswers: ['True','False'],
      truefalsecorrect: 'False',
      truefalsetitle: 'Laptop',
),
];
