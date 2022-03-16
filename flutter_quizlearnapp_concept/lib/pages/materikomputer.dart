part of 'pages.dart';

class MateriKomputerPage extends StatelessWidget {
  const MateriKomputerPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: const <Widget>[
          Text("Komputer Dasar"),
          Expanded(child: SingleChildScrollView(child: MateriKomputerDasarTile())),
          Text("Sistem Operasi"),
          Expanded(child: SingleChildScrollView(child: MateriOSTile())),
          Text("Keamanan Komputer"),
        ],
      ),
    );
  }
}

class IstilahKomputerPage extends StatelessWidget {
  const IstilahKomputerPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class MateriIstilahPage extends StatefulWidget {
  const MateriIstilahPage({Key key}) : super(key: key);

  @override
  State<MateriIstilahPage> createState() => _MateriIstilahPageState();
}

class _MateriIstilahPageState extends State<MateriIstilahPage> with SingleTickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
