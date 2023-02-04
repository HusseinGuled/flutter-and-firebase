import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  final auth = FirebaseAuth.instance;

  void regist() async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: username.text, password: password.text);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.green,
          content: Text('Successfully registred')));
    } catch (err) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(backgroundColor: Colors.red, content: Text(err.toString())));
    }
  }

  void login() async {
    try {
      await auth.signInWithEmailAndPassword(
          email: username.text, password: password.text);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.green, content: Text('Successfully Logged')));
    } catch (err) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(backgroundColor: Colors.red, content: Text(err.toString())));
    }
  }

  void logout() async {
    //   FirebaseAuth.instance.signOut();
    // FirebaseUser user = FirebaseAuth.instance.currentUser;
    try {
      await auth.currentUser!.delete();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.green,
          content: Text('Coooooooooooooooooooool')));
    } catch (err) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(backgroundColor: Colors.red, content: Text(err.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('My Home Page'),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50),
              child: TextField(
                controller: username,
                decoration: InputDecoration(
                    hintText: 'Username',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder()),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50),
              child: TextField(
                controller: password,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder()),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: regist, child: Text('Register')),
                SizedBox(
                  width: 50,
                ),
                ElevatedButton(onPressed: login, child: Text('Login')),
                SizedBox(
                  width: 50,
                ),
                ElevatedButton(onPressed: logout, child: Text('Logout')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
