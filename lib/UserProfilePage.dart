import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => UserProfileState();
}

class UserProfileState extends State<UserProfilePage> {
  final double coverHeight = 100;
  final double profileHeight = 80;

  @override
  Widget build(BuildContext context) {
    final top = coverHeight - profileHeight / 2;

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("My Profile",
                  style: TextStyle(
                      color: Colors.transparent,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      decoration:
                          TextDecoration.combine([TextDecoration.underline]),
                      shadows: [
                        Shadow(color: Colors.black, offset: Offset(0, -4))
                      ],
                      decorationColor: Color(0xFF8E24AA),
                      decorationThickness: 2.0)),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    // Adjust the left padding for space
                    child: Text("Invite Friends",
                        style:
                            TextStyle(color: Color(0xFF8E24AA), fontSize: 14)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    // Adjust the left padding for space
                    child: Icon(Icons.notifications,
                        color: Colors.black), // Add color to the icon
                  ),
                ],
              ),
            ],
          )),
      body: SingleChildScrollView(
          child : Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              buildCoverImage(),
              Positioned(top: top, child: buildProfileImage())
            ],
          ),
          SizedBox(height: 50),
          Column(
            children: [
              Text("Priyanka satim",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16)),
              SizedBox(height: 4),
              Text("last login 23 Dec 2023 01:00pm",
                  style: TextStyle(color: Colors.grey, fontSize: 12))
            ],
          ),
          SizedBox(height: 12),
          Column(
            children: [
              const Row(
                children: [
                  Expanded(
                      flex: 5,
                      child: Padding(
                          padding: EdgeInsets.only(
                              left: 18, right: 0, top: 8, bottom: 8),
                          // Adjust the padding as needed
                          child: Text("Personal Details",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 14)))),
                  Expanded(
                      child: Padding(
                          padding: EdgeInsets.only(right: 18.0),
                          child: Text("Edit info",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF8E24AA),
                                  fontSize: 12)))),
                ],
              ),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0), // Set your desired border radius
                    color: Colors.white,
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 18.0),
                  child: Column(children: [
                    buildRow("Date Of Birth", "03 March 2022"),
                    buildRow("Phone No", "535435543"),
                    buildRow("E-mail", "example@email.com"),
                    buildRow("Gender", "Female"),
                    buildRow("Country", "India"),
                  ])),
              SizedBox(height: 20),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                      // Adjust the padding as needed
                      child: Text(
                        "Utilities",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 14),
                        textAlign: TextAlign.left,
                      ))),
              SizedBox(height: 8.0), // Right padding

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0), // Set your desired border radius
                  color: Colors.white,
                ),
                margin: EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(children: [
                  buildRowUtilities("About us", "assets/about.png"),
                  buildRowUtilities("Rate us", "assets/rate_us.png"),
                  buildRowUtilities(
                      "Contact Support", "assets/contact-support.png"),
                  buildRowUtilities("Logout", "assets/logout.png"),
                ]))
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(16),
              color: Colors.transparent,
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Designed by heyrahul03',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    'version - 1.0.1',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          )
        ]
          )
      ),
    );
  }

  Widget buildCoverImage() => Container(
      child: Opacity(opacity: 0.5, child: Image.asset('assets/images.jpeg')));

  Widget buildProfileImage() => CircleAvatar(
        radius: profileHeight / 2,
        backgroundColor: Colors.grey.shade800,
        backgroundImage: AssetImage('assets/iv_profile.png'),
      );

  Widget buildRowUtilities(String label, String icon) {
    double statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
        padding: EdgeInsets.only(top: statusBarHeight), // Add padding for status bar
        child: Padding(
            padding: EdgeInsets.only(left: 8.0,right: 8.0),
            // Adjust the padding as needed
            child: Column(children: [
              SizedBox(height: 12.0),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Left padding
                    ImageIcon(
                      AssetImage(icon),
                      color: Colors.grey.shade700,
                      size: 16,
                    ),
                    SizedBox(width: 8.0),
                    // Add some space between the icon and text
                    Text(
                      label,
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    // Right padding
                  ],
                ),
              ),
              SizedBox(height: 12.0),
              if (label != "Logout")
                Divider(
                  color: Colors.grey,
                  // Set your desired divider color
                  height: 0.5,

                )
            ])));
  }
}

Widget buildRow(String label, String value) {
  return  Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 12.0, right: 12.0, top: 12, bottom: 12),
                    child: Text(
                      label,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          value,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 12),
                        )),
                  ),
                ),
              ],
            ),
            if (label != "Country")
              Divider(
                color: Colors.grey, // Set your desired divider color
                height: 1, // Set your desired divider height
                indent: 8.0, // Set the space before the start of the divider
                endIndent: 8.0, // Set the space after the end of the divider
              ),
          ],
      );
}
