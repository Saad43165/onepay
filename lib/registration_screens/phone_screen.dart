import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'otp_screen.dart'; // Ensure this import is correct

class PhoneScreen extends StatefulWidget {
  const PhoneScreen({super.key});

  @override
  _PhoneScreenState createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  String _completePhoneNumber = '';

  @override
  Widget build(BuildContext context) {
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
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(color: Colors.grey[400]),
            Text(
              "Create an account",
              style: GoogleFonts.ibmPlexSans(
                  fontSize: 23, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 10),
            Text(
              "Enter your mobile number to verify your account",
              style: GoogleFonts.nunitoSans(
                  fontSize: 13, color: Colors.grey[700]),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: IntlPhoneField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Phone',
                  hintText: 'Phone Number',
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 2, color: Colors.blue),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 2, color: Colors.blue),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(width: 2, color: Colors.blue),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                initialCountryCode: 'US',
                onChanged: (phone) {
                  setState(() {
                    _completePhoneNumber = phone.completeNumber;
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: TextFormField(
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: '*******',
                    prefixIcon: Icon(CupertinoIcons.lock, color: Colors.grey[500], size: 22),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? CupertinoIcons.eye_fill : CupertinoIcons.eye_slash_fill,
                        color: Colors.grey[500],
                        size: 20,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 2, color: Colors.blue),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 2, color: Colors.blue),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(width: 2, color: Colors.blue),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            Center(
              child: GestureDetector(
                onTap: () {
                  _showVerificationDialog(context, _completePhoneNumber);
                },
                child: Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                      "Sign up",
                      style: GoogleFonts.nunito(
                          color: Colors.grey[700], fontWeight: FontWeight.bold),
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

  void _showVerificationDialog(BuildContext context, String phoneNumber) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          contentPadding: const EdgeInsets.all(20),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/img/confo.png',
                height: 200,
              ),
              const SizedBox(height: 20),
              Text(
                "Verify Phone Number",
                style: GoogleFonts.ibmPlexSans(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "We need to verify your phone number before proceeding. Is this your number?",
                style: GoogleFonts.nunitoSans(
                  fontSize: 14,
                  color: Colors.grey[700],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                phoneNumber,
                style: GoogleFonts.nunitoSans(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OtpScreen(
                              phoneNumber: phoneNumber,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff304FFE),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        "Yes",
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[400],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        "No",
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
