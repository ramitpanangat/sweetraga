import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  FirebaseAuth _auth = FirebaseAuth.instance;
  String _email, _password;

  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user != null) {
        print(user);

        Navigator.pushReplacementNamed(context, "/");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentification();
  }

  login() async {
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      try {
        await _auth.signInWithEmailAndPassword(
            email: _email, password: _password);
      } catch (e) {
        showError(e.message);
      }
    }
  }

  showError(String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("ERROR"),
            content: Text(message),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
              child: Image.asset("assets/logo_small.png"),
            ),
            Form(
              key: _formkey,
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    child: TextFormField(
                      validator: (input) {
                        if (input.isEmpty) return "Enter Email";
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle: TextStyle(color: Colors.grey[400]),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Theme.of(context).accentColor)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(208, 171, 107, 100)))),
                      onSaved: (input) => _email = input,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    child: TextFormField(
                      obscureText: true,
                      validator: (input) {
                        if (input.length < 8)
                          return "Please enter password of minimum 8 character.";
                      },
                      decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.grey[400]),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: Theme.of(context).accentColor)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: Color.fromRGBO(208, 171, 107, 100))),
                      ),
                      onSaved: (input) => _password = input,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: MaterialButton(
                      onPressed: login,
                      child: Text(
                        "LOGIN",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      color: Theme.of(context).accentColor,
                      minWidth: MediaQuery.of(context).size.width,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      height: 60,
                      elevation: 0,
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/forgotPassword");
                },
                child: Text(
                  "Forget Password?",
                  style: TextStyle(color: Colors.grey[400]),
                )),
            TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, "/signup");
                },
                child: Text(
                  "Create new account.",
                  style: TextStyle(
                      color: Theme.of(context).accentColor, fontSize: 18),
                ))
          ],
        ),
      ),
    );
  }
}
