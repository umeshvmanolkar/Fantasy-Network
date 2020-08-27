import 'package:flutter/material.dart';
import 'Authentication.dart';

class HomePage extends StatefulWidget {
  HomePage({
    this.auth,
  });

  final AuthImplementation auth;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Home"),
      ),
      body: new Container(),
      bottomNavigationBar: new BottomAppBar(
        color: Colors.deepOrange,
        child: new Container(
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              new IconButton(
                icon: new Icon(Icons.add_a_photo),
                onPressed: null,
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
