import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login_signup.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          double padding = constraints.maxWidth * 0.12;
          return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: padding),
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {});
                    },
                    children: [
                      _buildPage("assets/img/home_logo.png",
                          "Trusted by millions of people, part of one part", constraints),
                      _buildPage("assets/img/logo2.png",
                          "Spend money abroad, and track your expense", constraints),
                      _buildPage("assets/img/logo3.png",
                          "Receive Money From Anywhere In The World", constraints),
                    ],
                  ),
                ),
              ),
              _buildNavigationButtons(constraints),
            ],
          );
        },
      ),
    );
  }

  Widget _buildPage(String imagePath, String pageText, BoxConstraints constraints) {
    double imageSize = constraints.maxWidth * 0.6;
    double fontSize = constraints.maxWidth * 0.06;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, width: imageSize),
          const SizedBox(height: 30),
          _buildPageIndicator(),
          const SizedBox(height: 30),
          Text(
            pageText,
            style: GoogleFonts.nunitoSans(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 6.0),
          width: 14,
          height: 14,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _pageController.hasClients && _pageController.page!.round() == index
                ? Colors.blue
                : Colors.grey,
          ),
        );
      }),
    );
  }

  Widget _buildNavigationButtons(BoxConstraints constraints) {
    double buttonWidth = constraints.maxWidth * 0.75;  // Responsive button width
    double buttonFontSize = constraints.maxWidth * 0.05;  // Responsive font size

    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: buttonWidth,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff304FFE),
                padding: const EdgeInsets.symmetric(vertical: 4.0),
              ),
              onPressed: () {
                if (_pageController.page! < 2) {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginSignup()),
                  );
                }
              },
              child: Center(
                child: Text(
                  'Next',
                  style: GoogleFonts.abyssinicaSil(
                    color: Colors.white,
                    fontSize: buttonFontSize,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
