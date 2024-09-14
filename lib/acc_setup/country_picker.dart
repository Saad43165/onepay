import 'package:fintech/acc_setup/info_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:google_fonts/google_fonts.dart';

class CountryPicker extends StatefulWidget {
  const CountryPicker({super.key});

  @override
  State<CountryPicker> createState() => _CountryPickerState();
}

class _CountryPickerState extends State<CountryPicker> {
  final TextEditingController _countryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(CupertinoIcons.chevron_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(
            color: Colors.grey[400],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 5),
            child: Text(
              'Country of Residence',
              style: GoogleFonts.nunitoSans(
                fontSize: screenWidth * 0.06, // Responsive font size
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.001),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 5),
            child: Text(
              'This info needs to be accurate with your ID documents',
              style: GoogleFonts.nunitoSans(
                fontSize: screenWidth * 0.04, // Responsive font size
                color: Colors.grey[700],
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          GestureDetector(
            onTap: () {
              _showCountryPicker();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 5),
              child: AbsorbPointer(
                child: TextFormField(
                  controller: _countryController,
                  decoration: InputDecoration(
                    labelText: 'Country',
                    labelStyle: GoogleFonts.nunito(
                      fontSize: screenWidth * 0.04, // Responsive font size
                    ),
                    border: const OutlineInputBorder(),
                    suffixIcon: const Icon(Icons.arrow_drop_down),
                  ),
                ),
              ),
            ),
          ),
          const Spacer(), // Pushes the button to the bottom
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const InfoScreen(),
                  ),
                );
              },
              child: Container(
                height: screenHeight * 0.07, // Responsive height
                width: screenWidth * 0.8, // Responsive width
                decoration: BoxDecoration(
                  color: const Color(0xff304FFE), // Background color
                  borderRadius: BorderRadius.circular(30), // Rounded corners
                ),
                child: Center(
                  child: Text(
                    'Continue',
                    style: GoogleFonts.nunito(
                      color: Colors.white,
                      fontSize: screenWidth * 0.04, // Responsive font size
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.03), // Spacing at the bottom
        ],
      ),
    );
  }

  void _showCountryPicker() {
    showCountryPicker(
      context: context,
      showPhoneCode: false, // Optionally show phone code
      onSelect: (Country country) {
        setState(() {
          _countryController.text = '${country.flagEmoji} ${country.name}';
        });
      },
    );
  }
}
