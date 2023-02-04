import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterUsers extends StatefulWidget {
  const RegisterUsers({super.key});

  @override
  State<RegisterUsers> createState() => _RegisterUsersState();
}

class _RegisterUsersState extends State<RegisterUsers> {
  TextEditingController fname = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController clss = TextEditingController();

  final store = FirebaseFirestore.instance;
  void save() async {
    try {
      await store.collection('teachers').add({
        'name': fname.text,
        'degmo': address.text,
        'sanadka': age.text,
        'fasal': clss.text,
        'tell': 2345467,
        'status': 'single',
        'level': 'Degree'
      });
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //     backgroundColor: Colors.green, content:
      //     Text('Successfully saved')));
      print('waa la xareeyey');
    } catch (err) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(backgroundColor: Colors.red, content: Text(err.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Users'),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 60),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50),
              child: TextField(
                controller: fname,
                decoration: InputDecoration(
                    hintText: 'FullName', border: OutlineInputBorder()),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50),
              child: TextField(
                controller: age,
                decoration: InputDecoration(
                    hintText: 'Age', border: OutlineInputBorder()),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50),
              child: TextField(
                controller: address,
                decoration: InputDecoration(
                    hintText: 'Address', border: OutlineInputBorder()),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50),
              child: TextField(
                controller: clss,
                decoration: InputDecoration(
                    hintText: 'Class', border: OutlineInputBorder()),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: save, child: Text('Save')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
