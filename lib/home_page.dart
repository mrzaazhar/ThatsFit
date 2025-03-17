import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF008000), // Background color
      appBar: AppBar(
        title: Text(
          'ThatsFit',
          style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'DM Sans'),
        ),
        backgroundColor: Colors.grey,
        actions: [
          IconButton(
            icon: Icon(Icons.person, size: 30),
            onPressed: () {
              // Handle user profile action
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Step Count Section
            Container(
              padding: EdgeInsets.all(20),
              width: 300,
              decoration: BoxDecoration(
                color: Color(0xFFbfbfbf),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text(
                    'Step Count',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'DM Sans'),
                  ),
                  SizedBox(height: 10),
                  // Row for CircularProgressIndicator and other elements
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 60, // Set the width of the CircularProgressIndicator
                        height: 60, // Set the height of the CircularProgressIndicator
                        child: CircularProgressIndicator(
                          value: 0.7, // Example value
                          backgroundColor: Colors.grey,
                          valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF33443c)),
                          strokeWidth: 10,
                        ),
                      ),
                      SizedBox(
                          width:
                              20), // Space between the progress indicator and text
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextButton(
                            onPressed: () {
                              // Handle view more action
                            },
                            child: Text('View More', style: TextStyle(color: Colors.black,fontFamily: 'DM Sans')),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF6e9277),
                              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Create Workout Button
            ElevatedButton(
              onPressed: () {
                // Handle create workout action
              },
              child: Text('Create Workout'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
            ),
            SizedBox(height: 20),
            // Image Section
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/workout_image.png'), // Add your workout image here
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


