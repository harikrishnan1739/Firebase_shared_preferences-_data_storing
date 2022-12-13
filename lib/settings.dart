// ignore_for_file: avoid_init_to_null

import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';
import 'models.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late SharedPreferences pref;
  StudentModal? user = null;
  @override
  void initState() {
    interpreference();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.pink,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 208, 45, 126),
        title: const Padding(
          padding: EdgeInsets.only(left: 100.0),
          child: Text('Home'),
        ),
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (ctx) => Settings()));
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
        actions: [
          IconButton(
              onPressed: () {
                signout();
              },
              icon: const Icon(Icons.logout_outlined))
        ],
      ),
      body: user != null
          ? Padding(
            padding: const EdgeInsets.only(top:15.0),
            child: Column(
                children: [
                  Center(child: Text('username : ${user!.username}',style: TextStyle(fontWeight: FontWeight.bold),)),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(child: Text('email : ${user!.email}',style: TextStyle(fontWeight: FontWeight.bold),)),
                  const SizedBox(
                    height: 13,
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          final prefs = SharedPreferences.getInstance();
                          pref.remove('userdata');
                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                              builder: (ctx) => Login(context)));
                        },
                        icon: const Icon(Icons.delete_outline_rounded,size: 40,),
                      ),
                    ],
                  ),
                ],
              ),
          )
          : SizedBox(
              height: 10,
            ),
    );
  }

  void interpreference() async {
    pref = await SharedPreferences.getInstance();

    setState(() {
      user = StudentModal.fromJson(jsonDecode(pref.getString('userdata')!));
    });
  }

  void signout() async {
    pref.setBool('isLogin', false);
    await Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => Login(context)));
  }
}
