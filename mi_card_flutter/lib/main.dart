import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        /*appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text(
            'Demo',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),*/
        backgroundColor: Colors.teal,
        body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 50.0,
                  backgroundColor: Colors.red,
                  backgroundImage: AssetImage('images/mark-antony.jpg'),
                ),
                Text(
                  'Marc Antony',
                  style: TextStyle(
                      fontSize: 40.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Pacifico'),
                ),
                Text(
                  'TRIUMVIRATE OF THE REPUBLIC',
                  style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.teal.shade100,
                      letterSpacing: 2.5,
                      fontFamily: 'SansProReg',
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20.0,
                  child: Divider(
                    color: Colors.teal.shade100,
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: (
                        Icon(
                          Icons.phone,
                          color: Colors.teal,
                        )
                    ),
                    title: Text(
                      '+00 123 456 789',
                      style: TextStyle(
                          color: Colors.teal.shade900,
                          fontFamily: 'SansProReg',
                          fontSize: 20.0
                      ),
                    ),
                  )
                ),
                Card(
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: (
                        Icon(
                          Icons.email,
                          color: Colors.teal,
                        )
                    ),
                    title: Text(
                      'marcus.antonius@spqr.com',
                      style: TextStyle(
                          color: Colors.teal.shade900,
                          fontFamily: 'SansProReg',
                          fontSize: 20.0
                      ),
                    ),
                  )
                )
              ],
        )),
        /*floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.teal,
          child: Icon(Icons.add),
        ),*/
      ),
    );
  }
}

