import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:split_money/screens/FriendList.dart';
import 'package:split_money/common/SquareAvatar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SettleUpDetail(),
    );
  }
}

class SettleUpDetail extends StatefulWidget {
  @override
  State<SettleUpDetail> createState() => SettleUpState();
}

class SettleUpState extends State<SettleUpDetail> {
  final double coverHeight = 100;
  final double profileHeight = 80;
  List<Map<String, dynamic>> _filteredUsers = [];

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
                Icon(Icons.arrow_back_ios, color: Colors.black),
                Text(
                  "",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Icon(Icons.settings_outlined, color: Colors.black),
              ],
            )),
        body: Column(children: [
          Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topLeft,
              children: [
                buildCoverImage(),
                Positioned(
                  top: top,
                  left: 0,
                  right: 0,
                  child : Padding(
                    padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildSquareImageWithText(),
                      SizedBox(height: 8),
                      Text(
                        "World Tour With Friends",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'You owe',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          SizedBox(width: 4), // Space between text elements
                          Text(
                            '1242',
                            style: TextStyle(fontSize: 14, color: Colors.red),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      // Space between rows
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(
                                    4.0), // Rounded corners
                              ),
                              padding: EdgeInsets.all(8.0),
                              // Padding inside the container
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Settle Balance',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 12), // Space between containers
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey, // Border color
                                  width: 1.0, // Border width
                                ),
                                borderRadius: BorderRadius.circular(
                                    4.0), // Rounded corners
                              ),
                              padding: EdgeInsets.all(8.0),
                              // Padding inside the container
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Overview',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 12), // Space between containers
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey, // Border color
                                  width: 1.0, // Border width
                                ),
                                borderRadius: BorderRadius.circular(
                                    4.0), // Rounded corners
                              ),
                              padding: EdgeInsets.all(8.0),
                              // Optional: Padding inside the container
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Export',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      // CustomColumn(),
                    ],
                  ),)
                ),
                // Positioned(top: top, child: buildSquareImageWithText()),
                // Positioned(
                //     top: top + 100 + 8, // Adjust according to image height and spacing
                //     left: 0, // Adjust as needed
                //     child: Text(
                //       "World Tour With Friends",
                //       style: TextStyle(
                //         color: Colors.black,
                //         fontWeight: FontWeight.bold,
                //         fontSize: 18,
                //       ),
                //     )),
                // Positioned(
                //     top: top + 100 + 8, // Adjust according to image height and spacing
                //     left: 0, // Adjust as needed
                //     child: Text(
                //       "World Tour With Friends",
                //       style: TextStyle(
                //         color: Colors.black,
                //         fontWeight: FontWeight.bold,
                //         fontSize: 18,
                //       ),
                //     )),
                // Positioned(
                //   top: top + 100 + 8 + 20, // Additional space after previous text
                //   left: 0, // Adjust as needed
                //   child: const Row(
                //     crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
                //     children: [
                //       Text(
                //         'You owe',
                //         style: TextStyle(fontSize: 14, color: Colors.grey),
                //       ),
                //       Text(
                //         '1242',
                //         style: TextStyle(fontSize: 14, color: Colors.red),
                //       ),
                //     ],
                //   ),
                // ),
                // Positioned(
                //       top: top + 100 + 8 + 20+ 20,
                //       left: 0,
                //       child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Row(
                //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //               // Distribute space evenly
                //               children: [
                //                 Expanded(
                //                   child: Container(
                //                     decoration: BoxDecoration(
                //                       color: Colors.black,
                //                       borderRadius: BorderRadius.circular(
                //                           4.0), // Rounded corners
                //                     ),
                //                     padding: EdgeInsets.all(8.0),
                //                     // Padding inside the container
                //                     child: Text(
                //                       'Settle Balance',
                //                       style: TextStyle(fontSize: 14, color: Colors.white),
                //                     ),
                //                   ),
                //                 ),
                //                 SizedBox(width: 12), // Space between containers
                //                 Expanded(
                //                   child: Container(
                //                     decoration: BoxDecoration(
                //                       border: Border.all(
                //                         color: Colors.grey, // Border color
                //                         width: 1.0, // Border width
                //                       ),
                //                       borderRadius: BorderRadius.circular(
                //                           4.0), // Rounded corners
                //                     ),
                //                     padding: EdgeInsets.all(8.0),
                //                     // Padding inside the container
                //                     child: Text(
                //                       'Overview',
                //                       style: TextStyle(fontSize: 14, color: Colors.grey),
                //                     ),
                //                   ),
                //                 ),
                //                 SizedBox(width: 12), // Space between containers
                //                 Expanded(
                //                   child: Container(
                //                     decoration: BoxDecoration(
                //                       border: Border.all(
                //                         color: Colors.grey, // Border color
                //                         width: 1.0, // Border width
                //                       ),
                //                       borderRadius: BorderRadius.circular(
                //                           4.0), // Rounded corners
                //                     ),
                //                     padding: EdgeInsets.all(8.0),
                //                     // Optional: Padding inside the container
                //                     child: Text(
                //                       'Export',
                //                       style: TextStyle(fontSize: 14, color: Colors.grey),
                //                     ),
                //                   ),
                //                 ),
                //               ],
                //             ),
                //           ]))
              ])
        ]));
  }

  Widget buildCoverImage() => Container(
        width: double.infinity, // Ensures the background covers the full width
        height: 110, // Ensures the background covers the full height
        color: Colors.grey[300]!.withOpacity(0.5),
      );

  Widget buildSquareImageWithText() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                  ),
                  child: Image.asset(
                    'assets/user-avatar-male.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    // Background color with opacity
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8.0),
                      // Adjust the radius as needed
                      bottomRight:
                          Radius.circular(8.0), // Adjust the radius as needed
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Upload",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomColumn extends StatelessWidget {
  final List<String> items =
  List<String>.generate(100, (index) => "Item $index");

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: items.map((item) {
              return CustomListItem(
                title: item,
                subtitle: '02 Feb 2024',
                imageUrl: 'https://via.placeholder.com/150',
                // Example image URL
                ownAmount: '322',
                onTap: () {
                  // Do something when item is tapped
                },
              );
            }).toList(),
          ),
        ));
  }
}
