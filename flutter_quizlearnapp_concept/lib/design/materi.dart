part of 'designs.dart';

class MateriKomputerDasarTile extends StatelessWidget {
  const MateriKomputerDasarTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pdfPinchController = PdfControllerPinch(
  document: PdfDocument.openAsset('assets/docs/GEKomnon_KomputerDasar.pdf'),
);

// Pdf view with re-render pdf texture on zoom (not loose quality on zoom)
// Not supported on windows

    return PdfViewPinch(

  controller: pdfPinchController,
);

}
}

class MateriOSTile extends StatelessWidget {
  const MateriOSTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("Sistem Operasi"),
        Text(
            "Sistem Operasi merupakan mengelola sumber daya (resources) dari software dan hardware agar dapat berjalan dengan baik serta memudahkan proses interaksi dengan pengguna"),
        Text("Jenis-jenis Sistem Operasi"),
        ListTile(
            title: Text("Sistem Operasi Stand Alone"),
            subtitle: Text(
                "dapat digunakan oleh single user maupun multi user, sistem operasi ini juga memliki fitur-fitur yang cukup lengkap dan dapat berdiri sendiri \nContoh: Windows, MacOS, Linux")),
        ListTile(
          title: Text("Sistem Operasi Embedded"),
          subtitle: Text(
              "Sistem ini langsung ditanam di komputer dan tidak bisa berdiri sendiri, memiliki fungsi khusus dan speksifikasi khusus. \nContoh: Windows Embeeded, CentOS"),
        ),
        ListTile(
          title: Text("Sistem Operasi Jaringan"),
          subtitle: Text(
              "Dibuat khusus untuk menangani keperluan jaringan komputer. \nContoh: Red Hat, Centos Server"),
        ),
        ListTile(
          title: Text("Sistem Operasi Live CD"),
          subtitle: Text(
              "Hanya membutuhkan perangkat CD/DVD room tanpa perlu menginstal secara permanen di komputer \nContoh: Centos, Linux Mint"),
        ),
        Text("Komponen dan Fungsi Sistem Operasi"),
        ListTile(
          title: Text("Sistem Operasi Live CD"),
          subtitle: Text(
              "Hanya membutuhkan perangkat CD/DVD room tanpa perlu menginstal secara permanen di komputer \nContoh: Centos, Linux Mint"),
        ),
        Text("Bit dalam Sistem Operasi"),
        ListTile(
          title: Text("32 bit"),
          subtitle: Text("Sistem Operasi yang memiliki batasan RAM hingga 3 GB dan memiliki kemampuan untuk menjalankan program 16-bit")
        ),
        ListTile(
          title: Text("64 bit"),
          subtitle: Text("Sistem Operasi yang memiliki dukungan RAM diatas 2 GB dan umum digunakan pada saat ini dalam gaming, video editing dan pemrograman.")
        ),
      ],
    );
  }
}
