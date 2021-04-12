import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SigninPage extends StatefulWidget {
  SigninPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _SigninPage createState() => _SigninPage();
}

class _SigninPage extends State<SigninPage> {
  Widget buildForm(BuildContext context) {
    return Form(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Username"),
        TextFormField(),
        SizedBox(height: 20),
        Text("Password"),
        TextFormField(
          obscureText: true,
        ),
        SizedBox(height: 20),
        OutlinedButton(
            onPressed: () {},
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(20),
              child: Text("Signin"),
            ))
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      padding: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 60),
          Text(
            "Let's sign you in to Pastebin",
            style: Theme.of(context).textTheme.headline2,
          ),
          SizedBox(height: 20),
          Text(
            "Welcome Back",
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(height: 60),
          this.buildForm(context)
        ],
      ),
    ));
  }
}
