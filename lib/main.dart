// ignore_for_file: prefer_const_constructors
import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'signup_page.dart';
import 'home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyD_PDq9iaXGI8IlESo0z_BordVSpP7xGX4",
            authDomain: "thatsfit-37425.firebaseapp.com",
            projectId: "thatsfit-37425",
            storageBucket: "thatsfit-37425.firebasestorage.app",
            messagingSenderId: "421858940260",
            appId: "1:421858940260:web:29bd32970fdb48e1d75671"));
  } else {
    await Firebase.initializeApp();
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Page',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  // Define the controllers here
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage(
                'assets/PNG/background.png'), // Add your background image here
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            // Upper half for background image
            Expanded(
              flex: 1, // This takes half of the screen
              child: Container(),
            ),
            // Lower half for the card
            Expanded(
              flex: 0, // This takes the other half of the screen
              child: Container(
                margin: EdgeInsets.zero, // Remove any margin
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30)), // Rounded top corners
                  ),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'aileron',
                          ),
                        ),
                        SizedBox(height: 20),
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
                        SizedBox(height: 10),
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
                        ElevatedButton(
                          onPressed: () {
                            _login(context);
                          },
                          child: Text(
                            'Log In',
                            style: TextStyle(
                              fontSize: 11,
                              fontFamily: 'DM Sans',
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF6e9277), // Button color
                            padding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 15),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SignUpPage()), // Navigate to SignUpPage
                            );
                          },
                          child: Text(
                            'SIGN UP HERE!',
                            style: TextStyle(
                              fontSize: 10,
                              fontFamily: 'DM Sans',
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextButton(
                          onPressed: () {
                            // Handle forgot password action
                          },
                          child: Text(
                            'FORGOT PASSWORD?',
                            style: TextStyle(
                              fontSize: 9.3,
                              fontFamily: 'DM Sans',
                              color: Colors.grey,
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

  Future<void> _login(BuildContext context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      // Navigate to the home page after successful login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } on FirebaseAuthException catch (e) {
      // Handle error
      print(e.message);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message ?? 'Login failed')));
    }
  }
}
