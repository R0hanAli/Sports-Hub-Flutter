import 'package:flutter/material.dart';
import 'package:sports_hub/Getx/common_layout_controller.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFFBf9AED),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(
                  child: Text(
                    'Contact Us',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                child: Text(
                  'Get In Touch :',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Have questions, feedback, or need assistance? We\'re here to help! Reach out to us through any of the following channels:',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 13,
                    color: Colors.black,
                  ),
                ),
              ),
              ContactPerson(
                studentName: 'Rohan',
                email: 'Rohan@Email.com',
              ),
              Divider(color: Colors.black, thickness: 0.6),
              ContactPerson(
                studentName: 'Rohan',
                email: 'Rohan@Email.com',
              ),
              Divider(color: Colors.black, thickness: 0.6),
              ContactPerson(
                studentName: 'Rohan',
                email: 'Rohan@Email.com',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContactPerson extends StatelessWidget {
  final String studentName;
  final String email;

  const ContactPerson(
      {Key? key, required this.studentName, required this.email})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 18.0),
      child: Row(
        children: [
          Text(
            'Student : ',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 13,
              color: Colors.black,
            ),
          ),
          Text(
            studentName,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(width: 20.0),
          Text(
            'Email : ',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 13,
              color: Colors.black,
            ),
          ),
          Text(
            email,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
