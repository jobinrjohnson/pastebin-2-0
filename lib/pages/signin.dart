import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pastebin/components/logo.dart';

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
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(decoration: InputDecoration(hintText: "Username")),
        SizedBox(height: 20),
        TextFormField(
            decoration: InputDecoration(hintText: "Password"),
            obscureText: true),
        SizedBox(height: 20),
        // TextButton(
        //     onPressed: () {},
        //     child: Padding(
        //       child: Text("Sign In"),
        //       padding: EdgeInsets.symmetric(vertical: 5),
        //     ))
      ],
    ));
  }

  buildBottomNavigBar() {
    return Container(
        padding: EdgeInsets.all(40),
        height: 190,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't Have and Account? "),
                SizedBox(width: 8),
                Text(
                  "Sign up",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 20),
            TextButton(
                onPressed: () {},
                child: Padding(
                  child: Text("Sign In"),
                  padding: EdgeInsets.symmetric(vertical: 5),
                ))
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: this.buildBottomNavigBar(),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Logo(),
              SizedBox(height: 60),
              Text(
                "Sign In ",
                style: Theme.of(context).textTheme.headline2,
              ),
              SizedBox(height: 20),
              Text(
                "Welcome Back to Pastebin.",
                style: Theme.of(context).textTheme.headline5,
              ),
              SizedBox(height: 60),
              this.buildForm(context)
            ],
          ),
        ));
  }
}
