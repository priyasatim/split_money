import 'package:flutter/material.dart';
import 'package:split_money/SlideSwitcher.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FriendList(),
    );
  }
}

class FriendList extends StatefulWidget {
  @override
  FriendListState createState() => FriendListState();
}

class FriendListState extends State<FriendList> {
  int switcherIndex1 = 0;
  int switcherIndex2 = 0;
  int switcherIndex3 = 0;
  int switcherIndex4 = 0;
  int switcherIndex5 = 0;
  int switcherIndex6 = 0;
  int switcherIndex7 = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.person_add_alt_rounded, color: Colors.black),
                    Text(
                      "Friends",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Icon(Icons.notifications, color: Colors.black),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.0, top: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Summary",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "₹ 15000",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
          decoration: BoxDecoration(
            color: Colors.grey[200], // Background color
            borderRadius: BorderRadius.circular(25), // Optional: You can adjust the border radius as needed
          ),
          child: SlideSwitcher(
                children: [
                  Text(
                    'Overall',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: switcherIndex4 == 0
                            ? Colors.black.withOpacity(0.9)
                            : Colors.grey),
                  ),
                  Text(
                    'I owe',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: switcherIndex4 == 1
                            ? Colors.black.withOpacity(0.9)
                            : Colors.grey),
                  ),
                  Text(
                    'Owns me',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: switcherIndex4 == 2
                            ? Colors.black.withOpacity(0.9)
                            : Colors.grey),
                  ),
                ],
                onSelect: (int index) => setState(() => switcherIndex4 = index),
                containerColor: Colors.white24,
                indents: 9,
                containerHeight: 50,
                containerWight: 350,
              ),
        ),
              SizedBox(height: 10),
              CustomColumn(),
            ],
          ),
        ),
      ),
    );
  }
}


class CustomColumn extends StatelessWidget {
  final List<String> items = List<String>.generate(100, (index) => "Item $index");

  @override
  Widget build(BuildContext context) {
    return Expanded(child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items.map((item) {
          return CustomListItem(
            title: item,
            subtitle: '02 Feb 2024',
            imageUrl: 'https://via.placeholder.com/150', // Example image URL
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
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 8.0),
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
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
              child : Column(
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
              )
            )
          ],
        ),
      ),
    );
  }
}