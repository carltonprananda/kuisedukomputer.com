part of 'pages.dart';

class PretestMulti1 extends StatefulWidget {
  PretestMulti1({Key key}) : super(key: key);

  @override
  State<PretestMulti1> createState() => _PretestMulti1State();
}

class _PretestMulti1State extends State<PretestMulti1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Materi Pretest"),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Text("Komputer"),
                Text(
                    "Komputer merupakan salah satu perangkat media penting pada saat ini. Komputer telah digunakan dalam berbagai bidang seperti Perfilman, Bisnis dan sebagainya. Kata Komputer berasal dari Bahasa Latin, Computo yang berarti 'Menghitung' dan dibawa dalam bahasa Inggris yaitu 'compute'. "),
                Image.network('https://asset.kompas.com/crops/DJL2L7ZbYv1LGXIP3zqFqVKQhNQ=/28x0:872x563/750x500/data/photo/2021/09/08/6138400587c9f.jpg'),
                Text("Komponen Komputer"),
                Text("Komponen Komputer terdiri atas"),
                ListView(
                  children: [
                    ListTile(
                      title: Text("Case"),
                      subtitle: Text(
                          "Case adalah tempat utama penyimpanan dan pemasangan suatu hardware seperti Motherboard, HDD dan Power Supply"),
                    ),
                    ListTile(
                      title: Text("Motherboard"),
                      subtitle: Text(
                          "Motherboard adalah komponen utama yang terdiri atas CPU,Socket dan RAM"),
                    ),
                    ListTile(
                      title: Text("CPU"),
                      subtitle: Text(
                          "CPU adalah komponen keras atau perangkat hardware pemroses data utama dalam sebuah komputer. /n Core merupakan salah satu bagian dari prosesor yang memiliki tugas membaca instruksi kemudian menjalankannya seperti menjalankan OS dan Aplikasi. Pada awalnya Core terdiri hanya satu yaitu single-core (1 core) namun seiring dengan perubahan waktu dan kebutuhan sistem yang semakin meningkat, dual-core (2 core), quad-core (4 core), octa-core (6 core) dan hexa-core (8 core) muncul untuk memperlancar dan mempercepat performa."),
                    ),
                    ListTile(
                      title: Text("RAM"),
                      subtitle: Text(
                          "RAM adalah suatu hardware yang ada di dalam komputer sebagai tempat penyimpanan data sementara (memori) dan berbagai instruksi program. /n DDR adalah jenis memori atau RAM komputer yang sangat cepat dalam memproses perfoma dan transfer data. Kekurangan DDR adalah tidak bisa memasang DDR RAM pada generasi yang berbeda sehingga DDR RAM hanya bisa dipasang pada jenis dan generasi RAM yang sama seperti seorang pengguna memiliki motherboard dengan RAM jenis DDR4 maka dari itu DDR yang hanya boleh dipasang harus DDR4 dan model yang sama. /n Sistem operasi 32-bit hanya bisa membaca hingga 3 GB sedangkan 64 bit mampu membaca hingga batas yang ditentukan dalam speksifikasi motherboard."),
                    ),
                    ListTile(
                      title: Text("Kartu VGA"),
                      subtitle: Text(
                          "Kartu VGA adalah komponen yang mengubah data menjadi tampilan pada monitor. Kartu VGA umumnya digunakan dalam mempercepat proses perubahan tampilan dan juga digunakan sebagai pengaruh performa decoding pada game dan juga program berat."),
                    ),
                    ListTile(
                      title: Text("Power Supply"),
                      subtitle: Text(
                          "Power supply adalah salah satu komponen perangkat keras yang berperan sebagai penyedia listrik dan daya yang digunakan untuk menyalakan komputer dan perangkat lainnya."),
                    ),
                    ListTile(
                      title: Text("HDD"),
                      subtitle: Text(
                          "Hard Disk Drive adalah tempat penyimpanan internal pada komputer. Pada saat ini jenis Hardware untuk penyimpanan internal dan external terdiri atas HDD, SSD M.2, dan NVMe. /n HDD merupakan penyimpanan dalam bentuk cakram disk dan disk memutar untuk memproses data /n SSD adalah penyimpanan dalam bentuk chip dan kelebihan SSD adalah kemampuan memproses dan booting lebih cepat /n M.2 adalah SSD yang ukurannya lebih kecil namun memiliki kemampuan pemrosesan data lebih cepat dibandingkan dengan SSD dan memiliki 3 slot pemasangan. /n NVMe adalah SSD yang memiliki ukuran yang sama dengan M.2 namun memiliki 2 slot pemasaangan."),
                    ),
                    ListTile(
                      title: Text("Monitor"),
                      subtitle: Text(
                          "Monitor adalah komponen layar visual yang menampilkan gambar dari kartu grafis VGA. Dukungan resolusi Monitor bergantung pada dukungan VGA maupun kartu grafis pada komputer."),
                    ),
                    ListTile(
                      title: Text("Speaker"),
                      subtitle: Text(
                          "Speaker adalah komponen yang mengeluarkan suara dari kartu suara (soundcard) pada motherboard."),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
