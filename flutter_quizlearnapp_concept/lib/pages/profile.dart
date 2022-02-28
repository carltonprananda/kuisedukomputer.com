part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = "Dean", email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
                height: 20.h,
                child: Container(
                  color: Colors.blueAccent,
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          radius: 30,
                          child: Text(name[0].toUpperCase(),
                              style: TextStyle(fontSize: 11.sp)),
                        ),
                        Text(name, style: TextStyle(fontSize: 10.sp)),
                        ButtonBar(
                          alignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(onPressed: null, child: Text("Materi")),
                            ElevatedButton(onPressed: null, child: Text("Signout"))
                          ],
                        )
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
