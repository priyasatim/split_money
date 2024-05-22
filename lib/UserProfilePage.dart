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
      backgroundColor: Colors.white,
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
                      shadows: const [
                        Shadow(color: Colors.black, offset: Offset(0, -4))
                      ],
                      decorationColor: Color(0xFF8E24AA),
                      decorationThickness: 2.0)),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0, right: 8.0),
                    // Adjust the left padding for space
                    child: Text("Invite Friends",
                        style:
                            TextStyle(color: Color(0xFF8E24AA), fontSize: 14)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
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
          const Column(
            children: [
              Text("Priyanka satim",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16)),
              Text("Priyasatim778@gmail.com",
                  style: TextStyle(color: Colors.grey, fontSize: 12))
            ],
          ),
          Column(
            children: [
              SizedBox(height: 18.0),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0), // Set your desired border radius
                    color: Colors.white,
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 18.0),
                  child: Column(children: [
                    buildRowUtilities("Profile Information","assets/user.png"),
                    buildRowUtilities("Manage Devices","assets/smartphone.png"),
                    buildRowUtilities("App Settings","assets/setting.png"),
                    buildRowUtilities("Help & Support","assets/help.png"),
                    buildRowUtilities("Invite Friends","assets/add-group.png"),
                    buildRowUtilities("About Us","assets/info.png"),
                    buildRowUtilities("Rate Us","assets/thumbs.png"),
                    buildRowUtilities("Logout","assets/turn-off.png"),
                  ])),

            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(16),
              color: Colors.transparent,
              child:  Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Last Login: ",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        TextSpan(
                          text: "02 Aug 2024 10:00 AM",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12),

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

    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Column(
          children: [
            Divider(
              color: Colors.grey.shade200,
              // Set your desired divider color
              height: 0.2,
            ),
            SizedBox(height: 12.0),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Left padding
                  ImageIcon(
                    AssetImage(icon),
                    color: Colors.grey.shade700,
                    size: 22,
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: Text(
                      label,
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),                  // Right padding
                  SizedBox(width: 8.0), // Add some space between the text and the right icon
                  Icon(
                    Icons.keyboard_arrow_right_outlined, // Replace this with your desired icon
                    color: Colors.grey.shade400,
                    size: 24,
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.0),
            if (label == "Logout")
              Divider(
                color: Colors.grey.shade200,
                height: 0.2,
              ),
          ],
        ),
      ),
    );
  }
}

