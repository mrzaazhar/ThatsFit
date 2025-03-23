import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF008000),
        appBar: AppBar(
          title: Text(
            'Logo Here',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color(0xFF008000),
        ),
        body: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Icon(
                    Icons.person,
                    size: 100,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Muhammad Mirza',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () {},
                    child: Text('Add Photo'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      foregroundColor: Colors.white,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    )
                    ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text('  About Profile', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                ),
                Container(
                  width: double.infinity,
                  height: 150,
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 5,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                    ),
                  ),
                ),
              ], //children
            )
          )
        );
  }
}
