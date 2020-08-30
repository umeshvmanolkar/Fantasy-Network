import 'package:fantasy_network/DialogBox.dart';
import 'package:flutter/material.dart';
import 'Authentication.dart';
import 'DialogBox.dart';

class LoginRegisterPage extends StatefulWidget {
  @override
  LoginRegisterPage({
    this.auth,
    this.onSignedIn,
  });
  final AuthImplementation auth;
  final VoidCallback onSignedIn;
  State<StatefulWidget> createState() {
    return _LoginRegisterPageState();
  }
}

enum FormType { login, register }

class _LoginRegisterPageState extends State<LoginRegisterPage> {
  DialogBox dialogBox = new DialogBox();

  final formKey = new GlobalKey<FormState>();
  FormType _formType = FormType.login;
  String _email = "";
  String _password = "";

  bool validateAndSave() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  void validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        if (_formType == FormType.login) {
          String userId = await widget.auth.SignIn(_email, _password);
          dialogBox.information(context, "Congratulation ", "Signed In");
          print("login userId=" + userId);
        } else {
          String userId = await widget.auth.SignUp(_email, _password);
          dialogBox.information(context, "Congratulation ", "Signed Up");
          print("Register userId=" + userId);
        }
        widget.onSignedIn();
      } catch (e) {
        dialogBox.information(context, "Error = ", e.toString());
        print("Error = " + e.toString());
      }
    }
  }

  void moveToRegisterPage() {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.register;
    });
  }

  void moveToLoginPage() {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.login;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Fantasy Network"),
      ),
      body: new Container(
        margin: EdgeInsets.all(15.0),
        child: new Form(
            key: formKey,
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: createInputs() + createButtons(),
            )),
      ),
    );
  }

  List<Widget> createInputs() {
    return [
      SizedBox(
        height: 10.0,
      ),
      new Container(child: Image.asset('images/logo.jpg')),
      SizedBox(
        height: 20.0,
      ),
      new TextFormField(
        decoration: new InputDecoration(labelText: 'Email'),
        validator: (value) {
          return value.isEmpty ? 'Email is required' : null;
        },
        onSaved: (value) {
          return _email = value;
        },
      ),
      SizedBox(
        height: 10.0,
      ),
      new TextFormField(
        decoration: new InputDecoration(labelText: 'Password'),
        obscureText: true,
        validator: (value) {
          return value.isEmpty ? 'Password is required' : null;
        },
        onSaved: (value) {
          return _password = value;
        },
      ),
      SizedBox(
        height: 10.0,
      ),
    ];
  }

  List<Widget> createButtons() {
    if (_formType == FormType.login) {
      return [
        new RaisedButton(
          child: new Text(
            "Login",
            style: new TextStyle(fontSize: 20),
          ),
          textColor: Colors.white,
          color: Colors.orange,
          onPressed: validateAndSubmit,
        ),
        new FlatButton(
          child: new Text(
            "Not have an Account? Create Account?",
            style: new TextStyle(fontSize: 14),
          ),
          textColor: Colors.red,
          onPressed: moveToRegisterPage,
        )
      ];
    } else {
      return [
        new RaisedButton(
          child: new Text(
            "Create an Account",
            style: new TextStyle(fontSize: 20),
          ),
          textColor: Colors.white,
          color: Colors.orange,
          onPressed: validateAndSubmit,
        ),
        new FlatButton(
          child: new Text(
            "Already have an Account? Login",
            style: new TextStyle(fontSize: 14),
          ),
          textColor: Colors.red,
          onPressed: moveToLoginPage,
        )
      ];
    }
  }
}
