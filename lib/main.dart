
import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';


import 'home_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        accentColor: Colors.orange
      ),
      home: MyApplication(),
    );
  }
}
class MyApplication extends StatefulWidget {
 

  @override
  _MyApplicationState createState() => _MyApplicationState();
}

class _MyApplicationState extends State<MyApplication> {
  List adds = [];
  String title = '';
  double price = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    adds.add("Item1");
    adds.add("Item2");
  }


@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Testing"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(
              context: context,
              builder: (BuildContext context){
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                  ),
                  title: Text("Post Adds"),
                  content: TextField(
                    onChanged: (String value){
                      title = value;
                    },
                  ),
                  actions: [
                    FlatButton(onPressed: (){
                      setState(() {
                        adds.add(title);
                      });
                      // createAdds();

                      Navigator.of(context).pop();
                    },
                      child: Text("Add"),)
                  ],
                );

              });
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
          itemCount:adds.length,
          itemBuilder: (BuildContext context, int index){
            return Dismissible(
              onDismissed: (direction){
              },
                key: Key(adds[index]), child: Card(
                  elevation: 4,
                  margin: EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: ListTile(
                    title: Text(adds[index],),
                    trailing: IconButton(icon: Icon(Icons.delete, color: Colors.red,),
                  onPressed: (){
                    setState(() {
                      adds.removeAt(index);
                    });
                  },),
              ),
            ));

          }),
    );
  }
}

// createAdds() {
//   DocumentReference documentReference;
//   documentReference =
//       FirebaseFirestore.instance.collection("AddvertisementApplication").doc(
//           title);
//
//   Map<String, String> adds = {"addstitle": title};
//
//   documentReference.set(adds).whenComplete(() {
//     print("$title created");
//   });
// }

// deleteAdds() {
//
// }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("Testing"),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             showDialog(
//                 context: context,
//                 builder: (BuildContext context) {
//                   return AlertDialog(
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8)
//                     ),
//                     title: Text("Post Adds"),
//                     content: TextField(
//                       onChanged: (String value) {
//                         title = value;
//                       },
//                     ),
//                     actions: [
//                       FlatButton(onPressed: () {
//                         // setState(() {
//                         //   adds.add(title);
//                         // });
//                         createAdds();
//
//                         Navigator.of(context).pop();
//                       },
//                         child: Text("Add"),)
//                     ],
//                   );
//                 });
//           },
//           child: Icon(
//             Icons.add,
//             color: Colors.white,
//           ),
//         ),
//         body: StreamBuilder(stream: FirebaseFirestore.instance.collection(
//             "AddvertisementApplication").snapshots(), builder: (context,
//             snapshots) {
//           return ListView.builder(
//               itemCount: adds.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return Dismissible(
//                     onDismissed: (direction) {},
//                     key: Key(adds[index]), child: Card(
//                   elevation: 4,
//                   margin: EdgeInsets.all(8),
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(16)),
//                   child: ListTile(
//                     title: Text(adds[index],),
//                     trailing: IconButton(icon: Icon(Icons.delete, color: Colors
//                         .red,),
//                       onPressed: () {
//                         setState(() {
//                           adds.removeAt(index);
//                         });
//                       },),
//                   ),
//                 ));
//               });
//         },)
//     );
//   }
// }



