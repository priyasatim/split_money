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
               Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: GestureDetector(
            onTap: () {
              _showModalBottomSheet(context);
            },
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
              ),),
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

void _showModalBottomSheet(BuildContext context) {
  List<Map<String,dynamic>> _allUsers =[
    {"id":1, "name":"Priya","email_id": "Priya@gmail.com","age":29},
    {"id":2, "name":"Abc","email_id": "Priya@gmail.com","age":39},
    {"id":3, "name":"Def","email_id": "Priya@gmail.com","age":49},
    {"id":4, "name":"ghj","email_id": "Priya@gmail.com","age":59},
    {"id":5, "name":"Klm","email_id": "Priya@gmail.com","age":69},
  ];
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: 200,
        padding : EdgeInsets.only(top: 12,bottom: 12),
        color: Colors.white,
        child:  Column(
          children: <Widget>[
            CenterDot(
              width: 200,
              color: Colors.grey,
            ),
            Text('Add Friend', style: TextStyle(fontWeight: FontWeight.bold),),
            Text('Priya@gmail.com', style: TextStyle(fontSize: 14)),
            Text('Priya@gmail.com', style: TextStyle(fontSize: 12),),
            Expanded(
          child: ListView.builder(
                itemCount: _allUsers.length,
                itemBuilder: (context, index) => Card(
                    key : ValueKey(_allUsers[index]["id"]),
                    elevation: 4,
                    child :ListTile(
                      title: Text(_allUsers[index]['name'],style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 14),),
                      subtitle: Text(_allUsers[index]['email_id'],style: TextStyle(color: Colors.grey,fontSize: 12),),
                    )
                )
            ),),
          ],
        ),
      );
    },
  );
}

class CenterDotPainter extends CustomPainter {
  final Color color;
  final double radius;

  CenterDotPainter({required this.color, this.radius = 4.0});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    double centerX = size.width / 2;
    canvas.drawCircle(Offset(centerX, radius), radius, paint);
  }

  @override
  bool shouldRepaint(CenterDotPainter oldDelegate) => false;
}

class CenterDot extends StatelessWidget {
  final double width;
  final Color color;
  final double radius;

  CenterDot({
    required this.width,
    required this.color,
    this.radius = 4.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: radius * 2,
      child: CustomPaint(
        painter: CenterDotPainter(
          color: color,
          radius: radius,
        ),
      ),
    );
  }
}


