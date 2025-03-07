import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_ordering_app/screens/login_screen.dart';

import 'verification_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();

  //   // Adding listener to the country code TextField
  //   _countryCodeController.addListener(() {
  //     if (_countryCodeController.text.isNotEmpty &&
  //         !_countryCodeController.text.startsWith('+')) {
  //       _countryCodeController.text = '+' + _countryCodeController.text;
  //       _countryCodeController.selection = TextSelection.fromPosition(
  //         TextPosition(offset: _countryCodeController.text.length),
  //       );
  //     }
  //   });
  // }

  @override
  void dispose() {
    // _countryCodeController.dispose();
    _mobileNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get screen height and width
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.green,
      body: SingleChildScrollView(
        // Wrapping the body in SingleChildScrollView
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align everything to the left
          children: [
            SizedBox(height: 60),
            Container(
              height:
                  screenHeight *
                  0.79, // Set container height to 80% of screen height
              width: screenWidth, // Set container width to screen width
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
              ),
              padding: const EdgeInsets.all(
                20,
              ), // Add padding inside the container
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment
                        .start, // Align text inside the container to the left
                children: [
                  Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Welcome please create your account using \n email address",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "User Name",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  // Mobile number input field
                  TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      hintText: "User Name",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Email Address",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  // Mobile number input field
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: "Email Address",
                      border: OutlineInputBorder(),
                      // contentPadding: EdgeInsets.symmetric(
                      //   horizontal: 15,
                      //   vertical: 10,
                      // ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Mobile Number",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  // Mobile number input field
                  TextField(
                    controller: _mobileNumberController,
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      FilteringTextInputFormatter
                          .digitsOnly, // Allows only digits
                      LengthLimitingTextInputFormatter(
                        10,
                      ), // Manually limit to 10 characters
                    ],
                    decoration: InputDecoration(
                      hintText: "Enter your mobile number",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                    ),
                  ),

                  SizedBox(height: 30),
                  Center(
                    child: ElevatedButton(
                      onPressed:
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VerificationScreen(),
                            ),
                          ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 150,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(color: Colors.white, width: 1),
                        ),
                      ),
                      child: const Text(
                        "Sign up",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                ),
                GestureDetector(
                  onTap:
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      ),
                  child: Text(
                    "Sign In ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Facebook SVG inside a circle
                GestureDetector(
                  onTap: () {
                    // Handle Facebook sign-in
                  },
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white, // Background color for the circle
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      'assets/images/facebook.svg', // Path to your Facebook SVG
                      height: 40,
                      width: 40,
                    ),
                  ),
                ),
                SizedBox(width: 30),
                // Google SVG inside a circle
                GestureDetector(
                  onTap: () {
                    // Handle Google sign-in
                  },
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white, // Background color for the circle
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      'assets/images/google.svg', // Path to your Google SVG
                      height: 40,
                      width: 40,
                    ),
                  ),
                ),
                SizedBox(width: 30),
                // Apple SVG inside a circle
                GestureDetector(
                  onTap: () {
                    // Handle Apple sign-in
                  },
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white, // Background color for the circle
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      'assets/images/apple.svg', // Path to your Apple SVG
                      height: 40,
                      width: 40,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
