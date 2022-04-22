part of 'pages.dart';

class MateriKomputerPage extends StatelessWidget {
  const MateriKomputerPage({Key key}) : super(key: key);
  

  @override
  
  Widget build(BuildContext context) {
    final pdfPinchController = PdfControllerPinch(
  document: PdfDocument.openAsset('assets/docs/GEKomnon_KomputerDasar.pdf'),

);
    return Scaffold(
      appBar: AppBar(
        title: Text("Materi Komputer"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: PdfViewPinch(          
            controller: pdfPinchController,
          ),
          )
        ],
      ),
    );
  }
}