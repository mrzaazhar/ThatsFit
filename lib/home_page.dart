import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Track the selected index

  // List of widgets for each tab
  final List<Widget> _widgetOptions = <Widget>[
    Text('Home Screen'), // Replace with your Home widget
    Text('Search Screen'), // Replace with your Search widget
    Text('Back Screen'), // Replace with your Back widget
    Text('Logout Screen'), // Replace with your Logout widget
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
  }

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
        backgroundColor: Color(0xFF008000),
        actions: [
          IconButton(
            icon: Icon(Icons.person, size: 30),
            onPressed: () {
              // Handle user profile action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
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
                        width:
                            60, // Set the width of the CircularProgressIndicator
                        height:
                            60, // Set the height of the CircularProgressIndicator
                        child: CircularProgressIndicator(
                          value: 0.7, // Example value
                          backgroundColor: Colors.grey,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Color(0xFF33443c)),
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
                            child: Text('View More',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'DM Sans')),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF6e9277),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15),
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
            // New Container for Create Workout Button
            Container(
              padding: EdgeInsets.all(20),
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/JPG/workout_image.jpg'),
                    fit: BoxFit.cover),
                color: Color(0xFFbfbfbf),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.end, // Align the button to the bottom
                children: [
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle create workout action
                      },
                      child: Text('Create Workout',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'DM Sans',
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF6e9277),
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Color(0xFF008000), // Background color of the navigation bar
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: GNav(
            gap: 8,
            color: Colors.white, // Color for unselected items
            activeColor: Colors.white, // Color for selected item
            iconSize: 24,
            padding: EdgeInsets.symmetric(horizontal: 19, vertical: 5),
            duration: Duration(milliseconds: 400),
            tabBackgroundColor:
                Colors.green, // Background color for selected tab
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.search,
                text: 'Search',
              ),
              GButton(
                icon: Icons.arrow_back,
                text: 'Back',
              ),
              GButton(
                icon: Icons.logout,
                text: 'Logout',
              ),
            ],
            selectedIndex: _selectedIndex, // Set the current index
            onTabChange: (index) {
              _onItemTapped(index); // Handle tab change
            },
          ),
        ),
      ),
    );
  }
}
