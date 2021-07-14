import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      drawer: Drawer(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Drawer Opened'),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.teal.shade100,
      appBar: AppBar(
        title: Text('I am rich'),
        backgroundColor: Colors.teal[900],
        toolbarHeight: 70,
      ),
      body: Center(
        child: Container(
          /*image: NetworkImage('https://scontent.fdac24-1.fna.fbcdn.net/v/t1.6435-0/p526x296/201808723_173268974767497_6187156456108613786_n.jpg?_nc_cat=108&ccb=1-3&_nc_sid=730e14&_nc_ohc=Ca8QZwAvQNsAX9lyFbG&_nc_ht=scontent.fdac24-1.fna&tp=6&oh=8807b0d862a1e34d5ff5dd7c97c36f44&oe=60DCB324'),*/
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: AssetImage('assets/images/diamond.png'),
              fit: BoxFit.fill,
            )
          )


        ),
      ),
    ),
  ));
}
