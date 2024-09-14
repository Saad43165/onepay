import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  List<DateTime> _dates = [DateTime.now()]; // Initialize with the current date

  final TextEditingController _nameController = TextEditingController(); // Controller for the Full Name field
  final TextEditingController _usernameController = TextEditingController(); // Controller for the Username field
  final TextEditingController _dobController = TextEditingController(); // Controller for the Date of Birth field

  @override
  void initState() {
    super.initState();
    _dobController.text = _formatDate(_dates.first); // Set default text
    // Listeners to detect changes in text fields
    _nameController.addListener(_updateButtonState);
    _usernameController.addListener(_updateButtonState);
    _dobController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _usernameController.dispose();
    _dobController.dispose();
    super.dispose();
  }

  bool _isButtonEnabled() {
    return _nameController.text.isNotEmpty &&
        _usernameController.text.isNotEmpty &&
        _dobController.text.isNotEmpty;
  }

  void _updateButtonState() {
    setState(() {}); // Refresh the UI to update button state
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

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
          Divider(color: Colors.grey[400]),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            child: Text(
              'Add your personal info',
              style: GoogleFonts.nunitoSans(
                fontSize: screenWidth * 0.06, // Responsive font size
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.01),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            child: Text(
              'This info needs to be accurate with your ID documents',
              style: GoogleFonts.nunitoSans(
                fontSize: screenWidth * 0.04, // Responsive font size
                color: Colors.grey[700],
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            child: TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Full Name',
                hintText: 'Saad Ikram',
                labelStyle: GoogleFonts.nunito(
                  color: Colors.black,
                  fontSize: screenWidth * 0.05, // Responsive font size
                ),
                hintStyle: GoogleFonts.nunito(
                  color: Colors.grey[400],
                  fontSize: screenWidth * 0.04, // Responsive font size
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10), // Optional: Adjust the radius if needed
                ),
                contentPadding: EdgeInsets.symmetric(vertical: screenHeight * 0.02, horizontal: screenWidth * 0.04), // Adjust padding to position text at the top
                isDense: true, // Reduces the vertical height of the field
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            child: TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                hintText: '@username',
                labelStyle: GoogleFonts.nunito(
                  color: Colors.black,
                  fontSize: screenWidth * 0.05, // Responsive font size
                ),
                hintStyle: GoogleFonts.nunito(
                  color: Colors.grey[400],
                  fontSize: screenWidth * 0.04, // Responsive font size
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10), // Optional: Adjust the radius if needed
                ),
                contentPadding: EdgeInsets.symmetric(vertical: screenHeight * 0.02, horizontal: screenWidth * 0.04), // Adjust padding to position text at the top
                isDense: true, // Reduces the vertical height of the field
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            child: GestureDetector(
              onTap: () async {
                DateTime? pickedDate = await _showDatePicker(context);
                if (pickedDate != null && pickedDate != _dates.first) {
                  setState(() {
                    _dates = [pickedDate];
                    _dobController.text = _formatDate(pickedDate);
                  });
                }
              },
              child: AbsorbPointer(
                child: TextFormField(
                  controller: _dobController,
                  decoration: InputDecoration(
                    labelText: 'Date of Birth',
                    hintText: 'Select Date',
                    labelStyle: GoogleFonts.nunito(
                      color: Colors.black,
                      fontSize: screenWidth * 0.05, // Responsive font size
                    ),
                    hintStyle: GoogleFonts.nunito(
                      color: Colors.grey[400],
                      fontSize: screenWidth * 0.04, // Responsive font size
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10), // Optional: Adjust the radius if needed
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: screenHeight * 0.02, horizontal: screenWidth * 0.04), // Adjust padding to position text at the top
                    isDense: true, // Reduces the vertical height of the field
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.34),
          Center(
            child: Container(
              height: screenHeight * 0.07, // Responsive height (7% of screen height)
              width: screenWidth * 0.75, // Responsive width (75% of screen width)
              decoration: BoxDecoration(
                color: _isButtonEnabled() ? const Color(0xff304FFE) : Colors.grey[400], // Change color based on field state
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: Text(
                  "Continue",
                  style: GoogleFonts.nunito(
                    color: _isButtonEnabled() ? Colors.white : Colors.grey[700],
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.045, // Responsive font size (4.5% of screen width)
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<DateTime?> _showDatePicker(BuildContext context) async {
    return showDialog<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 2,
          actionsOverflowDirection: VerticalDirection.down,
          backgroundColor: Colors.white,
          title: const Text('Select Date'),
          content: SizedBox(
            height: MediaQuery.of(context).size.height * 0.4, // Adjust height as needed
            width: MediaQuery.of(context).size.width * 0.9, // Adjust width as needed
            child: CalendarDatePicker2(
              config: CalendarDatePicker2Config(),
              value: _dates,
              onValueChanged: (dates) {
                setState(() {
                  _dates = dates; // Update dates
                });
              },
            ),
          ),
          actions: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06, // Adjust height as needed
              width: MediaQuery.of(context).size.width * 0.85,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff304FFE),
                ),
                child: Text(
                  'Confirm',
                  style: GoogleFonts.nunitoSans(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width * 0.045,
                  ),
                ),
                onPressed: () {
                  // Ensure the date is not empty
                  Navigator.of(context).pop(_dates.isNotEmpty ? _dates.first : null);
                },
              ),
            ),
          ],
        );
      },
    ).then((selectedDate) {
      // If a date was selected, update the controller
      if (selectedDate != null) {
        setState(() {
          _dates = [selectedDate];
          _dobController.text = _formatDate(selectedDate); // Update the text field with the selected date
        });
      }
    });
  }

  String _formatDate(DateTime date) {
    // Format the date as needed
    return '${date.day}/${date.month}/${date.year}';
  }

}
