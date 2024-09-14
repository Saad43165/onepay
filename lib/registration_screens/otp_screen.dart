import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class OtpScreen extends StatefulWidget {
  final String phoneNumber;

  const OtpScreen({super.key, required this.phoneNumber});

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _formKey = GlobalKey<FormState>();
  String _otpCode = '';

  bool _isOtpFilled = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          const Spacer(),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04), // Responsive padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(color: Colors.grey[400]),
            Text(
              "Confirm your Phone",
              style: GoogleFonts.nunito(
                  fontSize: screenWidth * 0.06, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 10),
            Text(
              "We sent a 6-digit code to ${widget.phoneNumber}",
              style: GoogleFonts.nunitoSans(
                  fontSize: screenWidth * 0.035, color: Colors.grey[700]),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 20),

            // OTP Input Field
            Padding(
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
              child: Form(
                key: _formKey,
                child: OTPTextField(
                    length: 6,
                    width: screenWidth,
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldWidth: screenWidth * 0.12, // Responsive field width
                    fieldStyle: FieldStyle.underline,
                    outlineBorderRadius: 15,
                    style: TextStyle(fontSize: screenWidth * 0.04),
                    onChanged: (pin) {
                      print("Changed: " + pin);
                      setState(() {
                        _isOtpFilled = pin.length == 6; // Update state when OTP length is 6
                        _otpCode = pin; // Update OTP code
                      });
                    },
                    onCompleted: (pin) {
                      print("Completed: " + pin);
                      setState(() {
                        _isOtpFilled = true; // Update state when OTP is completed
                        _otpCode = pin; // Update OTP code
                      });
                    }
                ),
              ),
            ),

            // Resend Text
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Did not get a code?",
                  style: GoogleFonts.nunito(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    _resendOtpCode(context);
                  },
                  child: Text(
                    " Resend",
                    style: GoogleFonts.nunito(
                        color: Color(0xff304FFE), fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),

            // Verify Button
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: () {
                    if (_isOtpFilled) {
                      _verifyOtpCode(context, _otpCode);
                    }
                  },
                  child: Container(
                    height: screenHeight * 0.07, // Responsive height
                    width: screenWidth * 0.8, // Responsive width
                    decoration: BoxDecoration(
                      color: _isOtpFilled ? Color(0xff304FFE) : Colors.grey[400],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        "Verify OTP",
                        style: GoogleFonts.nunito(
                            color: _isOtpFilled ? Colors.white : Colors.grey[700],
                            fontWeight: FontWeight.bold,
                            fontSize: screenWidth * 0.04),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  void _verifyOtpCode(BuildContext context, String otpCode) {
    // Implement OTP verification logic here
    print("Verify OTP Code: $otpCode");
  }

  void _resendOtpCode(BuildContext context) {
    // Implement OTP resend logic here
    print("Resend OTP Code");
  }
}
