import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "User"),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Password"),
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
            ),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              onPressed: () {
                // Navigator.of(context).pushReplacementNamed('/home');
                Modular.to.pushReplacementNamed('/home');
              },
              child: Text("Login"),
            )
          ],
        ),
      ),
    );
  }
}
