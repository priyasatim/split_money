import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:split_money/common/SquareAvatar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GroupDetails(),
    );
  }
}

class GroupDetails extends StatefulWidget {
  @override
  State<GroupDetails> createState() => GroupState();
}

class GroupState extends State<GroupDetails> {
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
                Text(
                  "Group Details",
                  style: TextStyle(
                    color: Colors.transparent,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )),
        body: SingleChildScrollView(
            child: Column(
            children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topLeft,
              children: [
                buildBackgroundImage(),
                Positioned(
                  top: top,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: buildProfileImage(),
                  ),
                )
              ],
            ),
            SizedBox(height: top + profileHeight / 2 + 5),
            Text(
              "World Tour with School Friends",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 12, right: 12),
              child: Text(
                "Our group desciption should state the intent of your group clearly to help new members understand how to best contribute and engage",
                style: TextStyle(fontSize: 12.0, color: Colors.grey),
              ),
            ),
            SizedBox(height: 12),
            ListView.builder( shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context,index){
              return CustomColumn();
            })
          ],
        )));
  }

  Widget buildBackgroundImage() => Container(
      child: Opacity(opacity: 0.5, child: Image.asset('assets/images.jpeg')));

  Widget buildProfileImage() =>
      SquareAvatar(imageUrl: 'assets/iv_profile.png', size: 100.0);
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
                child: Column(
                  children: [
                    Text(
                      'remove', // Add your additional text here
                      style: TextStyle(
                        color: Colors.grey, // Adjust color as needed
                        fontSize: 12.0,
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

