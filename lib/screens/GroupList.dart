import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GroupList(),
    );
  }
}

class GroupList extends StatefulWidget {
  @override
  State<GroupList> createState() => GroupState();
}

class GroupState extends State<GroupList> {
  @override
  Widget build(BuildContext context) {
    final List<String> items = [];

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: items.isNotEmpty
                    ? Icon(Icons.group_add_outlined, color: Colors.black)
                    : SizedBox(),
              ),
              const Padding(
                  padding: EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Text(
                    "Groups",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              const Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                child: Icon(Icons.notifications_outlined, color: Colors.black),
              ),
            ],
          ),
        ),
        body: Expanded(
          child: items.isNotEmpty
              ? SingleChildScrollView(
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _buildItemsWithDividers(items),
                ))
              : Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'No Group, Create Now',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        SizedBox(
                            height: 16), // Add spacing between text and button
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Create New Group'),
                        ),
                      ]),
                ),
        ));
  }
}

List<Widget> _buildItemsWithDividers(List<String> items) {
  List<Widget> widgets = [];
  for (var i = 0; i < items.length; i++) {
    widgets.add(CustomListItem(
      title: items[i],
      subtitle: '6 friends',
      imageUrl: 'https://via.placeholder.com/150',
      ownAmount: '125',
      onTap: () {},
      // onTap: () {
      //   pageController.animateToPage(
      //       1,
      //     duration: Duration(milliseconds: 400),
      //     curve: Curves.linear,
      //   );
      // },
    ));
    if (i < items.length - 1) {
      widgets.add(
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            // Add padding around the divider
            child: Divider(
              color: Colors.grey.shade300,
              thickness: 1,
            )),
      );
    }
  }
  return widgets;
}

class CustomListItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUrl;
  final String ownAmount;
  final VoidCallback onTap;

  CustomListItem({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.onTap,
    required this.ownAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 4),
                  Row(children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: ClipOval(
                        child: Image.asset(
                          'assets/profile.png',
                          width: 30,
                          height: 30,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      left: -30,
                      top: -30,
                      child: ClipOval(
                        child: Image.asset(
                          'assets/profile.png',
                          width: 30,
                          height: 30,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ]),
                  SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ),
            const Positioned(
                child: Column(
              children: [
                Text(
                  'you owe', // Add your additional text here
                  style: TextStyle(
                    color: Colors.grey, // Adjust color as needed
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '-₹124', // Add your additional text here
                  style: TextStyle(
                    color: Colors.red, // Adjust color as needed
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
