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
