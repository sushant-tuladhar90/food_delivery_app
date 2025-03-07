import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_ordering_app/screens/main_screen.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  // Create controllers for the 4 verification code input fields
  final TextEditingController _codeController1 = TextEditingController();
  final TextEditingController _codeController2 = TextEditingController();
  final TextEditingController _codeController3 = TextEditingController();
  final TextEditingController _codeController4 = TextEditingController();

  // Focus nodes to control the focus on the text fields
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();
  final FocusNode _focusNode4 = FocusNode();

  @override
  void dispose() {
    // Dispose the controllers and focus nodes when the screen is disposed
    _codeController1.dispose();
    _codeController2.dispose();
    _codeController3.dispose();
    _codeController4.dispose();
    _focusNode2.dispose();
    _focusNode3.dispose();
    _focusNode4.dispose();
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60),
            Container(
              height: screenHeight * 0.8,
              width: screenWidth,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_back,
                      size: 25,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Verification",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "We will send one-time password on this mobile number +977-9812345678",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 30),

                  // Verification code input fields
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildVerificationCodeField(
                        _codeController1,
                        _focusNode2,
                      ),
                      SizedBox(width: 10),
                      _buildVerificationCodeField(
                        _codeController2,
                        _focusNode3,
                      ),
                      SizedBox(width: 10),
                      _buildVerificationCodeField(
                        _codeController3,
                        _focusNode4,
                      ),
                      SizedBox(width: 10),
                      _buildVerificationCodeField(_codeController4, null),
                    ],
                  ),
                  SizedBox(height: 20),

                  // Verify button
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        _showLoadingDialog(context); // Show the loading dialog
                      },
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
                        "Verify",
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

            // Resend code option
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Didn't receive a code? ",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                ),
                Text(
                  "Resend",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Function to build individual verification code fields
  Widget _buildVerificationCodeField(
    TextEditingController controller,
    FocusNode? nextFocusNode,
  ) {
    return SizedBox(
      width: 50,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1, // Limit to 1 character per field
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly, // Only digits
        ],
        focusNode: nextFocusNode,
        onChanged: (value) {
          // If the current field has a value, move focus to the next field
          if (value.length == 1 && nextFocusNode != null) {
            FocusScope.of(context).requestFocus(nextFocusNode);
          }
        },
        decoration: InputDecoration(
          counterText: "", // Remove the counter text
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        ),
      ),
    );
  }

  // Function to show a loading dialog for 2-3 seconds
  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible:
          false, // Prevent closing the dialog by tapping outside
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                  strokeWidth: 3.0,
                ),
                SizedBox(height: 15),
                Text(
                  "Please wait",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

    // Close the dialog after 2 seconds
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MainScreen(),
        ), // Replace with your target screen
      );
      // Dismiss the loading dialog
    });
  }
}
