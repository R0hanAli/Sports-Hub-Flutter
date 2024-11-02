import 'package:flutter/material.dart';
import 'package:sports_hub/Getx/common_layout_controller.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return CommonLayout(child: SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFBf9AED),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
                child: Text(
                  'About Us',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              child: Text(
                'Meet the Team behind SportsHub',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            _buildMemberInfo(
              name: 'Rohan Ali',
              degree: 'Under Graduate in Computer Science',
              university: 'Comsats',
            ),
          ],
        ),
      ),
    ),);
  }

  Widget _buildMemberInfo({
    required String name,
    required String degree,
    required String university,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Name : ',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                  color: Colors.black,
                ),
              ),
              Text(
                name,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Roboto',
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 2),
          Row(
            children: [
              Text(
                'Degree : ',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                  color: Colors.black,
                ),
              ),
              Text(
                degree,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Roboto',
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 2),
          Row(
            children: [
              Text(
                'University : ',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                  color: Colors.black,
                ),
              ),
              Text(
                university,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Roboto',
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
