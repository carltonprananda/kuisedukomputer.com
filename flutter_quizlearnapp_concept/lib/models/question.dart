part of 'models.dart';

class Question {
  final String questionid;
  final String question;
  final List<String> listanswers;
  final String questionhint;
  final String questionlevel;
  final String questiontitle;
  final String questioncorrect;
  Question({
    this.questionid,
    this.question,
    this.listanswers,
    this.questionhint,
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
    return 'Question(questionid: $questionid, question: $question, listanswers: $listanswers, questionhint: $questionhint, questionlevel: $questionlevel, questiontitle: $questiontitle)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Question &&
        other.questionid == questionid &&
        other.question == question &&
        listEquals(other.listanswers, listanswers) &&
        other.questionhint == questionhint &&
        other.questionlevel == questionlevel &&
        other.questiontitle == questiontitle;
  }

  @override
  int get hashCode {
    return questionid.hashCode ^
        question.hashCode ^
        listanswers.hashCode ^
        questionhint.hashCode ^
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
      questionlevel: 'Beginner',
      questiontitle: 'Komputer Dasar',
      questioncorrect: 'Latin'),
  Question(
      questionid: '2',
      question: 'Salah satu perangkat utama yang menghidupkan semua komputer',
      listanswers: ['Motherboard', 'CPU', 'Power Unit'],
      questionhint: 'Keseluruhan Komputer',
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
      questionlevel: 'Beginner',
      questiontitle: 'Komputer Dasar',
      questioncorrect: 'Random Access Memory'),
  Question(
      questionid: '4',
      question: 'HDD merupakan singkatan dari',
      listanswers: [
        'Harddisk Drive',
        'Harddisk Device',
        'Harddisk Driver',
      ],
      questionhint: 'Terletak di tengah-tengah motherboard',
      questionlevel: 'Advanced',
      questiontitle: 'Komputer Dasar',
      questioncorrect: 'Harddisk Driver'),
  Question(
      questionid: '5',
      question: 'SSD merupakan singkatan dari',
      listanswers: [
        'Solid Security Drive',
        'Solid Stable Drive',
        'Solid State Drive',
      ],
      questionhint: 'Dasar dalam Bahasa Inggris',
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
      questionlevel: 'Intermediate',
      questiontitle: 'Komponen Komputer',
      questioncorrect:
          'Konfigurasi untuk meningkatkan kestabilan dengan kecepatan'),
  Question(
      questionid: '7',
      question: 'Komponen yang bisa di overclock',
      listanswers: ['RAM', 'Harddisk', 'Power Supply'],
      questionhint: 'Pelafalan mirip dengan Bahasa Inggris',
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
      questionlevel: 'Intermediate',
      questiontitle: 'Komponen Komputer',
      questioncorrect: 'Trusted Platform Module'),
  Question(
      questionid: '9',
      question: 'Perbedaan antara Legacy dan UEFI',
      listanswers: [
        'Security UEFI Lebih Kuat',
        'UEFI hanya bisa menampung 2 TB saja',
        'Legacy dan UEFI cenderung sama'
      ],
      questionhint: 'System Requirement pada Windows 11',
      questionlevel: 'Intermediate',
      questiontitle: 'Komponen Komputer',
      questioncorrect: 'Security UEFI Lebih Kuat'),
  Question(
      questionid: '10',
      question: 'Socket dalam Motherboard adalah',
      listanswers: [
        'Penghidup Keseluruhan Komputer',
        'Penghubung Prosesor di dalam Motherboard',
        'Penghubung RAM di dalam Motherboard'
      ],
      questionhint: 'Terletak pada tengah motherboard',
      questionlevel: 'Intermediate',
      questiontitle: 'Komponen Komputer',
      questioncorrect: 'Penghubung Prosesor di dalam Motherboard'),
];
/* Tentang Komputer Dasar untuk stage 1 pada Mode Pertama*/
List<Question> tourstage111 = [
  Question(
      questionid: '1',
      question: 'Kata Komputer berasal dari Bahasa',
      listanswers: ['Latin', 'Yunani', 'Inggris'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Basic Komputer',
      questioncorrect: 'Latin'),
  Question(
      questionid: '2',
      question: 'Dalam Bahasa Inggris, Compute berarti',
      listanswers: ['Mengurangi', 'Menambahkan', 'Menghitung'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Basic Komputer',
      questioncorrect: 'Menghitung'),
  Question(
      questionid: '3',
      question: 'Power Supply Unit adalah',
      listanswers: [
        'Alat untuk memberikan tegangan arus listrik ke berbagai komponen dalam komputer',
        'Alat untuk menyalakan komputer',
        'Alat untuk menyimpan listrik dalam komponen komputer'
      ],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Basic Komputer',
      questioncorrect:
          'Alat untuk memberikan tegangan arus listrik ke berbagai komponen dalam komputer'),
  Question(
      questionid: '4',
      question: 'SSD yang memiliki 2 port disebut',
      listanswers: ['M.2', 'NVMe', 'HDD'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Basic Komputer',
      questioncorrect: 'NVMe'),
  Question(
      questionid: '5',
      question: 'Jenis DDR RAM yang banyak digunakan pada saat ini yaitu',
      listanswers: ['DDR3', 'DDR4', 'DDR5'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Basic Komputer',
      questioncorrect: 'DDR4'),
  Question(
      questionid: '6',
      question: 'Jenis Socket yang mendukung Intel adalah',
      listanswers: ['LGA 1200', 'TRX4', 'AM4'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Basic Komputer',
      questioncorrect: 'LGA 1200'),
  Question(
      questionid: '7',
      question:
          'Untuk menampilkan tampilan pada komputer diperlukan komponen pada Case yaitu',
      listanswers: ['Kartu VGA', 'Monitor', 'Semua benar'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Basic Komputer',
      questioncorrect: 'Kartu VGA'),
  Question(
      questionid: '8',
      question: 'Batas RAM yang digunakan dalam sistem operasi 32 bit adalah',
      listanswers: ['2 GB', '3 GB', '4 GB'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Basic Komputer',
      questioncorrect: '3 GB'),
  Question(
      questionid: '9',
      question:
          'Salah satu komponen komputer yang dapat menampilkan tampilan pada monitor',
      listanswers: ['Motherboard', 'VGA Card', 'Processor'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Basic Komputer',
      questioncorrect: 'VGA Card'),
  Question(
      questionid: '10',
      question:
          'Untuk mendinginkan processor, komponen apa yang harus dipasang',
      listanswers: ['Case Fans', 'Air Cooler', 'Semua Benar'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Basic Komputer',
      questioncorrect: 'Semua Benar'),
  Question(
      questionid: '11',
      question: 'Kekurangan Hard Disk Drive adalah',
      listanswers: [
        'Mengeluarkan suara bising',
        'Mengaktifkan Secure Boot',
        'Semua Benar'
      ],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Basic Komputer',
      questioncorrect: 'Semua Benar'),
  Question(
      questionid: '12',
      question: 'Kelebihan SSD M.2 adalah',
      listanswers: [
        'Transfer Data lebih cepat',
        'Kapasitas Memori Lebih kecil',
        'Slot terdiri dari 2 pemasangan'
      ],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Basic Komputer',
      questioncorrect: 'Transfer Data lebih cepat'),
  Question(
      questionid: '13',
      question:
          'Jenis driver external yang digunakan sebagai media penyimpanan pada komputer, kecuali',
      listanswers: ['CD', 'USB', 'RAM'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Basic Komputer',
      questioncorrect: 'RAM'),
  Question(
      questionid: '14',
      question: 'SSD merupakan singkatan dari',
      listanswers: [
        'Solid State Drive',
        'Security State Drive',
        'Secure State Drive'
      ],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Basic Komputer',
      questioncorrect: 'Solid State Drive'),
  Question(
      questionid: '15',
      question: 'Kelebihan SSD jenis NVMe adalah',
      listanswers: [
        'Lebih Cepat daripada M.2',
        'Harga Lebih Mahal',
        'Semua Benar'
      ],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Basic Komputer',
      questioncorrect: 'Lebih Cepat daripada M.2'),
];
/* Tentang Sistem Operasi untuk stage 2 pada Mode Pertama dalam Komputer Dasar dan stage 1 dalam Mode Kedua dalam Sistem Operasi*/
List<Question> tourstage121 = [
  Question(
      questionid: '1',
      question: 'Sistem Operasi adalah',
      listanswers: [
        'Sistem yang menghubungkan hardware dengan software',
        'Mempermudah interaksi pengguna',
        'Semua benar'
      ],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Sistem Operasi',
      questioncorrect: 'Sistem yang menghubungkan hardware dengan software'),
  Question(
      questionid: '2',
      question: 'Contoh Sistem Operasi Komputer adalah',
      listanswers: ['Windows', 'iOS', 'Android'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Sistem Operasi',
      questioncorrect: 'Windows'),
  Question(
      questionid: '3',
      question: 'Komponen dalam OS, kecuali',
      listanswers: ['File', 'UI', 'Hardware'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Sistem Operasi',
      questioncorrect: 'Hardware'),
  Question(
      questionid: '4',
      question: 'UI merupakan singkatan dari',
      listanswers: [
        'Utility Interface',
        'User Inteface',
        'User Impelementation'
      ],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Sistem Operasi',
      questioncorrect: 'User Inteface'),
  Question(
      questionid: '5',
      question: 'Fungsi Sistem Operasi kecuali',
      listanswers: [
        'Sebagai Manajemen Sumber Daya Komputer',
        'Mengoptimal Fungsi Perangkat Komputer',
        'Menghubungkan Software'
      ],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Menghubungkan Software'),
  Question(
      questionid: '6',
      question: 'System Requriement dalam Sistem Operasi adalah',
      listanswers: [
        'Mengetahui spesifikasi yang handal untuk menjalankan OS',
        'Menentukan spesifikasi penting Sistem Operasi dapat berjalan dengan lancar',
        'Semua Benar'
      ],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Komponen Komputer',
      questioncorrect: 'Semua Benar'),
  Question(
      questionid: '7',
      question: 'Software dalam Sistem Operasi adalah',
      listanswers: [
        'Aplikasi untuk mengelola komputer',
        'Aplikasi untuk menampilkan gambar di monitor',
        'Aplikasi yang terdiri atas Browser dan Game'
      ],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Aplikasi untuk mengelola komputer'),
  Question(
      questionid: '8',
      question: 'Management yang ada di Sistem Operasi, Kecuali',
      listanswers: ['Device', 'Component', 'File'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Component'),
  Question(
      questionid: '9',
      question: 'Ciri-ciri Sistem Operasi 32-bit adalah',
      listanswers: [
        'RAM Terbatas Hingga 3 GB',
        'Dapat menjalankan program 16-bit',
        'Semua Benar'
      ],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Semua Benar'),
  Question(
      questionid: '10',
      question: 'Ciri-ciri Sistem Operasi 64-bit kecuali',
      listanswers: [
        'Dukungan RAM diatas 4 GB',
        'Tidak dapat menjalankan program 32-bit',
        'Semua Benar'
      ],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Semua Benar'),
  Question(
      questionid: '11',
      question: 'Instalansi Sistem Operasi dapat dilakukan melalui',
      listanswers: ['USB', 'CD', 'Floppy'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'USB'),
  Question(
      questionid: '12',
      question: 'Windows, MacOS dan Linux adalah sistem operasi berjenis',
      listanswers: ['Networking', 'Live CD', 'Standalone'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Komponen Komputer',
      questioncorrect: 'Standalone'),
  Question(
      questionid: '13',
      question: 'Tahapan Sistem Operasi terdiri atas,',
      listanswers: ['Hardware', 'Browser', 'Explorer'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Komponen Komputer',
      questioncorrect: 'Hardware'),
  Question(
      questionid: '14',
      question: 'Tahapan Sistem Operasi terdiri atas, kecuali',
      listanswers: ['Hardware', 'Software', 'Database'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Komponen Komputer',
      questioncorrect: 'Database'),
  Question(
      questionid: '15',
      question: 'Tahapan Sistem Operasi terdiri atas, kecuali',
      listanswers: ['Hardware', 'Software', 'Database'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Komponen Komputer',
      questioncorrect: 'Database'),
];

/* Tentang Keamanan Komputer untuk stage 2 pada Mode Pertama*/
List<Question> tourstage122 = [
  Question(
      questionid: '1',
      question: 'Definisi Keamanan Komputer',
      listanswers: [
        'Pencegahan diri dan deteksi dalam system komputer',
        'Pencegahan dari serangan pengguna komputer',
        'Semua Benar'
      ],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Semua Benar'),
  Question(
      questionid: '2',
      question: 'Tingkat keamanan akun sistem operasi paling banyak digunakan',
      listanswers: ['Password', 'Fingerprint', 'Scanner'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Password'),
  Question(
      questionid: '3',
      question: 'Malware merupakan singkatan dari',
      listanswers: ['Malicious Hardware', 'Malicious Software', 'Semua Salah'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Malicious Software'),
  Question(
      questionid: '4',
      question:
          'Aplikasi antivirus yang merupakan aplikasi dari pihak ketiga, kecuali',
      listanswers: ['AVG Antivirus', 'McAfee Total Protection', 'Semua Benar'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Pengaturan Komputer',
      questioncorrect: 'Semua Benar'),
  Question(
      questionid: '5',
      question:
          'Untuk meningkatkan keamanan di komputer, maka hal apa yang harus dilakukan',
      listanswers: [
        'Menginstall Antivirus',
        'Menggunakan Cracking',
        'Menggunakan Patching'
      ],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Pengaturan Komputer',
      questioncorrect: 'Menginstall Antivirus'),
  Question(
      questionid: '6',
      question: 'Aspek dalam Keamanan Komputer, Kecuali',
      listanswers: ['Privasi', 'Keamanan', 'Modification'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Pengaturan Komputer',
      questioncorrect: 'Modification'),
  Question(
      questionid: '7',
      question: 'Malware adalah',
      listanswers: [
        'Virus yang merusak komputer',
        'Penyebaran virus ke berbagai perangkat lunak',
        'Memanfaatkan kecacatan dalam keamanan komputer untuk diserang'
      ],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Virus yang merusak komputer'),
  Question(
      questionid: '8',
      question: 'Jenis Exploit yang digunakan dalam Wannacry adalah',
      listanswers: ['EternalBlue', 'DoublePulsar', 'ShellShock'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'EternalBlue'),
  Question(
      questionid: '9',
      question: 'Untuk mencegah cyberattack, yang harus dilakukan adalah',
      listanswers: [
        'Mengupdate OS',
        'Rutin mengupdate versi Antivirus',
        'Semua Benar'
      ],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Semua Benar'),
  Question(
      questionid: '10',
      question: 'Virus adalah',
      listanswers: [
        'Program yang dibuat untuk merusak file',
        'Program yang dibuat untuk memperlambat OS',
        'Program yang dibuat untuk membuat error'
      ],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Program yang dibuat untuk merusak file'),
  Question(
      questionid: '11',
      question: 'Trojan adalah',
      listanswers: [
        'Perangkat lunak berbahaya yang dapat merusak sebuah sistem',
        'Jenis Virus yang sangat berbahaya',
        'Perangkat lunak yang serupa dengan virus'
      ],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect:
          'Perangkat lunak berbahaya yang dapat merusak sebuah sistem'),
  Question(
      questionid: '12',
      question: 'Perbedaan antara Virus dan Trojan',
      listanswers: [
        'Mengatur Windows Defender lebih dalam',
        'Mengubah pengaturan Windows Update',
        'Semua Benar'
      ],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Semua Benar'),
  Question(
      questionid: '13',
      question: 'Contoh Ransomware yang terkenal adalah',
      listanswers: ['Syskey', 'Wannacry', 'Semua Benar'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Semua Benar'),
  Question(
      questionid: '14',
      question: 'Jenis Malware',
      listanswers: ['Software', 'Hardware', 'Spyware'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Spyware'),
  Question(
      questionid: '15',
      question: 'Perbedaan Adware dan Spyware',
      listanswers: [
        'Adware sering dijumpai pada iklan sedangkan Spyware sering dijumpai pada komputer',
        'Adware sering dijumpai pada iklan sedangkan Spyware sering dijumpai pada aplikasi',
        'Adware sering dijumpai pada iklan web maupun aplikasi sedangkan Spyware sering dijumpai pada email'
      ],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect:
          'Adware sering dijumpai pada iklan sedangkan Spyware sering dijumpai pada aplikasi'),
];

/* Tentang Posttest Komputer dan Sistem Operasi untuk stage 3 pada Mode Pertama*/
List<Question> tourstage131 = [
  Question(
      questionid: '1',
      question: 'Kata Komputer berasal dari Bahasa',
      listanswers: ['Yunani', 'Inggris', 'Latin' 'Sanskerta'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Basic Komputer',
      questioncorrect: 'Latin'),
  Question(
      questionid: '2',
      question: 'Dalam Bahasa Inggris, Compute berarti',
      listanswers: ['Mengurangi', 'Menambahkan', 'Menukarkan', 'Menghitung'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Basic Komputer',
      questioncorrect: 'Menghitung'),
  Question(
      questionid: '3',
      question: 'Power Supply Unit adalah',
      listanswers: [
        'Alat untuk menyalakan komputer',
        'Alat untuk memberikan tegangan arus listrik ke berbagai komponen dalam komputer',
        'Alat untuk menyimpan listrik dalam komponen komputer',
        'Alat untuk menyalakan listrik untuk komputer'
      ],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Basic Komputer',
      questioncorrect:
          'Alat untuk memberikan tegangan arus listrik ke berbagai komponen dalam komputer'),
  Question(
      questionid: '4',
      question: 'SSD yang memiliki 2 port disebut',
      listanswers: ['M.2', 'PCIe', 'NVMe', 'HDD'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Basic Komputer',
      questioncorrect: 'NVMe'),
  Question(
      questionid: '5',
      question: 'Jenis DDR RAM yang banyak digunakan pada saat ini yaitu',
      listanswers: ['DDR3', 'DDR4', 'DDR5', 'DDR4 dan DDR5'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Basic Komputer',
      questioncorrect: 'DDR4 dan DDR5'),
  Question(
      questionid: '6',
      question: 'Jenis Socket yang mendukung AMD adalah',
      listanswers: ['LGA 1200', 'TRX4', 'AM4', 'AM4 dan TRX4'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Basic Komputer',
      questioncorrect: 'AM4 dan TRX4'),
  Question(
      questionid: '7',
      question:
          'Untuk menampilkan tampilan pada komputer diperlukan komponen pada Case yaitu',
      listanswers: ['Monitor', 'Kartu VGA', 'Motherboard', 'Semua benar'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Basic Komputer',
      questioncorrect: 'Kartu VGA'),
  Question(
      questionid: '8',
      question: 'Batas RAM yang digunakan dalam sistem operasi 32 bit adalah',
      listanswers: ['3 GB', '4 GB', '6 GB', '8 GB'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Basic Komputer',
      questioncorrect: '3 GB'),
  Question(
      questionid: '9',
      question:
          'Salah satu komponen komputer yang dapat menampilkan tampilan pada monitor',
      listanswers: ['Motherboard', 'Processor', 'CPU', 'Kartu VGA'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Basic Komputer',
      questioncorrect: 'Kartu VGA'),
  Question(
      questionid: '10',
      question:
          'Untuk mendinginkan processor, komponen apa yang harus dipasang',
      listanswers: [
        'Case Fans',
        'Air Cooler',
        'Watercooled Fans',
        'Semua Benar'
      ],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Basic Komputer',
      questioncorrect: 'Semua Benar'),
  Question(
      questionid: '11',
      question: 'Kekurangan Hard Disk Drive adalah',
      listanswers: [
        'Mengeluarkan suara bising',
        'Harga lebih murah',
        'Hemat biaya pembuatan'
            'Semua Benar'
      ],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Basic Komputer',
      questioncorrect: 'Mengeluarkan suara bising'),
  Question(
      questionid: '12',
      question: 'Kelebihan SSD M.2 adalah',
      listanswers: [
        'Transfer Data lebih cepat',
        'Kapasitas Memori Lebih kecil',
        'Slot terdiri dari 3 pemasangan',
        'Transfer Data lebih cepat dan Slot terdiri dari 3 pemasangan'
      ],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Basic Komputer',
      questioncorrect: 'Transfer Data lebih cepat'),
  Question(
      questionid: '13',
      question:
          'Jenis driver external yang digunakan sebagai media penyimpanan pada komputer',
      listanswers: ['CD', 'USB', 'Floppy', 'Semua Benar'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Basic Komputer',
      questioncorrect: 'Semua Benar'),
  Question(
      questionid: '14',
      question: 'SSD merupakan singkatan dari',
      listanswers: [
        'Super Solid Drive',
        'Solid State Drive',
        'Security State Drive',
        'Secure State Drive'
      ],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Basic Komputer',
      questioncorrect: 'Solid State Drive'),
  Question(
      questionid: '15',
      question: 'Kelebihan SSD jenis NVMe adalah',
      listanswers: [
        'Lebih Cepat daripada M.2',
        'Harga Lebih Mahal',
        'Digunakan dalam Gaming dan Multitasking yang lebih berat'
            'Semua Benar'
      ],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Basic Komputer',
      questioncorrect: 'Lebih Cepat daripada M.2'),
];

/* Tentang Posttest Komputer dan Keamanan Komputer untuk stage 3 pada Mode Pertama*/
List<Question> tourstage132 = [
  Question(
      questionid: '1',
      question: 'Kata Komputer berasal dari Bahasa',
      listanswers: ['Yunani', 'Inggris', 'Latin' 'Sanskerta'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Basic Komputer',
      questioncorrect: 'Latin'),
  Question(
      questionid: '2',
      question: 'Dalam Bahasa Inggris, Compute berarti',
      listanswers: ['Mengurangi', 'Menambahkan', 'Menukarkan', 'Menghitung'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Basic Komputer',
      questioncorrect: 'Menghitung'),
  Question(
      questionid: '3',
      question: 'Power Supply Unit adalah',
      listanswers: [
        'Alat untuk menyalakan komputer',
        'Alat untuk memberikan tegangan arus listrik ke berbagai komponen dalam komputer',
        'Alat untuk menyimpan listrik dalam komponen komputer',
        'Alat untuk menyalakan listrik untuk komputer'
      ],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Basic Komputer',
      questioncorrect:
          'Alat untuk memberikan tegangan arus listrik ke berbagai komponen dalam komputer'),
  Question(
      questionid: '4',
      question: 'SSD yang memiliki 2 port disebut',
      listanswers: ['M.2', 'PCIe', 'NVMe', 'HDD'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Basic Komputer',
      questioncorrect: 'NVMe'),
  Question(
      questionid: '5',
      question: 'Jenis DDR RAM yang banyak digunakan pada saat ini yaitu',
      listanswers: ['DDR3', 'DDR4', 'DDR5', 'DDR4 dan DDR5'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Basic Komputer',
      questioncorrect: 'DDR4 dan DDR5'),
  Question(
      questionid: '6',
      question: 'Jenis Socket yang mendukung AMD adalah',
      listanswers: ['LGA 1200', 'TRX4', 'AM4', 'AM4 dan TRX4'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Basic Komputer',
      questioncorrect: 'AM4 dan TRX4'),
  Question(
      questionid: '7',
      question:
          'Untuk menampilkan tampilan pada komputer diperlukan komponen pada Case yaitu',
      listanswers: ['Monitor', 'Kartu VGA', 'Motherboard', 'Semua benar'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Basic Komputer',
      questioncorrect: 'Kartu VGA'),
  Question(
      questionid: '8',
      question: 'Batas RAM yang digunakan dalam sistem operasi 32 bit adalah',
      listanswers: ['3 GB', '4 GB', '6 GB', '8 GB'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Basic Komputer',
      questioncorrect: '3 GB'),
  Question(
      questionid: '9',
      question:
          'Salah satu komponen komputer yang dapat menampilkan tampilan pada monitor',
      listanswers: ['Motherboard', 'Processor', 'CPU', 'Kartu VGA'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Basic Komputer',
      questioncorrect: 'Kartu VGA'),
  Question(
      questionid: '10',
      question:
          'Untuk mendinginkan processor, komponen apa yang harus dipasang',
      listanswers: [
        'Case Fans',
        'Air Cooler',
        'Watercooled Fans',
        'Semua Benar'
      ],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Basic Komputer',
      questioncorrect: 'Semua Benar'),
  Question(
      questionid: '11',
      question: 'Kekurangan Hard Disk Drive adalah',
      listanswers: [
        'Mengeluarkan suara bising',
        'Harga lebih murah',
        'Hemat biaya pembuatan'
            'Semua Benar'
      ],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Basic Komputer',
      questioncorrect: 'Mengeluarkan suara bising'),
  Question(
      questionid: '12',
      question: 'Kelebihan SSD M.2 adalah',
      listanswers: [
        'Transfer Data lebih cepat',
        'Kapasitas Memori Lebih kecil',
        'Slot terdiri dari 3 pemasangan',
        'Transfer Data lebih cepat dan Slot terdiri dari 3 pemasangan'
      ],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Basic Komputer',
      questioncorrect: 'Transfer Data lebih cepat'),
  Question(
      questionid: '13',
      question:
          'Jenis driver external yang digunakan sebagai media penyimpanan pada komputer',
      listanswers: ['CD', 'USB', 'Floppy', 'Semua Benar'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Basic Komputer',
      questioncorrect: 'Semua Benar'),
  Question(
      questionid: '14',
      question: 'SSD merupakan singkatan dari',
      listanswers: [
        'Super Solid Drive',
        'Solid State Drive',
        'Security State Drive',
        'Secure State Drive'
      ],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Basic Komputer',
      questioncorrect: 'Solid State Drive'),
  Question(
      questionid: '15',
      question: 'Kelebihan SSD jenis NVMe adalah',
      listanswers: [
        'Lebih Cepat daripada M.2',
        'Harga Lebih Mahal',
        'Digunakan dalam Gaming dan Multitasking yang lebih berat'
        'Semua Benar'
      ],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Basic Komputer',
      questioncorrect: 'Lebih Cepat daripada M.2'),
  Question(
      questionid: '16',
      question: 'Sistem Operasi adalah',
      listanswers: [
        'Sistem yang menghubungkan hardware dengan software',
        'Mempermudah interaksi pengguna',
        'Semua benar'
      ],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Sistem Operasi',
      questioncorrect: 'Sistem yang menghubungkan hardware dengan software'),
  Question(
      questionid: '17',
      question: 'Contoh Sistem Operasi adalah',
      listanswers: ['Windows', 'iOS', 'Android'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Sistem Operasi',
      questioncorrect: 'Windows'),
  Question(
      questionid: '18',
      question: 'Komponen dalam OS, kecuali',
      listanswers: ['File', 'UI', 'Hardware'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Sistem Operasi',
      questioncorrect: 'Hardware'),
  Question(
      questionid: '19',
      question: 'UI merupakan singkatan dari',
      listanswers: [
        'Utility Interface',
        'User Inteface',
        'User Impelementation'
      ],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Sistem Operasi',
      questioncorrect: 'User Inteface'),
  Question(
      questionid: '20',
      question: 'Fungsi Sistem Operasi kecuali',
      listanswers: [
        'Sebagai Manajemen Sumber Daya Komputer',
        'Mengoptimal Fungsi Perangkat Komputer',
        'Menghubungkan Software'
      ],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Menghubungkan Software'),
  Question(
      questionid: '21',
      question: 'System Requriement dalam Sistem Operasi adalah',
      listanswers: [
        'Mengetahui spesifikasi yang handal untuk menjalankan OS',
        'Menentukan spesifikasi penting Sistem Operasi dapat berjalan dengan lancar',
        'Semua Benar'
      ],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Komponen Komputer',
      questioncorrect: 'Semua Benar'),
  Question(
      questionid: '22',
      question: 'Software dalam Sistem Operasi adalah',
      listanswers: [
        'Aplikasi untuk mengelola komputer',
        'Aplikasi untuk menampilkan gambar di monitor',
        'Aplikasi yang terdiri atas Browser dan Game'
      ],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Aplikasi untuk mengelola komputer'),
  Question(
      questionid: '23',
      question: 'Management yang ada di Sistem Operasi, Kecuali',
      listanswers: ['Device', 'Component', 'File'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Component'),
  Question(
      questionid: '24',
      question: 'Ciri-ciri Sistem Operasi 32-bit adalah',
      listanswers: [
        'RAM Terbatas Hingga 3 GB',
        'Dapat menjalankan program 16-bit',
        'Semua Benar'
      ],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Semua Benar'),
  Question(
      questionid: '25',
      question: 'Ciri-ciri Sistem Operasi 64-bit kecuali',
      listanswers: [
        'Dukungan RAM diatas 4 GB',
        'Tidak dapat menjalankan program 32-bit',
        'Semua Benar'
      ],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Semua Benar'),
  Question(
      questionid: '26',
      question: 'Instalansi Sistem Operasi dapat dilakukan melalui',
      listanswers: ['USB', 'CD', 'Floppy'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'USB'),
  Question(
      questionid: '27',
      question: 'Windows, MacOS dan Linux adalah sistem operasi berjenis',
      listanswers: ['Networking', 'Live CD', 'Standalone'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Komponen Komputer',
      questioncorrect: 'Standalone'),
  Question(
      questionid: '28',
      question: 'Tahapan Sistem Operasi terdiri atas, ',
      listanswers: ['Hardware', 'Browser', 'Explorer'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Komponen Komputer',
      questioncorrect: 'Hardware'),
  Question(
      questionid: '29',
      question: 'Tahapan Sistem Operasi terdiri atas, kecuali',
      listanswers: ['Hardware', 'Software', 'Database'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Komponen Komputer',
      questioncorrect: 'Database'),
  Question(
      questionid: '30',
      question: 'Tahapan Sistem Operasi terdiri atas',
      listanswers: ['Hardware', 'Software', 'Database', 'Hardware dan Software'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Komponen Komputer',
      questioncorrect: 'Hardware dan Software'),
];

/* Tentang Advanced Komputer untuk stage 3 pada Mode Pertama*/
List<Question> tourstage133 = [
  Question(
      questionid: '1',
      question: 'Untuk mengakses keseluruhan pengaturan Windows dapat melalui',
      listanswers: ['Settings', 'Control Panel', 'Semua benar'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Semua benar'),
  Question(
      questionid: '2',
      question: 'Jenis Akun yang digunakan dalam Sistem Operasi pada saat ini',
      listanswers: ['Administrator', 'User', 'Semua Benar'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Recovery'),
  Question(
      questionid: '3',
      question: 'Jenis Pengaturan dalam Windows Hello, Kecuali',
      listanswers: ['Face Recongition', 'Password', 'Fingerprint'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Password'),
  Question(
      questionid: '4',
      question: 'Salah satu kelemahan dari akun berjenis Administrator kecuali',
      listanswers: [
        'Harus membuat password untuk administrator',
        'Perlu mengakses CMD untuk membuka akses akun administrator',
        'Semua Salah'
      ],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Semua Salah'),
  Question(
      questionid: '5',
      question: 'Untuk mengaktifkan TPM, Pengguna harus melakukan dengan ',
      listanswers: ['Ke BIOS', 'Menyalakan Secure Boot', 'Semua Benar'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Semua Benar'),
  Question(
      questionid: '6',
      question: 'Secure Boot adalah',
      listanswers: [
        'Melakukan Booting dengan Aman',
        'Booting Device hanya dengan driver dan OS yang telah disignature',
        'Semua Benar'
      ],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Komponen Komputer',
      questioncorrect:
          'Booting Device hanya dengan driver dan OS yang telah disignature'),
  Question(
      questionid: '7',
      question: 'Malware adalah',
      listanswers: [
        'Virus yang merusak komputer',
        'Penyebaran virus ke berbagai perangkat lunak',
        'Memanfaatkan kecacatan dalam keamanan komputer untuk diserang'
      ],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Virus yang merusak komputer'),
  Question(
      questionid: '8',
      question: 'Jenis Exploit yang digunakan dalam Wannacry adalah',
      listanswers: ['EternalBlue', 'DoublePulsar', 'ShellShock'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'EternalBlue'),
  Question(
      questionid: '9',
      question: 'Untuk mencegah cyberattack, yang harus dilakukan adalah',
      listanswers: [
        'Mengupdate OS',
        'Rutin mengupdate versi Antivirus',
        'Semua Benar'
      ],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Semua Benar'),
  Question(
      questionid: '10',
      question: 'Meltdown dalam komponen komputer terjadi pada',
      listanswers: ['CPU Intel', 'CPU AMD', 'Semua Benar'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'CPU Intel'),
  Question(
      questionid: '11',
      question: 'Salah satu alternatif untuk menginstall ulang Windows melalui',
      listanswers: [
        'Menginstall dengan ISO',
        'Reset melalui Settings',
        'Semua Benar'
      ],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Reset melalui Settings'),
  Question(
      questionid: '12',
      question:
          'Untuk memeriksa komponen pada Windows dalam Command Prompt, Command apa yang digunakan',
      listanswers: ['sfc/ scannow', 'sfc /verifyonly', 'Semua Benar'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Komponen Komputer',
      questioncorrect: 'sfc/ scannow'),
  Question(
      questionid: '13',
      question: 'Jenis TPM Kecuali',
      listanswers: ['fTPM', 'Software TPM', 'Hardware TPM'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Komponen Komputer',
      questioncorrect: 'Hardware TPM'),
];

/* Tentang Sistem Operasi Windows untuk stage 2 pada Mode Kedua*/
List<Question> tourstage221 = [
  Question(
      questionid: '1',
      question: 'Windows Merupakan OS yang bersifat',
      listanswers: ['Open Source', 'Close Source', 'Campuran'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Pengaturan Komputer',
      questioncorrect: 'Close Source'),
  Question(
      questionid: '2',
      question:
          'Untuk menjalankan aplikasi Run, Tombol shortcut untuk Windows Run adalah',
      listanswers: ['WIN + R', 'WIN + C', 'WIN + I'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Komponen Komputer',
      questioncorrect: 'WIN + R'),
  Question(
      questionid: '3',
      question: 'Windows Explorer adalah ... ',
      listanswers: [
        'Sistem Management',
        'File Management',
        'Driver Management'
      ],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'File Management'),
  Question(
      questionid: '4',
      question: 'Powershell adalah ',
      listanswers: [
        'Interface Antar Muka untuk melakukan task',
        'Interface Command Line untuk melakukan task',
        'Interface Terminal untuk melakukan task'
      ],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Interface Command Line untuk melakukan task'),
  Question(
      questionid: '5',
      question: 'Yang ada di dalam Start Menu, kecuali',
      listanswers: ['Daftar Program', 'Menu Boot', 'Semua Salah'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Semua Salah'),
  Question(
      questionid: '6',
      question: 'Label pada Local Disc adalah',
      listanswers: ['A', 'C', 'D'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Komponen Komputer',
      questioncorrect: 'C'),
  Question(
      questionid: '7',
      question: 'Label pada Drive Kedua adalah',
      listanswers: ['D', 'E', 'Semua Benar'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Semua Benar'),
  Question(
      questionid: '8',
      question: 'Label pada Floppy adalah',
      listanswers: ['A', 'B', 'C'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'A'),
  Question(
      questionid: '9',
      question: 'Windows Pertama kali diperkenalkan pada tahun',
      listanswers: ['1975', '1985', '1995'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: '1985'),
  Question(
      questionid: '10',
      question: 'Task Manager adalah',
      listanswers: [
        'Aplikasi yang berisikan untuk melihat proses aplikasi beserta komponen',
        'Aplikasi yang berisikan untuk melihat status aplikasi beserta komponen',
        'Aplikasi yang berisikan untuk melihat error aplikasi beserta komponen'
      ],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect:
          'Aplikasi yang berisikan untuk melihat proses aplikasi beserta komponen'),
  Question(
      questionid: '11',
      question: 'Taskbar adalah',
      listanswers: [
        'Kumpulan aplikasi dan status dalam Windows',
        'Kumpulan beberapa aplikasi beserta aplikasi yang telah dipin dan status dalam Windows',
        'Berisikan Start Menu, Kumpulan beberapa aplikasi beserta aplikasi yang telah dipin dan status dalam Windows'
      ],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect:
          'Berisikan Start Menu, Kumpulan beberapa aplikasi beserta aplikasi yang telah dipin dan status dalam Windows'),
  Question(
      questionid: '12',
      question:
          'Untuk memeriksa komponen pada Windows dalam Command Prompt, Command apa yang digunakan',
      listanswers: ['sfc/ scannow', 'sfc /verifyonly', 'Semua Benar'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Windows',
      questioncorrect: 'sfc/ scannow'),
  Question(
      questionid: '13',
      question: 'Windows versi terkini yang dirilis pada 2021 adalah',
      listanswers: ['Windows 7', 'Windows 10', 'Windows 11'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Komponen Komputer',
      questioncorrect: 'Windows 11'),
  Question(
      questionid: '14',
      question: 'Ciri-ciri Windows 64-bit kecuali',
      listanswers: [
        'Dapat menjalankan program 16-bit',
        'Mendukung RAM diatas 4 GB',
        'Aplikasi 32-bit tetap berjalan dalam 64-bit'
      ],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Komponen Komputer',
      questioncorrect: 'Dapat menjalankan program 16-bit'),
  Question(
      questionid: '15',
      question: 'Ciri-ciri Windows 32-bit adalah',
      listanswers: [
        'Dapat menjalankan program 16-bit',
        'Mendukung RAM diatas 4 GB',
        'Aplikasi 64-bit tetap berjalan dalam 32-bit'
      ],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Komponen Komputer',
      questioncorrect: 'Dapat menjalankan program 16-bit'),
];
/* Tentang Sistem Operasi Mac OS untuk stage 2 pada Mode Kedua*/
List<Question> tourstage222 = [
  Question(
      questionid: '1',
      question: 'Mac OS dibuat oleh ',
      listanswers: ['Apple', 'Google', 'Microsoft'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Pengaturan Komputer',
      questioncorrect: 'Close Source'),
  Question(
      questionid: '2',
      question:
          'Di Windows terdapat tombol Start dan Di Mac OS terdapat tombol',
      listanswers: ['Alt', 'Command', 'Ctrl'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Komponen Komputer',
      questioncorrect: 'Command'),
  Question(
      questionid: '3',
      question: 'File Management dalam Mac OS adalah',
      listanswers: ['Finder', 'Explorer', 'Manager'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Finder'),
  Question(
      questionid: '4',
      question: 'Taskbar dalam Mac OS disebut dengan',
      listanswers: [
        'Taskbar',
        'Dock',
        'Window'
      ],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Dock'),
  Question(
      questionid: '5',
      question: 'Kelebihan Mac OS, kecuali',
      listanswers: ['Performa Maksimal', 'Cocok untuk Kreator di bidang Grafis', 'Bisa diinstal di berbagai perangkat'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Bisa diinstal di berbagai perangkat'),
  Question(
      questionid: '6',
      question: 'Kekurangan Mac OS, kecuali',
      listanswers: ['Hanya didukung oleh Perangkat Apple', 'Kurang Cocok Untuk Gaming', 'Harga Murah'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Komponen Komputer',
      questioncorrect: 'Harga Murah'),
  Question(
      questionid: '7',
      question: 'Perangkat MacOS',
      listanswers: ['iPhone', 'Macbook', 'iPad'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Macbook'),
  Question(
      questionid: '8',
      question: 'Command Prompt dalam Apple disebut',
      listanswers: ['MS DOS Prompt', 'Terminal', 'Powershell'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Terminal'),
  Question(
      questionid: '9',
      question: 'Perintah Mac untuk melihat isi directory/folder',
      listanswers: ['dir', 'ls', 'cd'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'ls'),
  Question(
      questionid: '10',
      question: 'Text editor dalam Terimnal MacOS disebut',
      listanswers: [
        'Edit',
        'Notepad',
        'Nano'
      ],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect:
          'Aplikasi yang berisikan untuk melihat proses aplikasi beserta komponen'),
  Question(
      questionid: '11',
      question: 'Sudo su adalah',
      listanswers: [
        'Masuk sebagai akun root tingkat administrator',
        'Logout user session saat ini',
        'Masuk sebagai akun root tingkat guest'
      ],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect:
          'Masuk sebagai akun root tingkat administrator'),
  Question(
      questionid: '12',
      question:
          'Control Panel dalam Mac Disebut',
      listanswers: ['Settings', 'System Preferences', 'Semua Benar'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Windows',
      questioncorrect: 'System Preferences'),
  Question(
      questionid: '13',
      question: 'Windows versi terkini yang dirilis pada 2021 adalah',
      listanswers: ['Windows 7', 'Windows 10', 'Windows 11'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Komponen Komputer',
      questioncorrect: 'Windows 11'),
  Question(
      questionid: '14',
      question: 'Ciri-ciri Sistem operasi 64-bit dalam MacOS Saat ini',
      listanswers: [
        'Dapat menjalankan program 16-bit',
        'Mendukung RAM diatas 4 GB',
        'Aplikasi 32-bit tetap berjalan dalam 64-bit'
      ],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Komponen Komputer',
      questioncorrect: 'Mendukung RAM diatas 4 GB'),
  Question(
      questionid: '15',
      question: 'Toko Aplikasi di Mac disebut',
      listanswers: [
        'App Store',
        'Play Store',
        'Microsoft Store'
      ],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Komponen Komputer',
      questioncorrect: 'App Store'),
];
/* Tentang Sistem Operasi Windows Mac OS untuk stage 2 pada Mode Ketiga*/
List<Question> tourstage223 = [
  Question(
      questionid: '1',
      question: 'Windows Merupakan OS yang bersifat',
      listanswers: ['Open Source', 'Close Source', 'Campuran'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Pengaturan Komputer',
      questioncorrect: 'Close Source'),
  Question(
      questionid: '2',
      question:
          'Untuk menjalankan aplikasi Run, Tombol shortcut untuk Windows Run adalah',
      listanswers: ['WIN + R', 'WIN + C', 'WIN + I'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Komponen Komputer',
      questioncorrect: 'WIN + R'),
  Question(
      questionid: '3',
      question: 'Windows Explorer adalah ... ',
      listanswers: [
        'Sistem Management',
        'File Management',
        'Driver Management'
      ],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'File Management'),
  Question(
      questionid: '4',
      question: 'Powershell adalah ',
      listanswers: [
        'Interface Antar Muka untuk melakukan task',
        'Interface Command Line untuk melakukan task',
        'Interface Terminal untuk melakukan task'
      ],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Interface Command Line untuk melakukan task'),
  Question(
      questionid: '5',
      question: 'Yang ada di dalam Start Menu, kecuali',
      listanswers: ['Daftar Program', 'Menu Boot', 'Semua Salah'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Semua Salah'),
  Question(
      questionid: '6',
      question: 'Label pada Local Disc adalah',
      listanswers: ['A', 'C', 'D'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Komponen Komputer',
      questioncorrect: 'C'),
  Question(
      questionid: '7',
      question: 'Label pada Drive Kedua adalah',
      listanswers: ['D', 'E', 'Semua Benar'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Semua Benar'),
  Question(
      questionid: '8',
      question: 'Label pada Floppy adalah',
      listanswers: ['A', 'B', 'C'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'A'),
  Question(
      questionid: '9',
      question: 'Windows Pertama kali diperkenalkan pada tahun',
      listanswers: ['1975', '1985', '1995'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: '1985'),
  Question(
      questionid: '10',
      question: 'Task Manager adalah',
      listanswers: [
        'Aplikasi yang berisikan untuk melihat proses aplikasi beserta komponen',
        'Aplikasi yang berisikan untuk melihat status aplikasi beserta komponen',
        'Aplikasi yang berisikan untuk melihat error aplikasi beserta komponen'
      ],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect:
          'Aplikasi yang berisikan untuk melihat proses aplikasi beserta komponen'),
  Question(
      questionid: '11',
      question: 'Taskbar adalah',
      listanswers: [
        'Kumpulan aplikasi dan status dalam Windows',
        'Kumpulan beberapa aplikasi beserta aplikasi yang telah dipin dan status dalam Windows',
        'Berisikan Start Menu, Kumpulan beberapa aplikasi beserta aplikasi yang telah dipin dan status dalam Windows'
      ],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect:
          'Berisikan Start Menu, Kumpulan beberapa aplikasi beserta aplikasi yang telah dipin dan status dalam Windows'),
  Question(
      questionid: '12',
      question:
          'Untuk memeriksa komponen pada Windows dalam Command Prompt, Command apa yang digunakan',
      listanswers: ['sfc/ scannow', 'sfc /verifyonly', 'Semua Benar'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Windows',
      questioncorrect: 'sfc/ scannow'),
  Question(
      questionid: '13',
      question: 'Windows versi terkini yang dirilis pada 2021 adalah',
      listanswers: ['Windows 7', 'Windows 10', 'Windows 11'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Komponen Komputer',
      questioncorrect: 'Windows 11'),
  Question(
      questionid: '14',
      question: 'Ciri-ciri Windows 64-bit kecuali',
      listanswers: [
        'Dapat menjalankan program 16-bit',
        'Mendukung RAM diatas 4 GB',
        'Aplikasi 32-bit tetap berjalan dalam 64-bit'
      ],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Komponen Komputer',
      questioncorrect: 'Dapat menjalankan program 16-bit'),
  Question(
      questionid: '15',
      question: 'Ciri-ciri Windows 32-bit adalah',
      listanswers: [
        'Dapat menjalankan program 16-bit',
        'Mendukung RAM diatas 4 GB',
        'Aplikasi 64-bit tetap berjalan dalam 32-bit'
      ],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Komponen Komputer',
      questioncorrect: 'Dapat menjalankan program 16-bit'),
    Question(
      questionid: '16',
      question: 'Mac OS dibuat oleh ',
      listanswers: ['Apple', 'Google', 'Microsoft'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Pengaturan Komputer',
      questioncorrect: 'Close Source'),
  Question(
      questionid: '17',
      question:
          'Di Windows terdapat tombol Start dan Di Mac OS terdapat tombol',
      listanswers: ['Alt', 'Command', 'Ctrl'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Komponen Komputer',
      questioncorrect: 'Command'),
  Question(
      questionid: '18',
      question: 'File Management dalam Mac OS adalah',
      listanswers: ['Finder', 'Explorer', 'Manager'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Finder'),
  Question(
      questionid: '19',
      question: 'Taskbar dalam Mac OS disebut dengan',
      listanswers: [
        'Taskbar',
        'Dock',
        'Window'
      ],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Dock'),
  Question(
      questionid: '20',
      question: 'Kelebihan Mac OS, kecuali',
      listanswers: ['Performa Maksimal', 'Cocok untuk Kreator di bidang Grafis', 'Bisa diinstal di berbagai perangkat'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Bisa diinstal di berbagai perangkat'),
  Question(
      questionid: '21',
      question: 'Kekurangan Mac OS, kecuali',
      listanswers: ['Hanya didukung oleh Perangkat Apple', 'Kurang Cocok Untuk Gaming', 'Harga Murah'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Komponen Komputer',
      questioncorrect: 'Harga Murah'),
  Question(
      questionid: '22',
      question: 'Perangkat MacOS',
      listanswers: ['iPhone', 'Macbook', 'iPad'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Macbook'),
  Question(
      questionid: '23',
      question: 'Command Prompt dalam Apple disebut',
      listanswers: ['MS DOS Prompt', 'Terminal', 'Powershell'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'Terminal'),
  Question(
      questionid: '24',
      question: 'Perintah Mac untuk melihat isi directory/folder',
      listanswers: ['dir', 'ls', 'cd'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect: 'ls'),
  Question(
      questionid: '25',
      question: 'Text editor dalam Terimnal MacOS disebut',
      listanswers: [
        'Edit',
        'Notepad',
        'Nano'
      ],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect:
          'Aplikasi yang berisikan untuk melihat proses aplikasi beserta komponen'),
  Question(
      questionid: '26',
      question: 'Sudo su adalah',
      listanswers: [
        'Masuk sebagai akun root tingkat administrator',
        'Logout user session saat ini',
        'Masuk sebagai akun root tingkat guest'
      ],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Keamanan Komputer',
      questioncorrect:
          'Masuk sebagai akun root tingkat administrator'),
  Question(
      questionid: '27',
      question:
          'Control Panel dalam Mac Disebut',
      listanswers: ['Settings', 'System Preferences', 'Semua Benar'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Windows',
      questioncorrect: 'System Preferences'),
  Question(
      questionid: '28',
      question: 'Windows versi terkini yang dirilis pada 2021 adalah',
      listanswers: ['Windows 7', 'Windows 10', 'Windows 11'],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Komponen Komputer',
      questioncorrect: 'Windows 11'),
  Question(
      questionid: '29',
      question: 'Ciri-ciri Sistem operasi 64-bit dalam MacOS Saat ini',
      listanswers: [
        'Dapat menjalankan program 16-bit',
        'Mendukung RAM diatas 4 GB',
        'Aplikasi 32-bit tetap berjalan dalam 64-bit'
      ],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Komponen Komputer',
      questioncorrect: 'Mendukung RAM diatas 4 GB'),
  Question(
      questionid: '30',
      question: 'Toko Aplikasi di Mac disebut',
      listanswers: [
        'App Store',
        'Play Store',
        'Microsoft Store'
      ],
      questionhint: 'Salah satu data yang di',
      questionlevel: 'Beginner',
      questiontitle: 'Komponen Komputer',
      questioncorrect: 'App Store'),
];