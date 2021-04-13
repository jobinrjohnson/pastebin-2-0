import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pastebin/components/logo.dart';
import 'package:pastebin/pages/home_page.dart';
import 'package:pastebin/provider/userprovider.dart';
import 'package:pastebin/services/pastebin.dart';
import 'package:provider/provider.dart';

class SigninPage extends StatefulWidget {
  SigninPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _SigninPage createState() => _SigninPage();
}

class _SigninPage extends State<SigninPage> {
  String? error;

  TextEditingController _userNameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  Widget buildForm(BuildContext context) {
    return Form(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          decoration: InputDecoration(hintText: "Username"),
          controller: _userNameController,
        ),
        SizedBox(height: 20),
        TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(hintText: "Password"),
            obscureText: true),
        SizedBox(height: 20),
        if (error != null)
          Text(error!,
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold))
      ],
    ));
  }

  _tryLogin() async {
    setState(() {
      error = null;
    });

    // await Provider.of<UserProvider>(context, listen: false).login("071ca1869fb91412cc0e5fc10cfac2d4");
    new PastebinService()
        .login(_userNameController.text, _passwordController.text)
        .then((value) async {
      await Provider.of<UserProvider>(context, listen: false).login(value);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage()),
      );
    }).onError((error, stackTrace) {
      setState(() {
        this.error = error.toString();
      });
    });
  }

  buildBottomNavigBar() {
    return Container(
        padding: EdgeInsets.all(40),
        height: 230,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                onPressed: _tryLogin,
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
              Hero(tag: "mainIcon_1", child: Logo()),
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
