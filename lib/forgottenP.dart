import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:peration_shade_fire/login.dart';

class Forgottenpassword extends StatefulWidget {
  const Forgottenpassword({super.key});

  @override
  State<Forgottenpassword> createState() => _ForgottenpasswordState();
}

class _ForgottenpasswordState extends State<Forgottenpassword> {
  final _emailController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.only(left: 50.0),
          child: Text('Reset password'),
        ),
        backgroundColor: const Color.fromARGB(175, 64, 156, 138),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx) => Login(context)));
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
      ),
      backgroundColor:  Color.fromARGB(255, 99, 216, 193),
      body: Container(
        child: Column(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: TextFormField(
                  obscureText: false,
                  controller: _emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      borderSide: BorderSide(
                          width: 2, color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    hintText: 'Enter the email id',
                    hintStyle: TextStyle(color: Color.fromARGB(178, 0, 0, 0)),
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: Color.fromARGB(160, 0, 0, 0),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            MaterialButton(
              minWidth: 300,
              height: 45,
              onPressed: () {
                forgotton();
              },
              color:  const Color.fromARGB(255, 234, 241, 197),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)),
              child: const Text(
                "Reset password",
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> forgotton() async {
    final _email = _emailController.text;
    if (_email.isEmpty) {
      return show();
    } else {
      try {
        print('Reset password');
        await FirebaseAuth.instance
            .sendPasswordResetEmail(email: _emailController.text)
            .then((value) => Navigator.of(context).pop());
      } catch (e) {
        print('some error occured');
      }
    }
  }

  Future<void> show() async {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          title: Column(
            children: const [
              Text("Error"),
              Divider(),
            ],
          ),
          content: const Text("Empty field"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            Forgottenpassword()));
              },
              child: const Text('close'),
            ),
          ],
        );
      },
    );
  }
}
