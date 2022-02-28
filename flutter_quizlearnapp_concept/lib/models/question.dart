part of 'models.dart';

class Question {
  final String questionid;
  final String question;
  final List<String> listanswers;
  final String questionhint;
  final String questionexplanation;
  final String questionlevel;
  final String questiontitle;
  final String questioncorrect;
  Question({
    this.questionid,
    this.question,
    this.listanswers,
    this.questionhint,
    this.questionexplanation,
    this.questionlevel,
    this.questiontitle,
    this.questioncorrect,
  });

  Question copyWith({
    String questionid,
    String question,
    List<String> listanswers,
    String questionhint,
    String questionexplanation,
    String questionlevel,
    String questiontitle,
    String questioncorrect,
  }) {
    return Question(
      questionid: questionid ?? this.questionid,
      question: question ?? this.question,
      listanswers: listanswers ?? this.listanswers,
      questionhint: questionhint ?? this.questionhint,
      questionexplanation: questionexplanation ?? this.questionexplanation,
      questionlevel: questionlevel ?? this.questionlevel,
      questiontitle: questiontitle ?? this.questiontitle,
      questioncorrect: questioncorrect ?? this.questioncorrect,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'questionid': questionid,
      'question': question,
      'listanswers': listanswers,
      'questionhint': questionhint,
      'questionexplanation': questionexplanation,
      'questionlevel': questionlevel,
      'questiontitle': questiontitle,
      'questioncorrect': questioncorrect,
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      questionid: map['questionid'],
      question: map['question'],
      listanswers: List<String>.from(map['listanswers']),
      questionhint: map['questionhint'],
      questionexplanation: map['questionexplanation'],
      questionlevel: map['questionlevel'],
      questiontitle: map['questiontitle'],
      questioncorrect: map['questioncorrect'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Question.fromJson(String source) =>
      Question.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Question(questionid: $questionid, question: $question, listanswers: $listanswers, questionhint: $questionhint, questionexplanation: $questionexplanation, questionlevel: $questionlevel, questiontitle: $questiontitle)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Question &&
        other.questionid == questionid &&
        other.question == question &&
        listEquals(other.listanswers, listanswers) &&
        other.questionhint == questionhint &&
        other.questionexplanation == questionexplanation &&
        other.questionlevel == questionlevel &&
        other.questiontitle == questiontitle;
  }

  @override
  int get hashCode {
    return questionid.hashCode ^
        question.hashCode ^
        listanswers.hashCode ^
        questionhint.hashCode ^
        questionexplanation.hashCode ^
        questionlevel.hashCode ^
        questiontitle.hashCode;
  }
}

List<Question> questiontype1 = [
  Question(
      questionid: '1',
      question: 'Kata Komputer berasal dari Bahasa',
      listanswers: ['Latin', 'Yunani', 'Inggris'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Komputer Dasar',
      questioncorrect: 'Latin'),
  Question(
      questionid: '2',
      question: 'Salah satu perangkat utama yang menghidupkan semua komputer',
      listanswers: ['Motherboard', 'CPU', 'Power Unit'],
      questionhint: 'Keseluruhan Komputer',
      questionexplanation: 'Motherboard',
      questionlevel: 'Beginner',
      questiontitle: 'Komputer Dasar',
      questioncorrect: 'Motherboard'),
  Question(
      questionid: '3',
      question: 'RAM singkatan dari...',
      listanswers: [
        'Range Access Memory',
        'Random Access Memory',
        'Range Accessible Memory',
      ],
      questionhint: 'Pelafalan mirip dengan Bahasa Inggris',
      questionexplanation: 'RAM Adalah singkatan dari',
      questionlevel: 'Beginner',
      questiontitle: 'Komputer Dasar',
      questioncorrect: 'Random Access Memory'),
  Question(
      questionid: '4',
      question:
          'HDD merupakan singkatan dari',
      listanswers: [
        'Harddisk Drive',
        'Harddisk Device',
        'Harddisk Driver',
      ],
      questionhint: 'Terletak di tengah-tengah motherboard',
      questionexplanation:
          'Menggunakan processor dengan generasi yang sama harus sesuai dengan motherboard',
      questionlevel: 'Advanced',
      questiontitle: 'Komputer Dasar',
      questioncorrect:
          'Harddisk Driver'),
  Question(
      questionid: '5',
      question: 'SSD merupakan singkatan dari',
      listanswers: [
        'Solid Security Drive',
        'Solid Stable Drive',
        'Solid State Drive',
      ],
      questionhint: 'Dasar dalam Bahasa Inggris',
      questionexplanation:
          'BIOS merupakan singkatan dari Basic Input Output System',
      questionlevel: 'Intermediate',
      questiontitle: 'Komputer Dasar',
      questioncorrect: 'Solid State Drive'),
  Question(
      questionid: '6',
      question: 'Overclocking adalah, kecuali...',
      listanswers: [
        'Konfigurasi untuk meningkatkan kecepatan komputer',
        'Konfigurasi untuk meningkatkan performa komputer',
        'Konfigurasi untuk meningkatkan kestabilan dengan kecepatan'
      ],
      questionhint: 'Pelafalan mirip dengan Bahasa Inggris',
      questionexplanation:
          'Overclocking adalah konfigurasi system untuk meningkatkan performa komputer dengan menaikkan clock rate',
      questionlevel: 'Intermediate',
      questiontitle: 'Komponen Komputer',
      questioncorrect:
          'Konfigurasi untuk meningkatkan kestabilan dengan kecepatan'),
  Question(
      questionid: '7',
      question: 'Komponen yang bisa di overclock',
      listanswers: ['RAM', 'Harddisk', 'Power Supply'],
      questionhint: 'Pelafalan mirip dengan Bahasa Inggris',
      questionexplanation:
          'Overclocking adalah konfigurasi system untuk meningkatkan performa komputer dengan menaikkan clock rate',
      questionlevel: 'Intermediate',
      questiontitle: 'Komponen Komputer',
      questioncorrect: 'RAM'),
  Question(
      questionid: '8',
      question: 'TPM adalah singkatan dari',
      listanswers: [
        'Trusted Power Module',
        'Trust Powered Module',
        'Trusted Platform Module'
      ],
      questionhint: 'System Requirement pada Windows 11',
      questionexplanation: 'TPM adalah singkatan dari Trusted Platform Module',
      questionlevel: 'Intermediate',
      questiontitle: 'Komponen Komputer',
      questioncorrect:
          'Trusted Platform Module'),
  Question(
      questionid: '9',
      question: 'Perbedaan antara Legacy dan UEFI',
      listanswers: [
        'Security UEFI Lebih Kuat',
        'UEFI hanya bisa menampung 2 TB saja',
        'Legacy dan UEFI cenderung sama'
      ],
      questionhint: 'System Requirement pada Windows 11',
      questionexplanation: 'TPM adalah singkatan dari Trusted Platform Module',
      questionlevel: 'Intermediate',
      questiontitle: 'Komponen Komputer',
      questioncorrect:
          'Security UEFI Lebih Kuat'),
    Question(
      questionid: '10',
      question: 'Socket dalam Motherboard adalah',
      listanswers: [
        'Penghidup Keseluruhan Komputer',
        'Penghubung Prosesor di dalam Motherboard',
        'Penghubung RAM di dalam Motherboard'
      ],
      questionhint: 'Terletak pada tengah motherboard',
      questionexplanation: 'TPM adalah singkatan dari Trusted Platform Module',
      questionlevel: 'Intermediate',
      questiontitle: 'Komponen Komputer',
      questioncorrect:
          'Penghubung Prosesor di dalam Motherboard'),
];
/* Tentang Basic Computer untuk stage 1 pada Mode Pertama*/
List<Question> tourstage111 = [
    Question(
      questionid: '1',
      question: 'Kata Komputer berasal dari Bahasa',
      listanswers: ['Latin', 'Yunani', 'Inggris'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Basic Komputer',
      questioncorrect: 'Latin'),
    Question(
      questionid: '2',
      question: 'Dalam Bahasa Inggris, Compute berarti',
      listanswers: ['Mengurangi', 'Menambahkan', 'Menghitung'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Basic Komputer',
      questioncorrect: 'Menghitung'),
    Question(
      questionid: '3',
      question: 'Power Supply Unit adalah',
      listanswers: ['Alat untuk memberikan tegangan arus listrik ke berbagai komponen dalam komputer', 'Alat untuk menyalakan komputer', 'Alat untuk menyimpan listrik dalam komponen komputer'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Basic Komputer',
      questioncorrect: 'Alat untuk memberikan tegangan arus listrik ke berbagai komponen dalam komputer'),
    Question(
      questionid: '4',
      question: 'SSD yang memiliki 2 port disebut',
      listanswers: ['M.2', 'NVMe', 'HDD'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Basic Komputer',
      questioncorrect: 'NVMe'),
    Question(
      questionid: '5',
      question: 'Jenis DDR RAM yang banyak digunakan pada saat ini yaitu',
      listanswers: ['DDR3', 'DDR4', 'DDR5'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Basic Komputer',
      questioncorrect: 'DDR4'),
    Question(
      questionid: '6',
      question: 'Jenis Socket yang mendukung Intel adalah',
      listanswers: ['LGA 1200', 'TRX4', 'AM4'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Basic Komputer',
      questioncorrect: 'LGA 1200'),
    Question(
      questionid: '7',
      question: 'Untuk menampilkan tampilan pada komputer diperlukan komponen pada Case yaitu',
      listanswers: ['Kartu VGA', 'Monitor', 'Semua benar'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Basic Komputer',
      questioncorrect: 'Kartu VGA'),
    Question(
      questionid: '8',
      question: 'Batas RAM yang digunakan dalam sistem operasi 32 bit adalah',
      listanswers: ['2 GB', '3 GB', '4 GB'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Basic Komputer',
      questioncorrect: '3 GB'),
    Question(
      questionid: '9',
      question: 'Salah satu komponen komputer yang dapat menampilkan tampilan pada monitor',
      listanswers: ['Motherboard', 'VGA Card', 'Processor'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Basic Komputer',
      questioncorrect: 'VGA Card'),
    Question(
      questionid: '10',
      question: 'Untuk mendinginkan processor, komponen apa yang harus dipasang',
      listanswers: ['Case Fans', 'Air Cooler', 'Semua Benar'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Basic Komputer',
      questioncorrect: 'Semua Benar'),
    Question(
      questionid: '11',
      question: 'Kekurangan Hard Disk Drive adalah',
      listanswers: ['Mengeluarkan suara bising', 'Mengaktifkan Secure Boot', 'Semua Benar'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Basic Komputer',
      questioncorrect: 'Semua Benar'),
    Question(
      questionid: '12',
      question: 'Kelebihan SSD M.2 adalah',
      listanswers: ['Transfer Data lebih cepat', 'Kapasitas Memori Lebih kecil', 'Slot terdiri dari 2 pemasangan'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Basic Komputer',
      questioncorrect: 'Transfer Data lebih cepat'),
    Question(
      questionid: '13',
      question: 'Jenis driver external yang digunakan sebagai media penyimpanan pada komputer, kecuali',
      listanswers: ['CD', 'USB', 'RAM'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Basic Komputer',
      questioncorrect: 'RAM'),
    Question(
      questionid: '14',
      question: 'SSD merupakan singkatan dari',
      listanswers: ['Solid State Drive', 'Security State Drive', 'Secure State Drive'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Basic Komputer',
      questioncorrect: 'Solid State Drive'),
    Question(
      questionid: '15',
      question: 'Kelebihan SSD jenis NVMe adalah',
      listanswers: ['Lebih Cepat daripada M.2', 'Harga Lebih Mahal', 'Secure State Drive'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Basic Komputer',
      questioncorrect: 'Solid State Drive'),
];
/* Tentang Keamanan Komputer untuk stage 2 pada Mode Pertama*/
List<Question> tourstage121 = [
    Question(
      questionid: '1',
      question: 'Backup adalah',
      listanswers: ['Cadangan File dalam komputer', 'Pembuatan Arsip File dalam Komputer', 'Semua benar'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Semua benar'),
    Question(
      questionid: '2',
      question: 'Hal yang perlu dilakukan untuk mengembalikan file yang telah dihapus',
      listanswers: ['Backup', 'Recovery', 'Format'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Recovery'),
    Question(
      questionid: '3',
      question: 'Jenis Scan yang mengscan semua file disebut dengan',
      listanswers: ['Full Scan', 'Quick Scan', 'Semua benar'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Full Scan'),
    Question(
      questionid: '4',
      question: 'Salah satu cara mengunci akun dalam komputer dengan paling aman adalah',
      listanswers: ['PIN', 'Password', 'Semua Benar'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Password'),
    Question(
      questionid: '5',
      question: 'Untuk mengaktifkan TPM, Pengguna harus melakukan dengan ',
      listanswers: ['Ke BIOS', 'Menyalakan Secure Boot', 'Semua Benar'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Semua Benar'),
    Question(
      questionid: '6',
      question: 'Secure Boot adalah',
      listanswers: ['Melakukan Booting dengan Aman', 'Booting Device hanya dengan driver dan OS yang telah disignature', 'Semua Benar'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Komponen Komputer',
      questioncorrect: 'Booting Device hanya dengan driver dan OS yang telah disignature'),
    Question(
      questionid: '7',
      question: 'Malware adalah',
      listanswers: ['Virus yang merusak komputer', 'Penyebaran virus ke berbagai perangkat lunak', 'Memanfaatkan kecacatan dalam keamanan komputer untuk diserang'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Virus yang merusak komputer'),
    Question(
      questionid: '8',
      question: 'Jenis Exploit yang digunakan dalam Wannacry adalah',
      listanswers: ['EternalBlue', 'DoublePulsar', 'ShellShock'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'EternalBlue'),
    Question(
      questionid: '9',
      question: 'Untuk mencegah cyberattack, yang harus dilakukan adalah',
      listanswers: ['Mengupdate OS', 'Rutin mengupdate versi Antivirus', 'Semua Benar'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Semua Benar'),
    Question(
      questionid: '10',
      question: 'Meltdown dalam komponen komputer terjadi pada',
      listanswers: ['CPU Intel', 'CPU AMD', 'Semua Benar'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'CPU Intel'),
    Question(
      questionid: '11',
      question: 'Salah satu alternatif untuk menginstall ulang Windows melalui',
      listanswers: ['Menginstall dengan ISO', 'Reset melalui Settings', 'Semua Benar'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Reset melalui Settings'),
    Question(
      questionid: '12',
      question: 'Untuk memeriksa komponen pada Windows dalam Command Prompt, Command apa yang digunakan',
      listanswers: ['sfc/ scannow', 'sfc /verifyonly', 'Semua Benar'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Komponen Komputer',
      questioncorrect: 'sfc/ scannow'),
    Question(
      questionid: '13',
      question: 'Jenis TPM Kecuali',
      listanswers: ['fTPM', 'Software TPM', 'Hardware TPM'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Komponen Komputer',
      questioncorrect: 'Hardware TPM'),
];

/* Tentang Pengaturan Komputer untuk stage 2 pada Mode Pertama*/
List<Question> tourstage122 = [
    Question(
      questionid: '1',
      question: 'Untuk mengakses keseluruhan pengaturan Windows dapat melalui',
      listanswers: ['Settings', 'Control Panel', 'Semua benar'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Pengaturan Komputer',
      questioncorrect: 'Semua benar'),
    Question(
      questionid: '2',
      question: 'Melakukan Update pada Windows bisa melalui',
      listanswers: ['Windows Update', 'Website', 'Semua Benar'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Pengaturan Komputer',
      questioncorrect: 'Windows Update'),
    Question(
      questionid: '3',
      question: 'Tile pada Wallpaper adalah',
      listanswers: ['Mengubah Wallpaper menjadi beberapa kotak kecil', 'Memperbesar Wallpaper Komputer', 'Mengubah posisi wallpaper ke tengah'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Pengaturan Komputer',
      questioncorrect: 'Mengubah Wallpaper menjadi beberapa kotak kecil'),
    Question(
      questionid: '4',
      question: 'Dalam Windows, Change Theme mengubah',
      listanswers: ['Warna aksen pada Taskbar', 'Wallpaper Komputer', 'Semua Benar'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Pengaturan Komputer',
      questioncorrect: 'Semua Benar'),
    Question(
      questionid: '5',
      question: 'Untuk menampilkan file yang tersembunyi',
      listanswers: ['Show Hidden Files', 'Aktifkan Show Hidden File di Folder Options', 'Semua Benar'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Pengaturan Komputer',
      questioncorrect: 'Semua Benar'),
    Question(
      questionid: '6',
      question: 'Untuk mengubah nama user pada komputer pada Windows 10, dapat dilakukan melalui',
      listanswers: ['Control Panel', 'Settings', 'Semua Benar'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Pengaturan Komputer',
      questioncorrect: 'Settings'),
    Question(
      questionid: '7',
      question: 'Untuk melihat informasi mengenai spesifikasi serta bit dalam OS',
      listanswers: ['System', 'About', 'Winver'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Pengaturan Komputer',
      questioncorrect: 'Virus yang merusak komputer'),
    Question(
      questionid: '8',
      question: 'Dalam mengubah data komputer, Bagian apa yang bisa diubah (kecuali)',
      listanswers: ['Nama Komputer', 'Nama Username', 'Nama Spesifikasi'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Pengaturan Komputer',
      questioncorrect: 'Nama Spesifikasi'),
    Question(
      questionid: '9',
      question: 'Windows Update memberikan update dalam, kecuali...',
      listanswers: ['Patch Keamanan', 'Aplikasi', 'Hardware Update'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Pengaturan Komputer',
      questioncorrect: 'Aplikasi'),
    Question(
      questionid: '10',
      question: 'Untuk menentukan komputer 32 bit atau 64 bit, dapat dilihat melalui',
      listanswers: ['System', 'Winver', 'Semua Benar'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Pengaturan Komputer',
      questioncorrect: 'System'),
    Question(
      questionid: '11',
      question: 'Di Windows 10 dan 11 Pro, Edit Group Policy merupakan',
      listanswers: ['Sama Seperti Regedit', 'Pengaturan Sistem Operasi yang lebih advanced', 'Semua Benar'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Pengaturan Komputer',
      questioncorrect: 'Pengaturan Sistem Operasi yang lebih advanced'),
    Question(
      questionid: '12',
      question: 'Pengaturan yang bisa dilakukan dalam Group Policy',
      listanswers: ['Mengatur Windows Defender lebih dalam', 'Mengubah pengaturan Windows Update', 'Semua Benar'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Komponen Komputer',
      questioncorrect: 'Semua Benar'),
    Question(
      questionid: '13',
      question: 'Regedit merupakan singkatan dari',
      listanswers: ['Register Editor', 'Registry Editor', 'Semua Salah'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Komponen Komputer',
      questioncorrect: 'Registry Editor'),
];

/* Tentang Posttest Komputer dan Keamanan untuk stage 3 pada Mode Pertama*/
List<Question> tourstage131 = [
    Question(
      questionid: '1',
      question: 'Untuk mengakses keseluruhan pengaturan Windows dapat melalui',
      listanswers: ['Settings', 'Control Panel', 'Semua benar'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Pengaturan Komputer',
      questioncorrect: 'Semua benar'),
    Question(
      questionid: '2',
      question: 'Pengaturan yang bisa dilakukan dalam Group Policy',
      listanswers: ['Mengatur Windows Defender lebih dalam', 'Mengubah pengaturan Windows Update', 'Semua Benar'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Komponen Komputer',
      questioncorrect: 'Semua Benar'),
    Question(
      questionid: '3',
      question: 'Ukuran umum penyimpanan HDD yang dapat dipakai dalam Cases adalah',
      listanswers: ['2.5', '3.5', '4.5'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: '3.5'),
    Question(
      questionid: '4',
      question: 'SSD merupakan singkatan dari',
      listanswers: ['Solid State Drive', 'Storage Space Disk', 'Super Storage Disk'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Solid State Drive'),
    Question(
      questionid: '5',
      question: 'Kekurangan menggunakan HDD adalah',
      listanswers: ['Mudah berisik', 'Mudah rusak', 'Semua Benar'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Semua Benar'),
    Question(
      questionid: '6',
      question: 'Kelebihan menggunakan HDD adalah',
      listanswers: ['Harga terjangkau', 'Kapasitas lebih besar', 'Semua Benar'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Komponen Komputer',
      questioncorrect: 'Semua Benar'),
    Question(
      questionid: '7',
      question: 'Kelebihan menggunakan SSD adalah',
      listanswers: ['Instalansi Program dan OS lebih cepat', 'Tahan lama dan awet serta bebas suara', 'Semua Benar'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Semua Benar'),
    Question(
      questionid: '8',
      question: 'Kekurangan menggunakan SSD adalah',
      listanswers: ['Harga yang lebih mahal dibandingkan HDD', 'Kapasitas terlalu kecil', 'ShellShock'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Harga yang lebih mahal dibandingkan HDD'),
    Question(
      questionid: '9',
      question: 'Hal yang membedakan HDD dan SDD terkait dengan file dan aplikasi',
      listanswers: ['Kecepatan Performa', 'Kecepatan Membaca Data', 'Waktu Booting'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Kecepatan Membaca Data'),
    Question(
      questionid: '10',
      question: 'Kartu VGA adalah',
      listanswers: ['Komponen yang menampilkan UI ke Monitor', 'Komponen untuk mempercepat performa komputer', 'Komponen untuk mengatur motherboard'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Komponen yang menampilkan UI ke Monitor'),
    Question(
      questionid: '11',
      question: 'Salah satu alternatif untuk menginstall ulang Windows melalui',
      listanswers: ['Menginstall dengan ISO', 'Reset melalui Settings', 'Semua Benar'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Reset melalui Settings'),
    Question(
      questionid: '12',
      question: 'Untuk memeriksa komponen pada Windows dalam Command Prompt, Command apa yang digunakan',
      listanswers: ['sfc/ scannow', 'sfc /verifyonly', 'Semua Benar'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Komponen Komputer',
      questioncorrect: 'sfc/ scannow'),
    Question(
      questionid: '13',
      question: 'Jenis TPM Kecuali',
      listanswers: ['fTPM', 'Software TPM', 'Hardware TPM'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Komponen Komputer',
      questioncorrect: 'Hardware TPM'),
];

/* Tentang Advancced Komputer untuk stage 3 pada Mode Pertama*/
List<Question> tourstage132 = [
    Question(
      questionid: '1',
      question: 'Untuk mengakses keseluruhan pengaturan Windows dapat melalui',
      listanswers: ['Settings', 'Control Panel', 'Semua benar'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Semua benar'),
    Question(
      questionid: '2',
      question: 'Jenis Akun yang digunakan dalam Sistem Operasi pada saat ini',
      listanswers: ['Administrator', 'User', 'Semua Benar'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Recovery'),
    Question(
      questionid: '3',
      question: 'Jenis Pengaturan dalam Windows Hello, Kecuali',
      listanswers: ['Face Recongition', 'Password', 'Fingerprint'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Password'),
    Question(
      questionid: '4',
      question: 'Salah satu kelemahan dari akun berjenis Administrator kecuali',
      listanswers: ['Harus membuat password untuk administrator', 'Perlu mengakses CMD untuk membuka akses akun administrator', 'Semua Salah'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Semua Salah'),
    Question(
      questionid: '5',
      question: 'Untuk mengaktifkan TPM, Pengguna harus melakukan dengan ',
      listanswers: ['Ke BIOS', 'Menyalakan Secure Boot', 'Semua Benar'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Semua Benar'),
    Question(
      questionid: '6',
      question: 'Secure Boot adalah',
      listanswers: ['Melakukan Booting dengan Aman', 'Booting Device hanya dengan driver dan OS yang telah disignature', 'Semua Benar'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Komponen Komputer',
      questioncorrect: 'Booting Device hanya dengan driver dan OS yang telah disignature'),
    Question(
      questionid: '7',
      question: 'Malware adalah',
      listanswers: ['Virus yang merusak komputer', 'Penyebaran virus ke berbagai perangkat lunak', 'Memanfaatkan kecacatan dalam keamanan komputer untuk diserang'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Virus yang merusak komputer'),
    Question(
      questionid: '8',
      question: 'Jenis Exploit yang digunakan dalam Wannacry adalah',
      listanswers: ['EternalBlue', 'DoublePulsar', 'ShellShock'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'EternalBlue'),
    Question(
      questionid: '9',
      question: 'Untuk mencegah cyberattack, yang harus dilakukan adalah',
      listanswers: ['Mengupdate OS', 'Rutin mengupdate versi Antivirus', 'Semua Benar'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Semua Benar'),
    Question(
      questionid: '10',
      question: 'Meltdown dalam komponen komputer terjadi pada',
      listanswers: ['CPU Intel', 'CPU AMD', 'Semua Benar'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'CPU Intel'),
    Question(
      questionid: '11',
      question: 'Salah satu alternatif untuk menginstall ulang Windows melalui',
      listanswers: ['Menginstall dengan ISO', 'Reset melalui Settings', 'Semua Benar'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Reset melalui Settings'),
    Question(
      questionid: '12',
      question: 'Untuk memeriksa komponen pada Windows dalam Command Prompt, Command apa yang digunakan',
      listanswers: ['sfc/ scannow', 'sfc /verifyonly', 'Semua Benar'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Komponen Komputer',
      questioncorrect: 'sfc/ scannow'),
    Question(
      questionid: '13',
      question: 'Jenis TPM Kecuali',
      listanswers: ['fTPM', 'Software TPM', 'Hardware TPM'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Komponen Komputer',
      questioncorrect: 'Hardware TPM'),
];

/* Tentang Advancced Komputer untuk stage 3 pada Mode Pertama*/
List<Question> tourstage133 = [
    Question(
      questionid: '1',
      question: 'Untuk mengakses keseluruhan pengaturan Windows dapat melalui',
      listanswers: ['Settings', 'Control Panel', 'Semua benar'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Semua benar'),
    Question(
      questionid: '2',
      question: 'Jenis Akun yang digunakan dalam Sistem Operasi pada saat ini',
      listanswers: ['Administrator', 'User', 'Semua Benar'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Recovery'),
    Question(
      questionid: '3',
      question: 'Jenis Pengaturan dalam Windows Hello, Kecuali',
      listanswers: ['Face Recongition', 'Password', 'Fingerprint'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Password'),
    Question(
      questionid: '4',
      question: 'Salah satu kelemahan dari akun berjenis Administrator kecuali',
      listanswers: ['Harus membuat password untuk administrator', 'Perlu mengakses CMD untuk membuka akses akun administrator', 'Semua Salah'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Semua Salah'),
    Question(
      questionid: '5',
      question: 'Untuk mengaktifkan TPM, Pengguna harus melakukan dengan ',
      listanswers: ['Ke BIOS', 'Menyalakan Secure Boot', 'Semua Benar'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Semua Benar'),
    Question(
      questionid: '6',
      question: 'Secure Boot adalah',
      listanswers: ['Melakukan Booting dengan Aman', 'Booting Device hanya dengan driver dan OS yang telah disignature', 'Semua Benar'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Komponen Komputer',
      questioncorrect: 'Booting Device hanya dengan driver dan OS yang telah disignature'),
    Question(
      questionid: '7',
      question: 'Malware adalah',
      listanswers: ['Virus yang merusak komputer', 'Penyebaran virus ke berbagai perangkat lunak', 'Memanfaatkan kecacatan dalam keamanan komputer untuk diserang'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Virus yang merusak komputer'),
    Question(
      questionid: '8',
      question: 'Jenis Exploit yang digunakan dalam Wannacry adalah',
      listanswers: ['EternalBlue', 'DoublePulsar', 'ShellShock'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'EternalBlue'),
    Question(
      questionid: '9',
      question: 'Untuk mencegah cyberattack, yang harus dilakukan adalah',
      listanswers: ['Mengupdate OS', 'Rutin mengupdate versi Antivirus', 'Semua Benar'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Semua Benar'),
    Question(
      questionid: '10',
      question: 'Meltdown dalam komponen komputer terjadi pada',
      listanswers: ['CPU Intel', 'CPU AMD', 'Semua Benar'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'CPU Intel'),
    Question(
      questionid: '11',
      question: 'Salah satu alternatif untuk menginstall ulang Windows melalui',
      listanswers: ['Menginstall dengan ISO', 'Reset melalui Settings', 'Semua Benar'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Reset melalui Settings'),
    Question(
      questionid: '12',
      question: 'Untuk memeriksa komponen pada Windows dalam Command Prompt, Command apa yang digunakan',
      listanswers: ['sfc/ scannow', 'sfc /verifyonly', 'Semua Benar'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Komponen Komputer',
      questioncorrect: 'sfc/ scannow'),
    Question(
      questionid: '13',
      question: 'Jenis TPM Kecuali',
      listanswers: ['fTPM', 'Software TPM', 'Hardware TPM'],
      questionhint: 'Salah satu data yang di',
      questionexplanation: 'Komputer berasal dari Bahasa Latin',
      questionlevel: 'Beginner',
      questiontitle: 'Komponen Komputer',
      questioncorrect: 'Hardware TPM'),
];