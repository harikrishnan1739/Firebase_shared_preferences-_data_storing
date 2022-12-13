import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:peration_shade_fire/models.dart';
import 'package:peration_shade_fire/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';

class Signup extends StatefulWidget {
  const Signup(BuildContext context, {super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _usernameController = TextEditingController();

  final _emailController = TextEditingController();

  final _passwordontroller = TextEditingController();

  final _cofirmpasswordController = TextEditingController();

  late SharedPreferences pref;

  @override
  void initState() {
    setdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      // ignore: avoid_unnecessary_containers
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Center(
              child: Column(
                children: [
                  SafeArea(
                    child: AppBar(
                      backgroundColor: Colors.transparent,
                      leading: IconButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (ctx) => Login(context)));
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.black,
                          )),
                      elevation: 0,
                      title: const Text(
                        'Signup',
                        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),
                  ),
                  SafeArea(
                    child: Container(
                      width: 270,
                      child: Image.asset(
                        'assets/signunnn.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Come With Us',
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.w300,
                            fontSize: 27),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          borderSide: BorderSide(
                              width: 1, color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                        hintText: 'Username',
                        hintStyle:
                            TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
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
                          prefixIcon: const Icon(
                            Icons.email,
                            color: Color.fromARGB(255, 0, 0, 0),
                          )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
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
                          prefixIcon: const Icon(
                            Icons.key,
                            color: Color.fromARGB(255, 0, 0, 0),
                          )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      obscureText: true,
                      controller: _cofirmpasswordController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            borderSide: BorderSide(
                                width: 1, color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                          hintText: 'confirm password',
                          hintStyle:
                              TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                          prefixIcon: const Icon(
                            Icons.password,
                            color: Color.fromARGB(255, 0, 0, 0),
                          )),
                    ),
                  ),
                  const SizedBox(height:10,),
                  MaterialButton(
                    minWidth: 300,
                    height: 45,
                    onPressed: () {
                      Signup1();
                    },
                    color: const Color.fromARGB(255, 86, 49, 236),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    child: const Text(
                      "signup",
                      style: TextStyle(
                        color: Colors.white,
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
      ),
    );
  }

  Future<void> Signup1() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final user = StudentModal(
        userId: DateTime.now().millisecondsSinceEpoch.toString(),
        username: _usernameController.text,
        email: _emailController.text,
        password: _passwordontroller.text,
        confirmpassword: _cofirmpasswordController.text);

    String jasonstring = jsonEncode(user);
    pref.setString('userdata', jasonstring);
    pref.setBool('isLogin', true);

    final username = _usernameController.text;
    final email = _emailController.text;
    final password = _passwordontroller.text;
    final confirmpassword = _cofirmpasswordController.text;

    if (username.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmpassword.isEmpty) {
      return show();
    } else if (password != confirmpassword) {
      return passworderror();
    } else {
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _emailController.text, password: _passwordontroller.text)
          .then((value) => {
                print('create'),
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (ctx) => const Settings())),
              });
    }
  }

  Future<void> setdata() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
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
          content: const Text("field is Empty"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Signup(context)));
                Navigator.pop(ctx);
              },
              child: const Text('close'),
            ),
          ],
        );
      },
    );
  }

  void passworderror() {
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
          content: const Text("password does't mateched"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Signup(context)));
                Navigator.pop(ctx);
              },
              child: const Text('close'),
            ),
          ],
        );
      },
    );
  }
}
