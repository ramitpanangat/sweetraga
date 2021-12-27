import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController _textEditingController = TextEditingController();

  sentDialog() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text(
                  "Password reset link has been sent to ${_textEditingController.text}",
                  style: Theme.of(context).textTheme.bodyText1),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pushNamed(context, "/login"),
                    child: Text(
                      "Ok",
                      style: TextStyle(color: Theme.of(context).accentColor),
                    ))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: Text(
                    "Enter email address.",
                    style: TextStyle(
                        color: Theme.of(context).accentColor, fontSize: 18),
                  ),
                ),
                TextFormField(
                  controller: _textEditingController,
                  validator: (input) {
                    if (input.isEmpty) return "Enter Email";
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(color: Theme.of(context).accentColor)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(208, 171, 107, 100)))),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: MaterialButton(
                    onPressed: () {
                      _auth.sendPasswordResetEmail(
                          email: _textEditingController.text);
                      sentDialog();
                    },
                    child: Text(
                      "Confirm",
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
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                      onPressed: () => Navigator.pushNamed(
                            context,
                            "/login",
                          ),
                      child: Text(
                        "Return to Login",
                        style: TextStyle(color: Colors.grey[400], fontSize: 18),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
