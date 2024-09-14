import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'phone_screen.dart';

class LoginSignup extends StatelessWidget {
  const LoginSignup({super.key});

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Divider(
              color: Colors.grey[400],
            ),
            const SizedBox(height: 5),
            Image.asset(
              "assets/img/login.png",
              width: screenWidth * 0.7, // Responsive width (70% of screen width)
              height: screenHeight * 0.25, // Responsive height (25% of screen height)
            ),
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05, // Responsive horizontal padding (5% of screen width)
                vertical: screenHeight * 0.02, // Responsive vertical padding (2% of screen height)
              ),
              child: Column(
                children: [
                  Text(
                    'Create your',
                    style: GoogleFonts.nunitoSans(
                      fontSize: screenWidth * 0.07, // Responsive font size (7% of screen width)
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Coinpay account',
                    style: GoogleFonts.nunitoSans(
                      fontSize: screenWidth * 0.07, // Responsive font size (7% of screen width)
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Coinpay is a powerful tool that allows you to easily',
                    style: GoogleFonts.allerta(
                      fontSize: screenWidth * 0.03, // Responsive font size (3% of screen width)
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'send, receive, and track all your transactions',
                    style: GoogleFonts.allerta(
                      fontSize: screenWidth * 0.03, // Responsive font size (3% of screen width)
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),

                  // Sign up button
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PhoneScreen()),
                      );
                    },
                    child: Container(
                      height: screenHeight * 0.07, // Responsive height (7% of screen height)
                      width: screenWidth * 0.75, // Responsive width (75% of screen width)
                      decoration: BoxDecoration(
                        color: const Color(0xff304FFE),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          "Sign up",
                          style: GoogleFonts.nunito(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: screenWidth * 0.045, // Responsive font size (4.5% of screen width)
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  Container(
                    height: screenHeight * 0.07, // Responsive height (7% of screen height)
                    width: screenWidth * 0.75, // Responsive width (75% of screen width)
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: const Color(0xff304FFE),
                        width: 2.0,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Login",
                        style: GoogleFonts.nunito(
                          color: const Color(0xff304FFE),
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.045, // Responsive font size (4.5% of screen width)
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 100),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: "By continuing you accept our \n",
                          style: GoogleFonts.ibmPlexMono(
                            fontSize: screenWidth * 0.03, // Responsive font size (3% of screen width)
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: "Terms of Services",
                              style: GoogleFonts.ibmPlexMono(
                                fontSize: screenWidth * 0.03, // Responsive font size (3% of screen width)
                                color: const Color(0xff304FFE),
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            TextSpan(
                              text: " and ",
                              style: GoogleFonts.ibmPlexMono(
                                fontSize: screenWidth * 0.03, // Responsive font size (3% of screen width)
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: "Privacy Policies",
                              style: GoogleFonts.ibmPlexMono(
                                fontSize: screenWidth * 0.03, // Responsive font size (3% of screen width)
                                color: const Color(0xff304FFE),
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
