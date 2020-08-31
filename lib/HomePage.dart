import 'package:flutter/material.dart';
import 'Authentication.dart';
import 'PhotoUpload.dart';

class HomePage extends StatefulWidget {
  HomePage({
    this.auth,
    this.onSignedOut,
  });

  final AuthImplementation auth;
  final VoidCallback onSignedOut;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  void _logoutUser() async {
    try {
      await widget.auth.signOut();
      widget.onSignedOut();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Home"),
      ),
      body: new Container(),
      bottomNavigationBar: new BottomAppBar(
        color: Colors.deepOrange,
        child: new Container(
          margin: const EdgeInsets.only(left: 70, right: 70),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              new IconButton(
                icon: new Icon(Icons.add_a_photo),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return new UploadPhotoPage();
                  }));
                },
                color: Colors.white,
                iconSize: 40,
              ),
              new IconButton(
                icon: new Icon(Icons.logout),
                onPressed: _logoutUser,
                color: Colors.white,
                iconSize: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
