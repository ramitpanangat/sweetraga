import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _name, _email, _password;

  checkAuthentication() async {
    _auth.authStateChanges().listen((user) async {
      if (user != null) {
        Navigator.pushReplacementNamed(context, "/");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentication();
  }

  signUp() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      try {
        UserCredential user = await _auth.createUserWithEmailAndPassword(
            email: _email, password: _password);
        if (user != null) {
          await _auth.currentUser.updateProfile(displayName: _name);
        }
      } catch (e) {
        showError(e.message);
        print(e);
      }
    }
  }

  showError(String errormessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('ERROR'),
            content: Text(errormessage),
            actions: <Widget>[
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
            Padding(
              padding: EdgeInsets.only(left: 18, bottom: 8, right: 15),
              child: Text(
                "Sign up to see our offers and buy our products.",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 18, color: Colors.grey[500]),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    child: TextFormField(
                      validator: (input) {
                        if (input.isEmpty) return "Enter Name";
                      },
                      textCapitalization: TextCapitalization.sentences,
                      decoration: InputDecoration(
                          hintText: "Name",
                          hintStyle: TextStyle(color: Colors.grey[400]),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Theme.of(context).accentColor)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(208, 171, 107, 100)))),
                      onSaved: (input) => _name = input,
                    ),
                  ),
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
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    child: MaterialButton(
                      onPressed: signUp,
                      child: Text(
                        "SIGN UP",
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
                  Navigator.pushReplacementNamed(context, "/login");
                },
                child: Text(
                  "Alread have an account? Login here.",
                  style: TextStyle(
                      color: Theme.of(context).accentColor, fontSize: 18),
                ))
          ],
        ),
      ),
    );
  }
}
