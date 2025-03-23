// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signUp(BuildContext context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      // Navigate to the login page or home page after successful sign-up
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // Handle error
      print(e.message);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message ?? 'Sign-up failed')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage('assets/PNG/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Expanded(
              flex: 0,
              child: Container(
                margin: EdgeInsets.zero,
                height: 550,
                width: 500,
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                  ),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.all(30),
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'aileron'),
                          ),
                        ),
                        SizedBox(height: 10),
                        // Email Field
                        TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(
                              fontFamily: 'DM Sans',
                            ),
                            filled: true, // Enable fill color
                            fillColor: Color(0xFFE0E0E0), // Set fill color
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(20), // Circular border
                              borderSide: BorderSide.none, // Remove border line
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        // Password Field
                        TextField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              fontFamily: 'DM Sans',
                            ),
                            filled: true, // Enable fill color
                            fillColor: Color(0xFFE0E0E0), // Set fill color
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(20), // Circular border
                              borderSide: BorderSide.none, // Remove border line
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        // Name Field
                        TextField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            labelText: 'Name',
                            labelStyle: TextStyle(
                              fontFamily: 'DM Sans',
                            ),
                            filled: true, // Enable fill color
                            fillColor: Color(0xFFE0E0E0), // Set fill color
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(20), // Circular border
                              borderSide: BorderSide.none, // Remove border line
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        // Username Field
                        TextField(
                          controller: _usernameController,
                          decoration: InputDecoration(
                            labelText: 'Username',
                            labelStyle: TextStyle(
                              fontFamily: 'DM Sans',
                            ),
                            filled: true, // Enable fill color
                            fillColor: Color(0xFFE0E0E0), // Set fill color
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(20), // Circular border
                              borderSide: BorderSide.none, // Remove border line
                            ),
                          ),
                        ),
                        // Sign Up Button
                        Container(
                          margin: EdgeInsets.all(20),
                          child: ElevatedButton(
                            onPressed: () {
                              _signUp(context);
                            },
                            child: Text('Sign Up', style: TextStyle(fontSize: 11, fontFamily: 'DM Sans', color: Colors.white),),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF6e9277), // Button color
                              padding: EdgeInsets.symmetric(
                                horizontal: 40,
                                vertical: 10,
                              ),  
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
