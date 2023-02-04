import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GetData extends StatefulWidget {
  GetData({super.key});

  @override
  State<GetData> createState() => _GetDataState();
}

class _GetDataState extends State<GetData> {
  // Future<List<Map>> getData() {
  List<Widget> screens = [Text('data1'), Text('data2'), Text('data3')];
  int index = 0;
  var data = FirebaseFirestore.instance.collection('teachers').snapshots();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Get Data'),
          bottom:  TabBar(tabs: []),
        ),
        // body: StreamBuilder(
        //     stream: data,
        //     builder: ((context, snapshot) {
        //       if (snapshot.hasData) {
        //         var data = snapshot.data!.docs;
        //         return ListView.builder(
        //             itemCount: data.length,
        //             itemBuilder: ((context, index) {
        // return Row(
        //   children: [
        //     Text(data[index]['name']),
        //     Text(data[index]['sanadka']),
        //     Text(data[index]['fasal']),
        //   ],
        // );
        //               return Center(child: Text(data[index]['name']));
        //             }));
        //       } else if (snapshot.hasError) {
        //         return Center(child: Text(snapshot.error.toString()));
        //       }
        //       return Center(child: CircularProgressIndicator());
        //     })),

        // body: FutureBuilder(
        //     future: getData(),
        //     builder: ((context, AsyncSnapshot snapshot) {
        //       if (snapshot.hasData) {
        //         var keyd = snapshot.data;
        //         return ListView.builder(itemBuilder: ((context, index) {
        //           return Text(keyd[index]['name']);
        //         }));
        //       } else if (snapshot.hasError) {
        //         return Text(snapshot.error.toString());
        //       }
        //       return Center(child: CircularProgressIndicator());
        //     })),
        bottomNavigationBar: BottomNavigationBar(
          
            onTap: (value) {
              index = value;
              setState(() {});
            },
            currentIndex: index,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.abc_outlined,
                  ),
                  label: 'About'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'Settings'),
            ]),
        body: TabBarView(children: [
          Text('data')
        ]),
      ),
    );
  }
}
