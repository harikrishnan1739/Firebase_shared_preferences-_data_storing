import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:peration_shade_fire/forgottenP.dart';
import 'package:peration_shade_fire/settings.dart';
import 'package:peration_shade_fire/signup.dart';

class Login extends StatefulWidget {
  const Login(BuildContext context, {super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();

  final _passwordontroller = TextEditingController();

  final password = 'flutter';
  final username = 'flutter';

  final confirmpassword = 'flutter';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 78, 183, 162),
      // ignore: avoid_unnecessary_containers
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column(
              children: [
                SafeArea(
                  child: Container(
                    width: 340,
                    child: Image.asset(
                      'assets/loginnn.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Welcome',
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.w400,
                          fontSize: 33),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _emailController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          borderSide: BorderSide(
                              width: 1, color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                        hintText: 'Email',
                        hintStyle:
                            TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Color.fromARGB(255, 0, 0, 0),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    obscureText: true,
                    controller: _passwordontroller,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          borderSide: BorderSide(
                              width: 1, color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                        hintText: 'password',
                        hintStyle:
                            TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                        prefixIcon: Icon(
                          Icons.key,
                          color: Color.fromARGB(255, 0, 0, 0),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          forgotten();
                        },
                        child: const Text(
                          'forgotten password ?',
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 300,
                  height: 45,
                  onPressed: () {
                    loginUser();
                  },
                  color: const Color.fromARGB(225, 255, 225, 164),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  child: const Text(
                    "login",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                MaterialButton(
                  minWidth: 300,
                  height: 45,
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (ctx) => Signup(context)));
                  },
                  color: const Color.fromARGB(213, 255, 255, 255),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  child: const Text(
                    "signup",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void loginUser() async {
    final email = _emailController.text;
    final password = _passwordontroller.text;

    if (email.isEmpty || password.isEmpty) {
      return show();
    } else {
      FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _emailController.text,
              password: _passwordontroller.text.trim())
          .then((value) {
        print('signin');
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (ctx) => Settings()));
      });
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
          content: const Text("something went wrong"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Login(context)));
              },
              child: const Text('close'),
            ),
          ],
        );
      },
    );
  }

  void forgotten() async {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => Forgottenpassword()));
  }
}
