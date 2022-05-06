part of 'models.dart';

List<String> tfanswer = ['True', 'False'];
List<String> kategori = [
  'Komputer Dasar',
  'Sistem Operasi',
  'Keamanan Komputer',
  'Windows',
  'Mac OS',
  'True False Komputer Dasar',
  'True False Windows',
  'True False Mac OS',
];

/* Tentang Komputer Dasar untuk stage 1 pada Mode Pertama*/
List<Question> tourstage111 = [
  Question(
      questionid: '1',
      question: 'Kata Komputer berasal dari Bahasa',
      listanswers: ['Latin', 'Yunani', 'Inggris'],
      questiontitle: kategori[0],
      questioncorrect: 'Latin'),
  Question(
      questionid: '2',
      question: 'Dalam Bahasa Inggris, Compute berarti',
      listanswers: ['Mengurangi', 'Menambahkan', 'Menghitung'],
      questiontitle: kategori[0],
      questioncorrect: 'Menghitung'),
  Question(
      questionid: '3',
      question: 'Power Supply Unit adalah',
      listanswers: [
        'Alat untuk memberikan tegangan arus listrik ke berbagai komponen dalam komputer',
        'Alat untuk menyalakan komputer',
        'Alat untuk menyimpan listrik dalam komponen komputer'
      ],
      questiontitle: kategori[0],
      questioncorrect:
          'Alat untuk memberikan tegangan arus listrik ke berbagai komponen dalam komputer'),
  Question(
      questionid: '4',
      question: 'SSD yang memiliki 2 port disebut',
      listanswers: ['M.2', 'NVMe', 'HDD'],
      questiontitle: kategori[0],
      questioncorrect: 'NVMe'),
  Question(
      questionid: '5',
      question: 'Jenis DDR RAM yang banyak digunakan pada saat ini yaitu',
      listanswers: ['DDR3', 'DDR4', 'DDR5'],
      questiontitle: kategori[0],
      questioncorrect: 'DDR4'),
  Question(
      questionid: '6',
      question: 'Jenis Socket yang mendukung Intel adalah',
      listanswers: ['LGA 1200', 'TRX4', 'AM4'],
      questiontitle: kategori[0],
      questioncorrect: 'LGA 1200'),
  Question(
      questionid: '7',
      question:
          'Untuk menampilkan tampilan pada komputer diperlukan komponen pada Case yaitu',
      listanswers: ['Kartu VGA', 'Monitor', 'Semua benar'],
      questiontitle: kategori[0],
      questioncorrect: 'Kartu VGA'),
  Question(
      questionid: '8',
      question: 'Batas RAM yang digunakan dalam sistem operasi 32 bit adalah',
      listanswers: ['2 GB', '3 GB', '4 GB'],
      questiontitle: kategori[0],
      questioncorrect: '3 GB'),
  Question(
      questionid: '9',
      question:
          'Salah satu komponen komputer yang dapat menampilkan tampilan pada monitor',
      listanswers: ['Motherboard', 'VGA Card', 'Processor'],
      questiontitle: kategori[0],
      questioncorrect: 'VGA Card'),
  Question(
      questionid: '10',
      question:
          'Untuk mendinginkan processor, komponen apa yang harus dipasang',
      listanswers: ['Case Fans', 'Air Cooler', 'Semua Benar'],
      questiontitle: kategori[0],
      questioncorrect: 'Semua Benar'),
  Question(
      questionid: '11',
      question: 'Kekurangan Hard Disk Drive adalah',
      listanswers: [
        'Mengeluarkan suara bising',
        'Mengaktifkan Secure Boot',
        'Semua Benar'
      ],
      questiontitle: kategori[0],
      questioncorrect: 'Semua Benar'),
  Question(
      questionid: '12',
      question: 'Kelebihan SSD M.2 adalah',
      listanswers: [
        'Transfer Data lebih cepat',
        'Kapasitas Memori Lebih kecil',
        'Slot terdiri dari 2 pemasangan'
      ],
      questiontitle: kategori[0],
      questioncorrect: 'Transfer Data lebih cepat'),
  Question(
      questionid: '13',
      question:
          'Jenis driver external yang digunakan sebagai media penyimpanan pada komputer, kecuali',
      listanswers: ['CD', 'USB', 'RAM'],
      questiontitle: kategori[0],
      questioncorrect: 'RAM'),
  Question(
      questionid: '14',
      question: 'SSD merupakan singkatan dari',
      listanswers: [
        'Solid State Drive',
        'Security State Drive',
        'Secure State Drive'
      ],
      questiontitle: kategori[0],
      questioncorrect: 'Solid State Drive'),
  Question(
      questionid: '15',
      question: 'Kelebihan SSD jenis NVMe adalah',
      listanswers: [
        'Lebih Cepat daripada M.2',
        'Harga Lebih Mahal',
        'Semua Benar'
      ],
      questiontitle: kategori[0],
      questioncorrect: 'Lebih Cepat daripada M.2'),
  Question(
      questionid: '16',
      question: 'Komponen yang dapat digunakan untuk mengetik adalah',
      listanswers: ['Keyboard', 'Mouse', 'Joystick'],
      questiontitle: kategori[0],
      questioncorrect: 'Mouse'),
  Question(
      questionid: '17',
      question: 'Yang bukan merupakan komponen komputer',
      listanswers: ['RAM', 'CPU', 'Headset'],
      questiontitle: kategori[0],
      questioncorrect: 'Headset'),
  Question(
      questionid: '18',
      question:
          'Komponen yang dapat digunakan ketika bermain game dalam komputer adalah',
      listanswers: ['Keyboard', 'Mouse', 'Semua Benar'],
      questiontitle: kategori[0],
      questioncorrect: 'Semua Benar'),
  Question(
      questionid: '19',
      question: 'Untuk mengeluarkan suara pada Komputer, Komputer memerlukan',
      listanswers: ['Sound Card', 'Speaker', 'Semua Benar'],
      questiontitle: kategori[0],
      questioncorrect: 'Speaker'),
  Question(
      questionid: '20',
      question: 'Jenis Penyimpanan Internal kecuali',
      listanswers: ['USB', 'HDD', 'SSD'],
      questiontitle: kategori[0],
      questioncorrect: 'USB'),
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
      questiontitle: kategori[1],
      questioncorrect: 'Sistem yang menghubungkan hardware dengan software'),
  Question(
      questionid: '2',
      question: 'Contoh Sistem Operasi Komputer adalah',
      listanswers: ['Windows', 'iOS', 'Android'],
      questiontitle: kategori[1],
      questioncorrect: 'Windows'),
  Question(
      questionid: '3',
      question: 'Komponen dalam OS, kecuali',
      listanswers: ['File', 'UI', 'Hardware'],
      questiontitle: kategori[1],
      questioncorrect: 'Hardware'),
  Question(
      questionid: '4',
      question: 'UI merupakan singkatan dari',
      listanswers: [
        'Utility Interface',
        'User Inteface',
        'User Impelementation'
      ],
      questiontitle: kategori[1],
      questioncorrect: 'User Inteface'),
  Question(
      questionid: '5',
      question: 'Fungsi Sistem Operasi kecuali',
      listanswers: [
        'Sebagai Manajemen Sumber Daya Komputer',
        'Mengoptimal Fungsi Perangkat Komputer',
        'Menghubungkan Software'
      ],
      questiontitle: 'Sistem Operas',
      questioncorrect: 'Menghubungkan Software'),
  Question(
      questionid: '6',
      question: 'System Requriement dalam Sistem Operasi adalah',
      listanswers: [
        'Mengetahui spesifikasi yang handal untuk menjalankan OS',
        'Menentukan spesifikasi penting Sistem Operasi dapat berjalan dengan lancar',
        'Semua Benar'
      ],
      questiontitle: kategori[1],
      questioncorrect: 'Semua Benar'),
  Question(
      questionid: '7',
      question: 'Software dalam Sistem Operasi adalah',
      listanswers: [
        'Aplikasi untuk mengelola komputer',
        'Aplikasi untuk menampilkan gambar di monitor',
        'Aplikasi yang terdiri atas Browser dan Game'
      ],
      questiontitle: kategori[1],
      questioncorrect: 'Aplikasi untuk mengelola komputer'),
  Question(
      questionid: '8',
      question: 'Management yang ada di Sistem Operasi, Kecuali',
      listanswers: ['Device', 'Component', 'File'],
      questiontitle: kategori[1],
      questioncorrect: 'Component'),
  Question(
      questionid: '9',
      question: 'Ciri-ciri Sistem Operasi 32-bit adalah',
      listanswers: [
        'RAM Terbatas Hingga 3 GB',
        'Dapat menjalankan program 16-bit',
        'Semua Benar'
      ],
      questiontitle: kategori[1],
      questioncorrect: 'Semua Benar'),
  Question(
      questionid: '10',
      question: 'Ciri-ciri Sistem Operasi 64-bit kecuali',
      listanswers: [
        'Dukungan RAM diatas 4 GB',
        'Tidak dapat menjalankan program 32-bit',
        'Semua Benar'
      ],
      questiontitle: kategori[1],
      questioncorrect: 'Semua Benar'),
  Question(
      questionid: '11',
      question: 'Instalansi Sistem Operasi dapat dilakukan melalui',
      listanswers: ['USB', 'CD', 'Floppy'],
      questiontitle: kategori[1],
      questioncorrect: 'USB'),
  Question(
      questionid: '12',
      question: 'Windows, MacOS dan Linux adalah sistem operasi berjenis',
      listanswers: ['Networking', 'Live CD', 'Standalone'],
      questiontitle: kategori[1],
      questioncorrect: 'Standalone'),
  Question(
      questionid: '13',
      question: 'Tahapan Sistem Operasi terdiri atas,',
      listanswers: ['Hardware', 'Browser', 'Explorer'],
      questiontitle: kategori[1],
      questioncorrect: 'Hardware'),
  Question(
      questionid: '14',
      question: 'Tahapan Sistem Operasi terdiri atas, kecuali',
      listanswers: ['Hardware', 'Software', 'Database'],
      questiontitle: kategori[1],
      questioncorrect: 'Database'),
  Question(
      questionid: '15',
      question: 'Yang bukan termasuk Sistem Operasi Stand Alone',
      listanswers: ['Windows', 'MacOS', 'Android'],
      questiontitle: kategori[1],
      questioncorrect: 'Android'),
  Question(
      questionid: '16',
      question: 'File adalah',
      listanswers: [
        'Data yang terbentuk atau dijalankan melalui sebuah sistem operasi di komputer',
        'Aplikasi yang terbentuk atau dijalankan melalui sebuah sistem operasi di komputer',
        'Semua Benar'
      ],
      questiontitle: kategori[1],
      questioncorrect:
          'Data yang terbentuk atau dijalankan melalui sebuah sistem operasi di komputer'),
  Question(
      questionid: '17',
      question: 'UI adalah',
      listanswers: [
        'Tampilan pada Monitor',
        'Tampilan yang menghubungkan pengguna dengan antarmuka sesuai dengan fungsinya',
        'Semua Benar'
      ],
      questiontitle: kategori[1],
      questioncorrect:
          'Tampilan yang menghubungkan pengguna dengan antarmuka sesuai dengan fungsinya'),
  Question(
      questionid: '18',
      question: 'Kernel adalah',
      listanswers: [
        'Melayani berbagai macam file',
        'Perangkat lunak yang membentuk sistem',
        'Seperti task manager'
      ],
      questiontitle: kategori[1],
      questioncorrect: 'Perangkat lunak yang membentuk sistem'),
  Question(
      questionid: '19',
      question: 'Yang merupakan komponen Sistem Operasi adalah',
      listanswers: [
        'Data yang terbentuk atau dijalankan melalui sebuah sistem operasi di komputer',
        'Aplikasi yang terbentuk atau dijalankan melalui sebuah sistem operasi di komputer',
        'Semua Benar'
      ],
      questiontitle: kategori[1],
      questioncorrect:
          'Data yang terbentuk atau dijalankan melalui sebuah sistem operasi di komputer'),
  Question(
      questionid: '20',
      question: 'Contoh Sistem Operasi Server',
      listanswers: ['Windows Server', 'iOS', 'MacOS'],
      questiontitle: kategori[1],
      questioncorrect: 'Windows Server'),
  Question(
      questionid: '21',
      question: 'Contoh Sistem Operasi Jaringan, Kecuali',
      listanswers: ['Red Hat', 'Windows', 'CentOS Server'],
      questiontitle: kategori[1],
      questioncorrect: 'Windows Server'),
  Question(
      questionid: '22',
      question: 'Jenis Sistem Operasi',
      listanswers: ['Standalone', 'Multiuser', 'Multifunction'],
      questiontitle: kategori[1],
      questioncorrect: 'Standalone'),
  Question(
      questionid: '23',
      question: 'Yang bukan merupakan Jenis Sistem Operasi',
      listanswers: ['Standalone', 'Server', 'Private'],
      questiontitle: kategori[1],
      questioncorrect: 'Private'),
  Question(
      questionid: '24',
      question: 'Yang bukan merupakan Jenis Sistem Operasi',
      listanswers: ['Standalone', 'Server', 'Private'],
      questiontitle: kategori[1],
      questioncorrect: 'Private'),
  Question(
      questionid: '25',
      question: 'Linux adalah Sistem Operasi yang berjenis',
      listanswers: ['Standalone', 'Server', 'Live CD'],
      questiontitle: kategori[1],
      questioncorrect: 'SStandalone'),
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
      questiontitle: kategori[2],
      questioncorrect: 'Semua Benar'),
  Question(
      questionid: '2',
      question: 'Tingkat keamanan akun sistem operasi paling banyak digunakan',
      listanswers: ['Password', 'Fingerprint', 'Scanner'],
      questiontitle: kategori[2],
      questioncorrect: 'Password'),
  Question(
      questionid: '3',
      question: 'Malware merupakan singkatan dari',
      listanswers: ['Malicious Hardware', 'Malicious Software', 'Semua Salah'],
      questiontitle: kategori[2],
      questioncorrect: 'Malicious Software'),
  Question(
      questionid: '4',
      question:
          'Aplikasi antivirus yang merupakan aplikasi dari pihak ketiga, kecuali',
      listanswers: ['AVG Antivirus', 'McAfee Total Protection', 'Semua Benar'],
      questiontitle: kategori[2],
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
      questiontitle: kategori[2],
      questioncorrect: 'Menginstall Antivirus'),
  Question(
      questionid: '6',
      question: 'Aspek dalam Keamanan Komputer, Kecuali',
      listanswers: ['Privasi', 'Keamanan', 'Modification'],
      questiontitle: kategori[2],
      questioncorrect: 'Modification'),
  Question(
      questionid: '7',
      question: 'Malware adalah',
      listanswers: [
        'Virus yang merusak komputer',
        'Penyebaran virus ke berbagai perangkat lunak',
        'Memanfaatkan kecacatan dalam keamanan komputer untuk diserang'
      ],
      questiontitle: kategori[2],
      questioncorrect: 'Virus yang merusak komputer'),
  Question(
      questionid: '8',
      question: 'Jenis Exploit yang digunakan dalam Wannacry adalah',
      listanswers: ['EternalBlue', 'DoublePulsar', 'ShellShock'],
      questiontitle: kategori[2],
      questioncorrect: 'EternalBlue'),
  Question(
      questionid: '9',
      question: 'Untuk mencegah cyberattack, yang harus dilakukan adalah',
      listanswers: [
        'Mengupdate OS',
        'Rutin mengupdate versi Antivirus',
        'Semua Benar'
      ],
      questiontitle: kategori[2],
      questioncorrect: 'Semua Benar'),
  Question(
      questionid: '10',
      question: 'Virus adalah',
      listanswers: [
        'Program yang dibuat untuk merusak file',
        'Program yang dibuat untuk memperlambat OS',
        'Program yang dibuat untuk membuat error'
      ],
      questiontitle: kategori[2],
      questioncorrect: 'Program yang dibuat untuk merusak file'),
  Question(
      questionid: '11',
      question: 'Trojan adalah',
      listanswers: [
        'Perangkat lunak berbahaya yang dapat merusak sebuah sistem',
        'Jenis Virus yang sangat berbahaya',
        'Perangkat lunak yang serupa dengan virus'
      ],
      questiontitle: kategori[2],
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
      questiontitle: kategori[2],
      questioncorrect: 'Semua Benar'),
  Question(
      questionid: '13',
      question: 'Contoh Ransomware yang terkenal adalah',
      listanswers: ['Syskey', 'Wannacry', 'Semua Benar'],
      questiontitle: kategori[2],
      questioncorrect: 'Semua Benar'),
  Question(
      questionid: '14',
      question: 'Jenis Malware',
      listanswers: ['Software', 'Hardware', 'Spyware'],
      questiontitle: kategori[2],
      questioncorrect: 'Spyware'),
  Question(
      questionid: '15',
      question: 'Perbedaan Adware dan Spyware',
      listanswers: [
        'Adware sering dijumpai pada iklan sedangkan Spyware sering dijumpai pada komputer',
        'Adware sering dijumpai pada iklan sedangkan Spyware sering dijumpai pada aplikasi',
        'Adware sering dijumpai pada iklan web maupun aplikasi sedangkan Spyware sering dijumpai pada email'
      ],
      questiontitle: kategori[2],
      questioncorrect:
          'Adware sering dijumpai pada iklan sedangkan Spyware sering dijumpai pada aplikasi'),
  Question(
      questionid: '16',
      question: 'Jenis scan dalam aplikasi antivirus kecuali',
      listanswers: ['Full Scan', 'Quick Scan', 'Fast Scan'],
      questiontitle: kategori[2],
      questioncorrect: 'Fast Scan'),
  Question(
      questionid: '17',
      question: 'Jenis scan dalam aplikasi antivirus kecuali',
      listanswers: ['Full Scan', 'Quick Scan', 'Fast Scan'],
      questiontitle: kategori[2],
      questioncorrect: 'Fast Scan'),
  Question(
      questionid: '18',
      question: 'Password Cracking adalah',
      listanswers: [
        'Membobol Password',
        'Metode untuk melawan perlindungan password yang dienkripsi',
        'Semua Benar'
      ],
      questiontitle: kategori[2],
      questioncorrect:
          'Metode untuk melawan perlindungan password yang dienkripsi'),
  Question(
      questionid: '19',
      question: 'Virus komputer memiliki kemampuan untuk',
      listanswers: ['Bersembunyi', 'Menyamar', 'Semua Benar'],
      questiontitle: kategori[2],
      questioncorrect: 'Semua Benar'),
  Question(
      questionid: '20',
      question: 'Yang bukan jenis bahaya keamanan Komputer',
      listanswers: ['Scanning', 'Hacking', 'Cracking'],
      questiontitle: kategori[2],
      questioncorrect: 'Scanning'),
  Question(
      questionid: '21',
      question: 'Yang merupakan jenis bahaya keamanan Komputer',
      listanswers: ['Scanning', 'Hacking', 'Login'],
      questiontitle: kategori[2],
      questioncorrect: 'Hacking'),
  Question(
      questionid: '22',
      question:
          'Metode yang digunakan dalam melakukan pembobolan password pengguna',
      listanswers: ['Cracking', 'Hacking', 'Login'],
      questiontitle: kategori[2],
      questioncorrect: 'Cracking'),
  Question(
      questionid: '23',
      question: 'Yang bukan merupakan aplikasi Antivirus',
      listanswers: ['Microsoft Office', 'Windows Defender', 'McAfee Antivirus'],
      questiontitle: kategori[2],
      questioncorrect: 'Microsoft Office'),
  Question(
      questionid: '24',
      question: 'Spoofing adalah',
      listanswers: [
        'Pemalsuan alamat jaringan attacker sehingga sasaran menganggap alamat IP attacker adalah alamat IP dari host di dalam network',
        'Pemalsuan alamat IP attacker sehingga sasaran menganggap alamat IP attacker adalah alamat IP dari host di dalam network bukan dari luar network.',
        'Semua Benar'
      ],
      questiontitle: kategori[2],
      questioncorrect:
          'Pemalsuan alamat IP attacker sehingga sasaran menganggap alamat IP attacker adalah alamat IP dari host di dalam network bukan dari luar network.'),
  Question(
      questionid: '25',
      question: 'Yang merupakan kemampuan Virus',
      listanswers: [
        'Mendapatkan Informasi',
        'Mendapatkan Password',
        'Mendapatkan Data'
      ],
      questiontitle: kategori[2],
      questioncorrect: 'Mendapatkan Informasi'),
];

/* Tentang Posttest Komputer dan Keamanan Komputer untuk stage 3 pada Mode Pertama*/
List<Question> tourstage131 = [
  Question(
      questionid: '1',
      question: 'Kata Komputer berasal dari Bahasa',
      listanswers: ['Yunani', 'Inggris', 'Latin', 'Sanskerta'],
      questiontitle: kategori[0],
      questioncorrect: 'Latin'),
  Question(
      questionid: '2',
      question: 'Dalam Bahasa Inggris, Compute berarti',
      listanswers: ['Mengurangi', 'Menambahkan', 'Menukarkan', 'Menghitung'],
      questiontitle: kategori[0],
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
      questiontitle: kategori[0],
      questioncorrect:
          'Alat untuk memberikan tegangan arus listrik ke berbagai komponen dalam komputer'),
  Question(
      questionid: '4',
      question: 'SSD yang memiliki 2 port disebut',
      listanswers: ['M.2', 'PCIe', 'NVMe', 'HDD'],
      questiontitle: kategori[0],
      questioncorrect: 'NVMe'),
  Question(
      questionid: '5',
      question: 'Jenis DDR RAM yang banyak digunakan pada saat ini yaitu',
      listanswers: ['DDR3', 'DDR4', 'DDR5', 'DDR4 dan DDR5'],
      questiontitle: kategori[0],
      questioncorrect: 'DDR4 dan DDR5'),
  Question(
      questionid: '6',
      question: 'Jenis Socket yang mendukung AMD adalah',
      listanswers: ['LGA 1200', 'TRX4', 'AM4', 'AM4 dan TRX4'],
      questiontitle: kategori[0],
      questioncorrect: 'AM4 dan TRX4'),
  Question(
      questionid: '7',
      question:
          'Untuk menampilkan tampilan pada komputer diperlukan komponen pada Case yaitu',
      listanswers: ['Monitor', 'Kartu VGA', 'Motherboard', 'Semua benar'],
      questiontitle: kategori[0],
      questioncorrect: 'Kartu VGA'),
  Question(
      questionid: '8',
      question: 'Batas RAM yang digunakan dalam sistem operasi 32 bit adalah',
      listanswers: ['3 GB', '4 GB', '6 GB', '8 GB'],
      questiontitle: kategori[0],
      questioncorrect: '3 GB'),
  Question(
      questionid: '9',
      question:
          'Salah satu komponen komputer yang dapat menampilkan tampilan pada monitor',
      listanswers: ['Motherboard', 'Processor', 'CPU', 'Kartu VGA'],
      questiontitle: kategori[0],
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
      questiontitle: kategori[0],
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
      questiontitle: kategori[0],
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
      questiontitle: kategori[0],
      questioncorrect: 'Transfer Data lebih cepat'),
  Question(
      questionid: '13',
      question:
          'Jenis driver external yang digunakan sebagai media penyimpanan pada komputer',
      listanswers: ['CD', 'USB', 'Floppy', 'Semua Benar'],
      questiontitle: kategori[0],
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
      questiontitle: kategori[0],
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
      questiontitle: kategori[0],
      questioncorrect: 'Lebih Cepat daripada M.2'),
  Question(
      questionid: '16',
      question: 'Definisi Keamanan Komputer, Kecuali',
      listanswers: [
        'Pencegahan diri dan deteksi dalam system komputer',
        'Pencegahan dari serangan pengguna komputer',
        'Pencegahan dari ancaman siber',
        'Semua Benar'
      ],
      questiontitle: kategori[2],
      questioncorrect: 'Semua Benar'),
  Question(
      questionid: '17',
      question: 'Tingkat keamanan akun sistem operasi paling lemah',
      listanswers: ['PIN', 'Password', 'Fingerprint', 'Scanner'],
      questiontitle: kategori[2],
      questioncorrect: 'PIN'),
  Question(
      questionid: '18',
      question: 'Malware merupakan singkatan dari',
      listanswers: [
        'Malicious Adware',
        'Malicious Hardware',
        'Malicious Software',
        'Semua Salah'
      ],
      questiontitle: kategori[2],
      questioncorrect: 'Malicious Software'),
  Question(
      questionid: '19',
      question:
          'Aplikasi antivirus yang merupakan aplikasi dari pihak ketiga, kecuali',
      listanswers: [
        'AVG Antivirus',
        'McAfee Total Protection',
        'Microsoft Defender',
        'Avira'
      ],
      questiontitle: kategori[2],
      questioncorrect: 'Microsoft Defender'),
  Question(
      questionid: '20',
      question:
          'Untuk meningkatkan keamanan di komputer, maka hal apa yang harus dilakukan',
      listanswers: [
        'Tidak menginstall aplikasi sembarangan'
            'Menginstall Antivirus',
        'Menggunakan Cracking',
        '1 dan 2 Benar'
      ],
      questiontitle: kategori[2],
      questioncorrect: '1 dan 2 Benar'),
  Question(
      questionid: '21',
      question: 'Aspek dalam Keamanan Komputer, Kecuali',
      listanswers: ['Privasi', 'Keamanan', '1 dan 2 Benar', 'Modification'],
      questiontitle: kategori[2],
      questioncorrect: 'Modification'),
  Question(
      questionid: '22',
      question: 'Malware adalah',
      listanswers: [
        'Penyebaran virus ke berbagai perangkat lunak',
        'Virus yang merusak komputer',
        'Memanfaatkan kecacatan dalam keamanan komputer untuk diserang',
        'Virus yang melindungi komputer'
      ],
      questiontitle: kategori[2],
      questioncorrect: 'Virus yang merusak komputer'),
  Question(
      questionid: '23',
      question: 'Jenis Exploit yang digunakan dalam Wannacry adalah',
      listanswers: [
        'EternalBlue',
        'DoublePulsar',
        'ShellShock',
        'Wannacryptor'
      ],
      questiontitle: kategori[2],
      questioncorrect: 'EternalBlue'),
  Question(
      questionid: '24',
      question: 'Untuk mencegah cyberattack, yang harus dilakukan, kecuali',
      listanswers: [
        'Melakukan Patching dan Cracking'
            'Mengupdate OS',
        'Rutin mengupdate versi Antivirus',
        'Semua Benar'
      ],
      questiontitle: kategori[2],
      questioncorrect: 'Melakukan Patching dan Cracking'),
  Question(
      questionid: '25',
      question: 'Virus adalah',
      listanswers: [
        'Program yang dibuat untuk memperlambat OS',
        'Program yang dibuat untuk membuat error',
        'Program yang dibuat untuk melumpuhkan komputer',
        'Program yang dibuat untuk merusak file'
      ],
      questiontitle: kategori[2],
      questioncorrect: 'Program yang dibuat untuk merusak file'),
  Question(
      questionid: '26',
      question: 'Trojan adalah',
      listanswers: [
        'Perangkat'
            'Jenis Virus yang sangat berbahaya',
        'Perangkat lunak berbahaya yang dapat merusak sebuah sistem',
        'Perangkat lunak yang serupa dengan virus'
      ],
      questiontitle: kategori[2],
      questioncorrect:
          'Perangkat lunak berbahaya yang dapat merusak sebuah sistem'),
  Question(
      questionid: '27',
      question: 'Mencegah virus komputerdapat dilakukan dengan',
      listanswers: [
        'tidak menginstall sembarangan aplikasi',
        'Mengatur Windows Defender lebih dalam',
        'Mengubah pengaturan Windows Update',
        'Semua Benar'
      ],
      questiontitle: kategori[2],
      questioncorrect: 'Semua Benar'),
  Question(
      questionid: '28',
      question: 'Contoh Ransomware yang terkenal adalah',
      listanswers: ['Syskey', 'Wannacry', 'CryptoLocker', 'Semua Benar'],
      questiontitle: kategori[2],
      questioncorrect: 'Semua Benar'),
  Question(
      questionid: '29',
      question: 'Jenis Malware',
      listanswers: ['Malware', 'Software', 'Hardware', 'Spyware'],
      questiontitle: kategori[2],
      questioncorrect: 'Spyware'),
  Question(
      questionid: '30',
      question: 'Perbedaan Adware dan Spyware',
      listanswers: [
        'Adware sering dijumpai pada iklan sedangkan Spyware sering dijumpai pada komputer',
        'Adware sering dijumpai pada iklan web maupun aplikasi sedangkan Spyware sering dijumpai pada email',
        'Adware sering dijumpai pada iklan sedangkan Spyware sering dijumpai pada aplikasi',
        'Adware sering dijumpai pada iklan sedangkan Spyware sering dijumpai pada website'
      ],
      questiontitle: kategori[2],
      questioncorrect:
          'Adware sering dijumpai pada iklan sedangkan Spyware sering dijumpai pada aplikasi'),
];

/* Tentang Posttest Komputer dan Sistem Operasi Komputer untuk stage 3 pada Mode Pertama*/
List<Question> tourstage132 = [
  ...tourstage131.getRange(0, 15),
  Question(
      questionid: '16',
      question: 'Sistem Operasi adalah',
      listanswers: [
        'Sistem yang menghubungkan hardware dengan software',
        'Mempermudah interaksi pengguna',
        'Membantu dalam menampilkan data'
            'Semua benar'
      ],
      questiontitle: kategori[1],
      questioncorrect: 'Sistem yang menghubungkan hardware dengan software'),
  Question(
      questionid: '17',
      question: 'Contoh Sistem Operasi adalah',
      listanswers: ['Windows Phone', 'Windows', 'iOS', 'Android'],
      questiontitle: kategori[1],
      questioncorrect: 'Windows'),
  Question(
      questionid: '18',
      question: 'Komponen dalam OS, kecuali',
      listanswers: ['File', 'UI', 'Kernel', 'Hardware'],
      questiontitle: kategori[1],
      questioncorrect: 'Hardware'),
  Question(
      questionid: '19',
      question: 'UI merupakan singkatan dari',
      listanswers: [
        'Utility Interface',
        'User Intergration',
        'User Impelementation',
        'User Inteface'
      ],
      questiontitle: kategori[1],
      questioncorrect: 'User Inteface'),
  Question(
      questionid: '20',
      question: 'Fungsi Sistem Operasi yaitu',
      listanswers: [
        'Sebagai Manajemen Sumber Daya Komputer',
        'Mengoptimal Fungsi Perangkat Komponen Komputer',
        'Menghubungkan Hardware'
            'Menghubungkan Software'
      ],
      questiontitle: kategori[1],
      questioncorrect: 'Sebagai Manajemen Sumber Daya Komputer'),
  Question(
      questionid: '21',
      question: 'System Requriement dalam Sistem Operasi adalah',
      listanswers: [
        'Mengetahui spesifikasi yang handal untuk menjalankan OS',
        'Menentukan spesifikasi penting Sistem Operasi dapat berjalan dengan lancar',
        'Menentukan spesifikasi yang dibutuhkan untuk menjalankan sebuah program'
            'Semua Benar'
      ],
      questiontitle: kategori[1],
      questioncorrect: 'Semua Benar'),
  Question(
      questionid: '22',
      question: 'Software dalam Sistem Operasi adalah',
      listanswers: [
        'Aplikasi untuk mengelola hardware'
            'Aplikasi untuk mengelola komputer',
        'Aplikasi untuk menampilkan gambar di monitor',
        'Aplikasi yang terdiri atas Browser dan Game'
      ],
      questiontitle: kategori[1],
      questioncorrect: 'Aplikasi untuk mengelola komputer'),
  Question(
      questionid: '23',
      question: 'Management yang ada di Sistem Operasi',
      listanswers: ['Device', 'Sistem', 'Component', 'Kernel'],
      questiontitle: kategori[1],
      questioncorrect: 'Management'),
  Question(
      questionid: '24',
      question: 'Ciri-ciri Sistem Operasi 32-bit adalah',
      listanswers: [
        'RAM Terbatas Hingga 3 GB',
        'Dapat menjalankan program 16-bit',
        'Dapat menjalankan program lama'
            'Semua Benar'
      ],
      questiontitle: kategori[1],
      questioncorrect: 'Semua Benar'),
  Question(
      questionid: '25',
      question: 'Ciri-ciri Sistem Operasi 64-bit kecuali',
      listanswers: [
        'Dukungan RAM diatas 4 GB',
        'Tidak dapat menjalankan program 32-bit',
        'Tidak dapat menjalankan program 16-bit'
            'Semua Benar'
      ],
      questiontitle: kategori[1],
      questioncorrect: 'Tidak dapat menjalankan program 32-bit'),
  Question(
      questionid: '26',
      question: 'Instalansi Sistem Operasi dapat dilakukan melalui',
      listanswers: ['USB', 'CD', 'Floppy', 'Flash Disk'],
      questiontitle: kategori[1],
      questioncorrect: 'USB'),
  Question(
      questionid: '27',
      question: 'Windows, MacOS dan Linux adalah sistem operasi berjenis',
      listanswers: ['Networking', 'Live CD', 'Server', 'Standalone'],
      questiontitle: kategori[1],
      questioncorrect: 'Standalone'),
  Question(
      questionid: '28',
      question: 'Tahapan Sistem Operasi terdiri atas, ',
      listanswers: ['Hardware', 'Browser', 'Explorer', 'Software'],
      questiontitle: kategori[1],
      questioncorrect: 'Hardware'),
  Question(
      questionid: '29',
      question: 'Tahapan Sistem Operasi terdiri atas, kecuali',
      listanswers: ['Hardware', 'Software', 'Database', 'Semua Benar'],
      questiontitle: kategori[1],
      questioncorrect: 'Database'),
  Question(
      questionid: '30',
      question: 'Tahapan Sistem Operasi terdiri atas',
      listanswers: [
        'Hardware',
        'Software',
        'Database',
        'Hardware dan Software'
      ],
      questiontitle: kategori[1],
      questioncorrect: 'Hardware dan Software'),
];

/* Tentang Advanced Komputer untuk stage 3 pada Mode Pertama*/
List<Question> tourstage133 = [
  ...tourstage131.getRange(0, 15),
  Question(
      questionid: '16',
      question: 'Komponen yang dapat digunakan untuk mengetik adalah',
      listanswers: [
        'Keyboard',
        'Mousepad',
        'Joystick',
        'Mouse',
      ],
      questiontitle: 'Komputer Dasar',
      questioncorrect: 'Mouse'),
  Question(
      questionid: '17',
      question: 'Yang merupakan komponen komputer',
      listanswers: ['Headset', 'Speaker', 'Monitor', 'Speaker dan Monitor'],
      questiontitle: 'Komputer Dasar',
      questioncorrect: 'Speaker dan Monitor'),
  Question(
      questionid: '18',
      question:
          'Komponen yang dapat digunakan ketika bermain game dalam komputer kecuali',
      listanswers: ['Keyboard', 'Mouse', 'Joystick', 'Bluetooth'],
      questiontitle: 'Komputer Dasar',
      questioncorrect: 'Bluetooth'),
  Question(
      questionid: '19',
      question: 'Untuk mengeluarkan suara pada Komputer, Komputer memerlukan',
      listanswers: ['RAM', 'Speaker', 'Joystick', 'Sound Card'],
      questiontitle: 'Komputer Dasar',
      questioncorrect: 'Speaker'),
  Question(
      questionid: '20',
      question: 'Jenis Penyimpanan Internal dalam Komputer',
      listanswers: ['Drive', 'Flashdisk', 'SSD', 'Cloud'],
      questiontitle: 'Komputer Dasar',
      questioncorrect: 'SSD'),
];

/* Tentang Sistem Operasi Windows untuk stage 2 pada Mode Kedua*/
List<Question> tourstage221 = [
  Question(
      questionid: '1',
      question: 'Windows Merupakan OS yang bersifat',
      listanswers: ['Open Source', 'Close Source', 'Campuran'],
      questiontitle: kategori[3],
      questioncorrect: 'Close Source'),
  Question(
      questionid: '2',
      question:
          'Untuk menjalankan aplikasi Run, Tombol shortcut untuk Windows Run adalah',
      listanswers: ['WIN + R', 'WIN + C', 'WIN + I'],
      questiontitle: kategori[3],
      questioncorrect: 'WIN + R'),
  Question(
      questionid: '3',
      question: 'Windows Explorer adalah ... ',
      listanswers: [
        'Sistem Management',
        'File Management',
        'Driver Management'
      ],
      questiontitle: kategori[3],
      questioncorrect: 'File Management'),
  Question(
      questionid: '4',
      question: 'Powershell adalah ',
      listanswers: [
        'Interface Antar Muka untuk melakukan task',
        'Interface Command Line untuk melakukan task',
        'Interface Terminal untuk melakukan task'
      ],
      questiontitle: kategori[3],
      questioncorrect: 'Interface Command Line untuk melakukan task'),
  Question(
      questionid: '5',
      question: 'Yang ada di dalam Start Menu, kecuali',
      listanswers: ['Daftar Program', 'Menu Boot', 'Semua Salah'],
      questiontitle: kategori[3],
      questioncorrect: 'Semua Salah'),
  Question(
      questionid: '6',
      question: 'Label pada Local Disc adalah',
      listanswers: ['A', 'C', 'D'],
      questiontitle: 'Komponen Komputer',
      questioncorrect: 'C'),
  Question(
      questionid: '7',
      question: 'Label pada Drive Kedua adalah',
      listanswers: ['D', 'E', 'Semua Benar'],
      questiontitle: kategori[3],
      questioncorrect: 'Semua Benar'),
  Question(
      questionid: '8',
      question: 'Label pada Floppy adalah',
      listanswers: ['A', 'B', 'C'],
      questiontitle: kategori[3],
      questioncorrect: 'A'),
  Question(
      questionid: '9',
      question: 'Windows Pertama kali diperkenalkan pada tahun',
      listanswers: ['1975', '1985', '1995'],
      questiontitle: kategori[3],
      questioncorrect: '1985'),
  Question(
      questionid: '10',
      question: 'Task Manager adalah',
      listanswers: [
        'Aplikasi yang berisikan untuk melihat proses aplikasi beserta komponen',
        'Aplikasi yang berisikan untuk melihat status aplikasi beserta komponen',
        'Aplikasi yang berisikan untuk melihat error aplikasi beserta komponen'
      ],
      questiontitle: kategori[3],
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
      questiontitle: kategori[3],
      questioncorrect:
          'Berisikan Start Menu, Kumpulan beberapa aplikasi beserta aplikasi yang telah dipin dan status dalam Windows'),
  Question(
      questionid: '12',
      question:
          'Untuk memeriksa komponen pada Windows dalam Command Prompt, Command apa yang digunakan',
      listanswers: ['sfc/ scannow', 'sfc /verifyonly', 'Semua Benar'],
      questiontitle: kategori[3],
      questioncorrect: 'sfc/ scannow'),
  Question(
      questionid: '13',
      question: 'Windows versi terkini yang dirilis pada 2021 adalah',
      listanswers: ['Windows 7', 'Windows 10', 'Windows 11'],
      questiontitle: kategori[3],
      questioncorrect: 'Windows 11'),
  Question(
      questionid: '14',
      question: 'Ciri-ciri Windows 64-bit kecuali',
      listanswers: [
        'Dapat menjalankan program 16-bit',
        'Mendukung RAM diatas 4 GB',
        'Aplikasi 32-bit tetap berjalan dalam 64-bit'
      ],
      questiontitle: kategori[3],
      questioncorrect: 'Dapat menjalankan program 16-bit'),
  Question(
      questionid: '15',
      question: 'Ciri-ciri Windows 32-bit adalah',
      listanswers: [
        'Dapat menjalankan program 16-bit',
        'Mendukung RAM diatas 4 GB',
        'Aplikasi 64-bit tetap berjalan dalam 32-bit'
      ],
      questiontitle: kategori[3],
      questioncorrect: 'Dapat menjalankan program 16-bit'),
  Question(
      questionid: '16',
      question: 'Beda run dan search',
      listanswers: [
        'Search hanya memerlukan keyword sedangkan Run memerlukan direktori',
        'Search hanya memerlukan kata yang dicari sedangkan Run memerlukan full direktori',
        'Search hanya memerlukan kata yang dicari sedangkan Run memerlukan full direktori beserta isinya'
      ],
      questiontitle: kategori[3],
      questioncorrect:
          'Search hanya memerlukan kata yang dicari sedangkan Run memerlukan full direktori'),
  Question(
      questionid: '17',
      question: 'Paint adalah',
      listanswers: [
        'Aplikasi yang bertujuan untuk menggambar',
        'Aplikasi vektor sederhana yang bertujuan untuk menggambar',
        'Aplikasi raster sederhana yang bertujuan untuk menggambar'
      ],
      questiontitle: kategori[3],
      questioncorrect:
          'Aplikasi raster sederhana yang bertujuan untuk menggambar'),
  Question(
      questionid: '18',
      question: 'Notepad adalah',
      listanswers: [
        'Aplikasi serbaguna dalam bentuk text editor',
        'Aplikasi text editor yang digunakan sebagai catatan',
        'Aplikasi text editor yang mendukung teks kecil dan coding'
      ],
      questiontitle: kategori[3],
      questioncorrect:
          'Aplikasi text editor yang mendukung teks kecil dan coding'),
  Question(
      questionid: '19',
      question:
          'Aplikasi pra-install Windows yang digunakan untuk memutarkan video',
      listanswers: ['Windows Media Player', 'Wordpad', 'Notepad'],
      questiontitle: kategori[3],
      questioncorrect: 'Windows Media Player'),
  Question(
      questionid: '20',
      question: 'Yang Bukan merupakan bagian dari Microsoft Office',
      listanswers: ['Word', 'Excel', 'Notepad'],
      questiontitle: kategori[3],
      questioncorrect: 'Notepad'),
  Question(
      questionid: '21',
      question: 'Yang merupakan bagian dari Microsoft Office',
      listanswers: ['Word', 'Paint', 'Notepad'],
      questiontitle: kategori[3],
      questioncorrect: 'Word'),
  Question(
      questionid: '22',
      question:
          'Aplikasi pra-install Windows yang digunakan untuk menulis catatan',
      listanswers: ['Windows Media Player', 'Wordpad', 'Notepad'],
      questiontitle: kategori[3],
      questioncorrect: 'Notepad'),
  Question(
      questionid: '23',
      question:
          'Aplikasi pra-install Windows yang digunakan untuk berinternetan',
      listanswers: ['Internet Explorer', 'Google Chrome', 'Firefox'],
      questiontitle: kategori[3],
      questioncorrect: 'Internet Explorer'),
  Question(
      questionid: '24',
      question:
          'Aplikasi pra-install Windows 10 dan Windows 11yang digunakan untuk berinternetan',
      listanswers: ['Internet Explorer', 'Google Chrome', 'Microsoft Edge'],
      questiontitle: kategori[3],
      questioncorrect: 'Microsoft Edge'),
  Question(
      questionid: '25',
      question:
          'Aplikasi pra-install Windows 10 dan Windows 11yang digunakan untuk mendeteksi antivirus',
      listanswers: ['Firewall', 'Windows Defender', 'Microsoft Edge'],
      questiontitle: kategori[3],
      questioncorrect: 'Windows Defender'),
];
/* Tentang Sistem Operasi Mac OS untuk stage 2 pada Mode Kedua*/
List<Question> tourstage222 = [
  Question(
      questionid: '1',
      question: 'Mac OS dibuat oleh ',
      listanswers: ['Apple', 'Google', 'Microsoft'],
      questiontitle: kategori[4],
      questioncorrect: 'Close Source'),
  Question(
      questionid: '2',
      question:
          'Di Windows terdapat tombol Start dan Di Mac OS terdapat tombol',
      listanswers: ['Alt', 'Command', 'Ctrl'],
      questiontitle: kategori[4],
      questioncorrect: 'Command'),
  Question(
      questionid: '3',
      question: 'File Management dalam Mac OS adalah',
      listanswers: ['Finder', 'Explorer', 'Manager'],
      questiontitle: kategori[4],
      questioncorrect: 'Finder'),
  Question(
      questionid: '4',
      question: 'Taskbar dalam Mac OS disebut dengan',
      listanswers: ['Taskbar', 'Dock', 'Window'],
      questiontitle: kategori[4],
      questioncorrect: 'Dock'),
  Question(
      questionid: '5',
      question: 'Kelebihan Mac OS, kecuali',
      listanswers: [
        'Performa Maksimal',
        'Cocok untuk Kreator di bidang Grafis',
        'Bisa diinstal di berbagai perangkat'
      ],
      questiontitle: kategori[4],
      questioncorrect: 'Bisa diinstal di berbagai perangkat'),
  Question(
      questionid: '6',
      question: 'Kekurangan Mac OS, kecuali',
      listanswers: [
        'Hanya didukung oleh Perangkat Apple',
        'Kurang Cocok Untuk Gaming',
        'Harga Murah'
      ],
      questiontitle: kategori[4],
      questioncorrect: 'Harga Murah'),
  Question(
      questionid: '7',
      question: 'Perangkat MacOS',
      listanswers: ['iPhone', 'Macbook', 'iPad'],
      questiontitle: kategori[4],
      questioncorrect: 'Macbook'),
  Question(
      questionid: '8',
      question: 'Command Prompt dalam Apple disebut',
      listanswers: ['MS DOS Prompt', 'Terminal', 'Powershell'],
      questiontitle: kategori[4],
      questioncorrect: 'Terminal'),
  Question(
      questionid: '9',
      question: 'Perintah Mac untuk melihat isi directory/folder',
      listanswers: ['dir', 'ls', 'cd'],
      questiontitle: kategori[4],
      questioncorrect: 'ls'),
  Question(
      questionid: '10',
      question: 'Text editor dalam Terimnal MacOS disebut',
      listanswers: ['Edit', 'Notepad', 'Nano'],
      questiontitle: kategori[4],
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
      questiontitle: kategori[4],
      questioncorrect: 'Masuk sebagai akun root tingkat administrator'),
  Question(
      questionid: '12',
      question: 'Control Panel dalam Mac Disebut',
      listanswers: ['Settings', 'System Preferences', 'Semua Benar'],
      questiontitle: kategori[4],
      questioncorrect: 'System Preferences'),
  Question(
      questionid: '13',
      question: 'MacOS versi terkini yang dirilis pada 2021 adalah',
      listanswers: ['Sierra', 'Monterrey', 'Cheetah'],
      questiontitle: kategori[4],
      questioncorrect: 'Monterrey'),
  Question(
      questionid: '14',
      question: 'Ciri-ciri Sistem operasi 64-bit dalam MacOS',
      listanswers: [
        'Dapat menjalankan program 16-bit',
        'Mendukung RAM diatas 4 GB',
        'Aplikasi 32-bit tetap berjalan dalam 64-bit'
      ],
      questiontitle: kategori[4],
      questioncorrect: 'Mendukung RAM diatas 4 GB'),
  Question(
      questionid: '15',
      question: 'Toko Aplikasi di Mac disebut',
      listanswers: ['App Store', 'Play Store', 'Microsoft Store'],
      questiontitle: kategori[4],
      questioncorrect: 'App Store'),
  Question(
      questionid: '16',
      question:
          'Yang bukan Ciri-ciri Sistem operasi 64-bit dalam MacOS Saat ini',
      listanswers: [
        'Dapat menjalankan program 32-bit',
        'Mendukung RAM diatas 4 GB',
        'Performa lebih cepat'
      ],
      questiontitle: kategori[4],
      questioncorrect: 'Dapat menjalankan program 32-bit'),
  Question(
      questionid: '17',
      question: 'Kekurangan MacOS, kecuali',
      listanswers: [
        'Perangkat Mahal',
        'Hanya bisa dijalankan di perangkat Apple',
        'Performa lebih cepat'
      ],
      questiontitle: kategori[4],
      questioncorrect: 'Performa lebih cepat'),
  Question(
      questionid: '18',
      question: 'MacOS pertama kali diperkenalkan pada tahun',
      listanswers: ['1984', '1989', '1994'],
      questiontitle: kategori[4],
      questioncorrect: '1984'),
  Question(
      questionid: '19',
      question: 'MacOS X pertama kali diperkenalkan pada tahun',
      listanswers: ['1991', '1996', '2001'],
      questiontitle: kategori[4],
      questioncorrect: '2001'),
  Question(
      questionid: '20',
      question: 'Perangkat yang dapat menjalankan MacOS',
      listanswers: ['Macbook', 'iPad', 'IPhone'],
      questiontitle: kategori[4],
      questioncorrect: 'Macbook'),
  Question(
      questionid: '21',
      question: 'File Explorer di MacOS disebut',
      listanswers: ['Finder', 'Terminal', 'Notes'],
      questiontitle: kategori[4],
      questioncorrect: 'Finder'),
  Question(
      questionid: '22',
      question: 'Fitur Backup di MacOS disebut',
      listanswers: ['Finder', 'Time Machine', 'Notes'],
      questiontitle: kategori[4],
      questioncorrect: 'Time Machine'),
  Question(
      questionid: '23',
      question: 'OS MacOS berbasis',
      listanswers: ['Linux', 'Unix', 'Darwin'],
      questiontitle: kategori[4],
      questioncorrect: 'UNIX'),
  Question(
      questionid: '24',
      question: 'UNIX adalah',
      listanswers: ['Kernel', 'GUI', 'Aplikasi'],
      questiontitle: kategori[4],
      questioncorrect: 'Kernel'),
  Question(
      questionid: '25',
      question: 'UNIX adalah',
      listanswers: ['Kernel', 'GUI', 'Aplikasi'],
      questiontitle: kategori[4],
      questioncorrect: 'Kernel'),
];
/* Tentang Sistem Operasi Windows dan Mac OS untuk stage 2 pada Mode Ketiga*/
List<Question> tourstage223 = [
  ...tourstage221.getRange(0, 15),
  ...tourstage222.getRange(0, 15),
];

/* Tentang Sistem Operasi dan Windows untuk stage 3 pada Mode Pertama*/
List<Question> tourstage231 = [
  Question(
      questionid: '1',
      question: 'Yang bukan merupakan definisi Sistem Operasi',
      listanswers: [
        'Sistem yang menghubungkan hardware dengan software',
        'Mempermudah interaksi pengguna',
        'Sistem yang memiliki komponen pada komputer'
            'Sistem yang membantu operasi komputer pengguna'
      ],
      questiontitle: kategori[2],
      questioncorrect: 'Sistem yang memiliki komponen pada komputer'),
  Question(
      questionid: '2',
      question: 'Contoh Sistem Operasi Komputer kecuali',
      listanswers: ['Windows', 'Linux', 'Android', 'MacOS'],
      questiontitle: kategori[2],
      questioncorrect: 'Windows'),
  Question(
      questionid: '3',
      question: 'Komponen dalam OS, kecuali',
      listanswers: ['File', 'UI', 'Kernel', 'Hardware'],
      questiontitle: kategori[2],
      questioncorrect: 'Hardware'),
  Question(
      questionid: '4',
      question: 'UI merupakan singkatan dari',
      listanswers: [
        'Utility Interface',
        'Utility Implementation',
        'User Inteface',
        'User Impelementation'
      ],
      questiontitle: kategori[2],
      questioncorrect: 'User Inteface'),
  Question(
      questionid: '5',
      question: 'Fungsi Sistem Operasi kecuali',
      listanswers: [
        'Sebagai Manajemen Sumber Daya Komputer',
        'Mengoptimal Fungsi Perangkat Komputer',
        'Menghubungkan Software'
      ],
      questiontitle: kategori[2],
      questioncorrect: 'Menghubungkan Software'),
  Question(
      questionid: '6',
      question: 'System Requriement dalam Sistem Operasi kecuali',
      listanswers: [
        'Mengetahui spesifikasi yang handal untuk menjalankan OS',
        'Menentukan spesifikasi penting Sistem Operasi dapat berjalan dengan lancar',
        'Menentukan harga spesifikasi komputer untuk berjalan dengan lancar',
        'Menentukan spesifikasi yang disarankan dalam menjalankan sebuah OS maupun Aplikasi'
      ],
      questiontitle: kategori[2],
      questioncorrect:
          'Menentukan harga spesifikasi komputer untuk berjalan dengan lancar'),
  Question(
      questionid: '7',
      question: 'Software dalam Sistem Operasi adalah',
      listanswers: [
        'Aplikasi untuk berisikan berbagai variasi sesuai kebutuhan pengguna',
        'Aplikasi untuk menampilkan gambar di monitor',
        'Aplikasi untuk mengelola komputer',
        'Aplikasi yang terdiri atas Browser dan Game'
      ],
      questiontitle: kategori[2],
      questioncorrect: 'Aplikasi untuk mengelola komputer'),
  Question(
      questionid: '8',
      question: 'Management yang ada di Sistem Operasi, Kecuali',
      listanswers: ['Device', 'System', 'File', 'Kernel'],
      questiontitle: kategori[2],
      questioncorrect: 'System'),
  Question(
      questionid: '9',
      question: 'Ciri-ciri Sistem Operasi 32-bit kecuali',
      listanswers: [
        'RAM Terbatas Hingga 3 GB',
        'Dapat menjalankan program 16-bit',
        'Digunakan untuk komputer yang tidak mendukung program 64-bit',
        'Dapat menjalan program 64-bit'
      ],
      questiontitle: kategori[2],
      questioncorrect: 'Dapat menjalan program 64-bit'),
  Question(
      questionid: '10',
      question: 'Ciri-ciri Sistem Operasi 64-bit adalah',
      listanswers: [
        'Dukungan RAM diatas 4 GB',
        'Tidak dapat menjalankan program 32-bit',
        'Harga Cukup Mahal',
        'Mengonsumsi RAM yang lebih banyak'
      ],
      questiontitle: kategori[2],
      questioncorrect: 'Dukungan RAM diatas 4 GB'),
  Question(
      questionid: '11',
      question: 'Instalansi Sistem Operasi dapat dilakukan melalui, kecuali',
      listanswers: ['USB', 'CD', 'ISO', 'Floppy'],
      questiontitle: kategori[2],
      questioncorrect: 'Floppy'),
  Question(
      questionid: '12',
      question: 'Windows, MacOS dan Linux adalah sistem operasi berjenis',
      listanswers: ['Networking', 'Live CD', 'Embedded', 'Standalone'],
      questiontitle: kategori[2],
      questioncorrect: 'Standalone'),
  Question(
      questionid: '13',
      question: 'Tahapan Sistem Operasi terdiri atas,',
      listanswers: ['Booting', 'Hardware', 'Browser', 'Explorer'],
      questiontitle: kategori[2],
      questioncorrect: 'Hardware'),
  Question(
      questionid: '14',
      question: 'Tahapan Sistem Operasi terdiri atas, kecuali',
      listanswers: [
        'Hardware',
        'Software',
        'Database',
        'Hardware dan Software'
      ],
      questiontitle: 'Komponen Komputer',
      questioncorrect: 'Hardware dan Software'),
  Question(
      questionid: '15',
      question: 'Yang  termasuk Sistem Operasi Stand Alone',
      listanswers: ['Windows', 'MacOS', 'Android', 'Windows dan MacOS'],
      questiontitle: kategori[2],
      questioncorrect: 'Windows dan MacOS'),
  Question(
      questionid: '16',
      question: 'Windows Merupakan OS yang bersifat',
      listanswers: [
        'Open Source',
        'Close Source',
        'Open dan Close Source',
        'Campuran'
      ],
      questiontitle: kategori[4],
      questioncorrect: 'Close Source'),
  Question(
      questionid: '17',
      question:
          'Untuk menjalankan aplikasi Run, Tombol shortcut untuk Windows Run adalah',
      listanswers: ['WIN + E', 'WIN + R', 'WIN + C', 'WIN + I'],
      questiontitle: kategori[4],
      questioncorrect: 'WIN + R'),
  Question(
      questionid: '18',
      question: 'Windows Explorer adalah ... ',
      listanswers: [
        'Driver Management'
            'Sistem Management',
        'File Management',
        'Device Management'
      ],
      questiontitle: kategori[4],
      questioncorrect: 'File Management'),
  Question(
      questionid: '19',
      question: 'Powershell adalah ',
      listanswers: [
        'Interface Command Line untuk melakukan task',
        'Interface Antar Muka untuk melakukan task',
        'Interface Terminal untuk melakukan task',
        ''
      ],
      questiontitle: kategori[4],
      questioncorrect: 'Interface Command Line untuk melakukan task'),
  Question(
      questionid: '20',
      question: 'Yang ada di dalam Start Menu, kecuali',
      listanswers: ['Daftar Program', 'Menu Boot', 'Semua Salah'],
      questiontitle: kategori[4],
      questioncorrect: 'Semua Salah'),
  Question(
      questionid: '21',
      question: 'Label pada Local Disc adalah',
      listanswers: ['A', 'C', 'D'],
      questiontitle: kategori[4],
      questioncorrect: 'C'),
  Question(
      questionid: '22',
      question: 'Label pada Drive Kedua adalah',
      listanswers: ['D', 'E', 'Semua Benar'],
      questiontitle: kategori[4],
      questioncorrect: 'Semua Benar'),
  Question(
      questionid: '23',
      question: 'Label pada Floppy adalah',
      listanswers: ['A', 'B', 'C'],
      questiontitle: kategori[4],
      questioncorrect: 'A'),
  Question(
      questionid: '24',
      question: 'Windows Pertama kali diperkenalkan pada tahun',
      listanswers: ['1975', '1985', '1995'],
      questiontitle: kategori[4],
      questioncorrect: '1985'),
  Question(
      questionid: '25',
      question: 'Task Manager adalah',
      listanswers: [
        'Aplikasi yang berisikan untuk melihat proses aplikasi beserta komponen',
        'Aplikasi yang berisikan untuk melihat status aplikasi beserta komponen',
        'Aplikasi yang berisikan untuk melihat error aplikasi beserta komponen'
      ],
      questiontitle: kategori[4],
      questioncorrect:
          'Aplikasi yang berisikan untuk melihat proses aplikasi beserta komponen'),
  Question(
      questionid: '26',
      question: 'Taskbar adalah',
      listanswers: [
        'Kumpulan aplikasi dan status dalam Windows',
        'Kumpulan beberapa aplikasi beserta aplikasi yang telah dipin dan status dalam Windows',
        'Berisikan Start Menu, Kumpulan beberapa aplikasi beserta aplikasi yang telah dipin dan status dalam Windows'
      ],
      questiontitle: kategori[4],
      questioncorrect:
          'Berisikan Start Menu, Kumpulan beberapa aplikasi beserta aplikasi yang telah dipin dan status dalam Windows'),
  Question(
      questionid: '27',
      question:
          'Untuk memeriksa komponen pada Windows dalam Command Prompt, Command apa yang digunakan',
      listanswers: ['sfc/ scannow', 'sfc /verifyonly', 'Semua Benar'],
      questiontitle: kategori[4],
      questioncorrect: 'sfc/ scannow'),
  Question(
      questionid: '28',
      question: 'Windows versi terkini yang dirilis pada 2021 adalah',
      listanswers: ['Windows 7', 'Windows 10', 'Windows 11'],
      questiontitle: kategori[4],
      questioncorrect: 'Windows 11'),
  Question(
      questionid: '29',
      question: 'Ciri-ciri Windows 64-bit kecuali',
      listanswers: [
        'Dapat menjalankan program 16-bit',
        'Mendukung RAM diatas 4 GB',
        'Aplikasi 32-bit tetap berjalan dalam 64-bit'
      ],
      questiontitle: kategori[4],
      questioncorrect: 'Dapat menjalankan program 16-bit'),
  Question(
      questionid: '30',
      question: 'Ciri-ciri Windows 32-bit adalah',
      listanswers: [
        'Dapat menjalankan program 16-bit',
        'Mendukung RAM diatas 4 GB',
        'Aplikasi 64-bit tetap berjalan dalam 32-bit'
      ],
      questiontitle: kategori[4],
      questioncorrect: 'Dapat menjalankan program 16-bit'),
];

/* Tentang Sistem Operasi dan Mac OS untuk stage 3 pada Mode Kedua*/
List<Question> tourstage232 = [
  ...tourstage231.getRange(0, 15),
  Question(
      questionid: '16',
      question: 'Mac OS dibuat oleh ',
      listanswers: ['Mozilla', 'Apple', 'Google', 'Microsoft'],
      questiontitle: kategori[5],
      questioncorrect: 'Apple'),
  Question(
      questionid: '17',
      question:
          'Di Windows terdapat tombol Start dan Di Mac OS terdapat tombol',
      listanswers: ['Alt', 'Command', 'Ctrl', 'Shift'],
      questiontitle: kategori[5],
      questioncorrect: 'Command'),
  Question(
      questionid: '18',
      question: 'File Management dalam Mac OS adalah',
      listanswers: ['Explorer', 'Manager', 'Finder', 'Terminal'],
      questiontitle: kategori[5],
      questioncorrect: 'Finder'),
  Question(
      questionid: '19',
      question: 'Taskbar dalam Mac OS disebut dengan',
      listanswers: ['Taskbar', 'Dock', 'Window', 'Sidebar'],
      questiontitle: kategori[5],
      questioncorrect: 'Dock'),
  Question(
      questionid: '20',
      question: 'Kelebihan Mac OS, kecuali',
      listanswers: [
        'Performa Maksimal',
        'Cocok untuk Kreator di bidang Grafis',
        'Bisa diinstal di berbagai perangkat'
      ],
      questiontitle: kategori[5],
      questioncorrect: 'Bisa diinstal di berbagai perangkat'),
  Question(
      questionid: '21',
      question: 'Kekurangan Mac OS, kecuali',
      listanswers: [
        'Hanya didukung oleh Perangkat Apple',
        'Kurang Cocok Untuk Gaming',
        'Harga Murah'
      ],
      questiontitle: kategori[5],
      questioncorrect: 'Harga Murah'),
  Question(
      questionid: '22',
      question: 'Perangkat MacOS',
      listanswers: ['iPhone', 'Macbook', 'iPad'],
      questiontitle: kategori[5],
      questioncorrect: 'Macbook'),
  Question(
      questionid: '23',
      question: 'Command Prompt dalam Apple disebut',
      listanswers: ['MS DOS Prompt', 'Terminal', 'Powershell'],
      questiontitle: kategori[5],
      questioncorrect: 'Terminal'),
  Question(
      questionid: '24',
      question: 'Perintah Mac untuk melihat isi directory/folder',
      listanswers: ['dir', 'ls', 'cd'],
      questiontitle: kategori[5],
      questioncorrect: 'ls'),
  Question(
      questionid: '25',
      question: 'Text editor dalam Terimnal MacOS disebut',
      listanswers: ['Edit', 'Notepad', 'Nano'],
      questiontitle: kategori[5],
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
      questiontitle: kategori[5],
      questioncorrect: 'Masuk sebagai akun root tingkat administrator'),
  Question(
      questionid: '27',
      question: 'Control Panel dalam Mac Disebut',
      listanswers: ['Settings', 'System Preferences', 'Semua Benar'],
      questiontitle: kategori[5],
      questioncorrect: 'System Preferences'),
  Question(
      questionid: '28',
      question: 'Windows versi terkini yang dirilis pada 2021 adalah',
      listanswers: ['Windows 7', 'Windows 10', 'Windows 11'],
      questiontitle: kategori[5],
      questioncorrect: 'Windows 11'),
  Question(
      questionid: '29',
      question: 'Ciri-ciri Sistem operasi 64-bit dalam MacOS Saat ini',
      listanswers: [
        'Dapat menjalankan program 16-bit',
        'Mendukung RAM diatas 4 GB',
        'Aplikasi 32-bit tetap berjalan dalam 64-bit'
      ],
      questiontitle: kategori[5],
      questioncorrect: 'Mendukung RAM diatas 4 GB'),
  Question(
      questionid: '30',
      question: 'Toko Aplikasi di Mac disebut',
      listanswers: ['App Store', 'Play Store', 'Microsoft Store'],
      questiontitle: kategori[5],
      questioncorrect: 'App Store'),
];
/* Tentang True False Komputer Dasaruntuk stage 1*/
List<Question> tourstage311 = [
  Question(
      questionid: '1',
      question: 'Kata Komputer berasal dari Bahasa Latin',
      listanswers: tfanswer,
      questiontitle: kategori[5],
      questioncorrect: tfanswer[0]),
  Question(
      questionid: '2',
      question: 'Dalam Bahasa Inggris, Compute berarti mengurangi',
      listanswers: tfanswer,
      questiontitle: kategori[5],
      questioncorrect: tfanswer[0]),
  Question(
      questionid: '3',
      question: 'CPU merupakan singkatan dari Center Processing Utility',
      listanswers: tfanswer,
      questiontitle: kategori[5],
      questioncorrect: tfanswer[1]),
  Question(
      questionid: '4',
      question: 'SSD SATA merupakan jenis SSD Tercepat',
      listanswers: tfanswer,
      questiontitle: kategori[5],
      questioncorrect: tfanswer[1]),
  Question(
      questionid: '5',
      question:
          'Untuk menampilkan gambar visual komputer dalam monitor maka diperlukan kartu VGA',
      listanswers: tfanswer,
      questiontitle: kategori[5],
      questioncorrect: tfanswer[1]),
  Question(
      questionid: '6',
      question: 'HDD lebih baik daripada SSD',
      listanswers: tfanswer,
      questiontitle: kategori[5],
      questioncorrect: tfanswer[1]),
  Question(
      questionid: '7',
      question: 'Salah satu kelemahan SSD adalah harga yang cukup mahal',
      listanswers: tfanswer,
      questiontitle: kategori[5],
      questioncorrect: tfanswer[0]),
  Question(
      questionid: '8',
      question: 'Salah satu kelemahan HDD adalah suara sunyi',
      listanswers: tfanswer,
      questiontitle: kategori[5],
      questioncorrect: tfanswer[1]),
  Question(
      questionid: '9',
      question:
          'Salah satu komponen komputer yang dapat menampilkan tampilan pada monitor adalah Processor',
      listanswers: tfanswer,
      questiontitle: kategori[5],
      questioncorrect: tfanswer[1]),
  Question(
      questionid: '10',
      question:
          'Komponen terpenting dalam menyalakan komputer adalah Power Supply',
      listanswers: tfanswer,
      questiontitle: kategori[5],
      questioncorrect: tfanswer[0]),
  Question(
      questionid: '11',
      question: 'Kekurangan Hard Disk Drive adalah Suara terlalu bising',
      listanswers: tfanswer,
      questiontitle: kategori[5],
      questioncorrect: tfanswer[0]),
  Question(
      questionid: '12',
      question: 'Untuk menjaga suhu dalam CPU maka diperlukan Thermal Paste',
      listanswers: tfanswer,
      questiontitle: kategori[5],
      questioncorrect: tfanswer[0]),
  Question(
      questionid: '13',
      question:
          'HDD, SDD dan USB adalah driver external yang dapat digunakan sebagai media penyimpanan pada komputer',
      listanswers: tfanswer,
      questiontitle: kategori[5],
      questioncorrect: tfanswer[0]),
  Question(
      questionid: '14',
      question: 'SSD merupakan singkatan dari Secure Solid Drive',
      listanswers: tfanswer,
      questiontitle: kategori[5],
      questioncorrect: tfanswer[1]),
  Question(
      questionid: '15',
      question: 'Media Penyimpanan internal Komputer berada di RAM',
      listanswers: tfanswer,
      questiontitle: kategori[5],
      questioncorrect: tfanswer[1]),
  Question(
      questionid: '16',
      question: 'Komponen yang dapat digunakan untuk mengetik adalah Mouse',
      listanswers: tfanswer,
      questiontitle: kategori[5],
      questioncorrect: 'Mouse'),
  Question(
      questionid: '17',
      question: 'Headset bukan merupakan komponen komputer',
      listanswers: tfanswer,
      questiontitle: kategori[5],
      questioncorrect: tfanswer[0]),
  Question(
      questionid: '18',
      question:
          'Komponen yang dapat digunakan ketika bermain game dalam komputer adalah Mouse, Keyboard, Joystick',
      listanswers: tfanswer,
      questiontitle: kategori[5],
      questioncorrect: tfanswer[0]),
  Question(
      questionid: '19',
      question:
          'Untuk mengeluarkan suara pada Komputer, Komputer memerlukan Harddisk',
      listanswers: tfanswer,
      questiontitle: kategori[5],
      questioncorrect: tfanswer[1]),
  Question(
      questionid: '20',
      question: 'Jenis Penyimpanan Internal adalah SSD',
      listanswers: tfanswer,
      questiontitle: kategori[5],
      questioncorrect: tfanswer[0]),
];

/* Tentang Sistem Operasi Windows untuk stage 3 pada Mode Kedua*/
List<Question> tourstage321 = [
  Question(
      questionid: '1',
      question: 'Windows Merupakan OS yang bersifat Open Source',
      listanswers: tfanswer,
      questiontitle: kategori[6],
      questioncorrect: tfanswer[0]),
  Question(
      questionid: '2',
      question: 'Untuk menutup jendela aplikasi dapat dilakukan melalui Alt+F1',
      listanswers: tfanswer,
      questiontitle: kategori[6],
      questioncorrect: tfanswer[1]),
  Question(
      questionid: '3',
      question: 'Windows Defender adalah Antivirus buatan Microsoft',
      listanswers: tfanswer,
      questiontitle: kategori[6],
      questioncorrect: tfanswer[0]),
  Question(
      questionid: '4',
      question: 'CMD adalah terminal pada Microsoft Windows',
      listanswers: tfanswer,
      questiontitle: kategori[6],
      questioncorrect: tfanswer[0]),
  Question(
      questionid: '5',
      question: 'Win+R adalah tombol untuk membuka aplikasi regedit',
      listanswers: tfanswer,
      questiontitle: kategori[6],
      questioncorrect: tfanswer[1]),
  Question(
      questionid: '6',
      question: 'Label pada Local Disc adalah C',
      listanswers: tfanswer,
      questiontitle: kategori[6],
      questioncorrect: tfanswer[0]),
  Question(
      questionid: '7',
      question: 'Label pada Drive Kedua adalah D maupun E',
      listanswers: tfanswer,
      questiontitle: kategori[6],
      questioncorrect: tfanswer[0]),
  Question(
      questionid: '8',
      question: 'Label pada Floppy adalah C',
      listanswers: tfanswer,
      questiontitle: kategori[6],
      questioncorrect: tfanswer[1]),
  Question(
      questionid: '9',
      question: 'Windows Pertama kali diperkenalkan pada tahun 1985',
      listanswers: tfanswer,
      questiontitle: kategori[6],
      questioncorrect: tfanswer[0]),
  Question(
      questionid: '10',
      question: 'Label pada Local Disk adalah C',
      listanswers: tfanswer,
      questiontitle: kategori[6],
      questioncorrect: tfanswer[0]),
  Question(
      questionid: '11',
      question:
          'Taskbar berisikan aplikasi yang dipin, start menu dan notifikasi',
      listanswers: tfanswer,
      questiontitle: kategori[6],
      questioncorrect: tfanswer[0]),
  Question(
      questionid: '12',
      question: 'CMD dan Powershell itu sama',
      listanswers: tfanswer,
      questiontitle: kategori[6],
      questioncorrect: tfanswer[1]),
  Question(
      questionid: '13',
      question: 'Windows versi pertama adalah Windows 1.0',
      listanswers: tfanswer,
      questiontitle: kategori[6],
      questioncorrect: tfanswer[0]),
  Question(
      questionid: '14',
      question: 'Ciri-ciri Windows 64-bit yaitu dapat dijalankan diatas 4 GB',
      listanswers: tfanswer,
      questiontitle: kategori[6],
      questioncorrect: tfanswer[0]),
  Question(
      questionid: '15',
      question:
          'Ciri-ciri Windows 32-bit adalah tidak mampu menjalankan program 64-bit',
      listanswers: tfanswer,
      questiontitle: kategori[6],
      questioncorrect: tfanswer[0]),
  Question(
      questionid: '16',
      question: 'Untuk mengakses run hanya memerlukan WIN + A',
      listanswers: tfanswer,
      questiontitle: kategori[6],
      questioncorrect: tfanswer[1]),
  Question(
      questionid: '17',
      question: 'Paint adalah aplikasi text editor',
      listanswers: tfanswer,
      questiontitle: kategori[6],
      questioncorrect: tfanswer[1]),
  Question(
      questionid: '18',
      question: 'Notepad adalah text Editor',
      listanswers: tfanswer,
      questiontitle: kategori[6],
      questioncorrect: tfanswer[0]),
  Question(
      questionid: '19',
      question:
          'Aplikasi pra-install Windows yang digunakan untuk memutarkan video adalah Windows Media Player',
      listanswers: tfanswer,
      questiontitle: kategori[6],
      questioncorrect: tfanswer[0]),
  Question(
      questionid: '20',
      question: 'Word merupakan bagian dari Microsoft Office',
      listanswers: tfanswer,
      questiontitle: kategori[6],
      questioncorrect: tfanswer[0]),
];

/* Tentang Sistem Operasi Mac OS untuk stage 2 pada Mode Kedua*/
List<Question> tourstage322 = [
  Question(
      questionid: '1',
      question: 'Mac OS dibuat oleh Linux',
      listanswers: tfanswer,
      questiontitle: kategori[7],
      questioncorrect: tfanswer[1]),
  Question(
      questionid: '2',
      question:
          'Di Windows terdapat tombol Start dan Di Mac OS terdapat tombol Command',
      listanswers: tfanswer,
      questiontitle: kategori[7],
      questioncorrect: tfanswer[0]),
  Question(
      questionid: '3',
      question: 'File Management dalam Mac OS adalah File Explorer',
      listanswers: tfanswer,
      questiontitle: kategori[7],
      questioncorrect: tfanswer[1]),
  Question(
      questionid: '4',
      question: 'Taskbar dalam Mac OS disebut dengan Dock',
      listanswers: tfanswer,
      questiontitle: kategori[7],
      questioncorrect: tfanswer[0]),
  Question(
      questionid: '5',
      question: 'MacOS hanya dapat dijalankan di perangkat Apple',
      listanswers: tfanswer,
      questiontitle: kategori[7],
      questioncorrect: tfanswer[0]),
  Question(
      questionid: '6',
      question: 'Equivalent CMD di Mac OS adalah Terminal',
      listanswers: tfanswer,
      questiontitle: kategori[7],
      questioncorrect: tfanswer[0]),
  Question(
      questionid: '7',
      question: 'Finder serupa dengan File Exploere',
      listanswers: tfanswer,
      questiontitle: kategori[7],
      questioncorrect: tfanswer[0]),
  Question(
      questionid: '8',
      question: 'Command Prompt dalam Apple disebut Powershell',
      listanswers: tfanswer,
      questiontitle: kategori[7],
      questioncorrect: tfanswer[1]),
  Question(
      questionid: '9',
      question: 'Perintah Mac untuk melihat isi directory/folder adalah ls',
      listanswers: tfanswer,
      questiontitle: kategori[7],
      questioncorrect: tfanswer[0]),
  Question(
      questionid: '10',
      question: 'Text editor dalam Terimnal MacOS disebut nano',
      listanswers: tfanswer,
      questiontitle: kategori[7],
      questioncorrect: tfanswer[0]),
  Question(
      questionid: '11',
      question: 'Sudo su adalah command untuk mengakses sebagai administrator',
      listanswers: tfanswer,
      questiontitle: kategori[7],
      questioncorrect: tfanswer[0]),
  Question(
      questionid: '12',
      question: 'Control Panel dalam Mac Disebut System Preference',
      listanswers: tfanswer,
      questiontitle: kategori[7],
      questioncorrect: tfanswer[0]),
  Question(
      questionid: '13',
      question: 'Mac dapat dijalankan di perangkat non-Apple',
      listanswers: tfanswer,
      questiontitle: kategori[7],
      questioncorrect: tfanswer[1]),
  Question(
      questionid: '14',
      question:
          'Ciri-ciri Sistem operasi 64-bit dalam MacOS Saat ini adalah mendukung RAM diatas 4 GB',
      listanswers: tfanswer,
      questiontitle: kategori[7],
      questioncorrect: tfanswer[0]),
  Question(
      questionid: '15',
      question: 'Toko Aplikasi di Mac serupa dengan iOS',
      listanswers: tfanswer,
      questiontitle: kategori[7],
      questioncorrect: tfanswer[0]),
  Question(
      questionid: '15',
      question: 'Toko Aplikasi di Mac disebut Play Store',
      listanswers: tfanswer,
      questiontitle: kategori[7],
      questioncorrect: tfanswer[1]),
  Question(
      questionid: '16',
      question:
          'Yang Ciri-ciri Sistem operasi 64-bit dalam MacOS Saat ini adalah hanya berjalan di 64-bit',
      listanswers: tfanswer,
      questiontitle: kategori[7],
      questioncorrect: tfanswer[0]),
  Question(
      questionid: '17',
      question: 'Kekurangan MacOS adalah harus menggunakan Macbook',
      listanswers: tfanswer,
      questiontitle: kategori[7],
      questioncorrect: tfanswer[1]),
  Question(
      questionid: '18',
      question: 'MacOS pertama kali diperkenalkan pada tahun 1984',
      listanswers: tfanswer,
      questiontitle: kategori[7],
      questioncorrect: tfanswer[0]),
  Question(
      questionid: '19',
      question: 'MacOS X pertama kali diperkenalkan pada tahun 2001',
      listanswers: tfanswer,
      questiontitle: kategori[7],
      questioncorrect: tfanswer[0]),
  Question(
      questionid: '20',
      question: 'Perangkat yang dapat menjalankan MacOS adalah Dell Insprion',
      listanswers: tfanswer,
      questiontitle: kategori[7],
      questioncorrect: tfanswer[0]),
];

/* Tentang True False Komputer Dasar untuk stage 3*/
List<Question> tourstage331 = tourstage311;

/* Tentang Sistem Operasi Windows untuk stage 3 pada Mode Kedua*/
List<Question> tourstage332 = [
  ...tourstage321.getRange(0, 15),
  ...tourstage311.getRange(0, 15),
];

/* Tentang Sistem Operasi Mac OS untuk stage 2 pada Mode Kedua*/
List<Question> tourstage333 = [
  ...tourstage321.getRange(0, 15),
  ...tourstage311.getRange(0, 15),
];
