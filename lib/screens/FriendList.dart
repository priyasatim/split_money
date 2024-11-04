import 'package:flutter/material.dart';
import 'package:split_money/common/DashedLinePainter.dart';
import 'package:split_money/common/SlideSwitcher.dart';

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
  final List<Map<String, dynamic>> _allUsers = [
    {"id": 1, "name": "Priya", "email_id": "Priya@gmail.com", "age": 29},
    {"id": 2, "name": "Abc", "email_id": "Priya@gmail.com", "age": 39},
    {"id": 3, "name": "Def", "email_id": "Priya@gmail.com", "age": 49},
    {"id": 4, "name": "ghj", "email_id": "Priya@gmail.com", "age": 59},
    {"id": 5, "name": "Klm", "email_id": "Priya@gmail.com", "age": 69},
  ];

  List<Map<String, dynamic>> _filteredUsers = [];

  int switcherIndex1 = 0;
  int switcherIndex2 = 0;
  int switcherIndex3 = 0;
  int switcherIndex4 = 0;
  int switcherIndex5 = 0;
  int switcherIndex6 = 0;
  int switcherIndex7 = 0;


  @override
  void initState() {
    super.initState();
    _filteredUsers = _allUsers;
  }

  void _filterUsers(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) => user["name"]
          .toLowerCase()
          .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _filteredUsers = results;
    });
  }

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
                  child: const Row(
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
              const Padding(
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
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200], // Background color
                  borderRadius: BorderRadius.circular(25),
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
                  onSelect: (int index) =>
                      setState(() => switcherIndex4 = index),
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

  void _showModalBottomSheet(BuildContext context) {
    double totalHeight =
        _allUsers.length * 56.0; // Height of each list item
    double deviceHeight = MediaQuery.of(context).size.height;

    showModalBottomSheet(
      context: context,
      isScrollControlled: totalHeight > deviceHeight,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child : ClipRRect(
            borderRadius: BorderRadius.circular(25.0),
            child : Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.only(top: 6, bottom: 6),
          color: Colors.white,
          child: Column(
            children: <Widget>[
               Container(
                height: 5,
                width: 50,

                 child: CustomPaint(
                   painter: DashedLinePainter(
                     dashSpace: 0,
                     dashWidth: 5,
                     color: Colors.grey[600]!
                   ),
                 ),
              ),
              const SizedBox(height: 12),
               const Text(
                'Add Friend',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
              ),
              const SizedBox(height: 12),
              Container(
                margin: const EdgeInsets.only(left: 16.0,right: 16.0),
                child : TextField(
                  onChanged: (value) => _filterUsers(value),
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      isDense: true,
                      contentPadding: EdgeInsets.all(8),
                      labelText: 'Search',
                      suffixIcon: Icon(Icons.arrow_right_alt_rounded),
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red, width: 10.0),
                          borderRadius: BorderRadius.all(Radius.circular(25.0)))),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: _filteredUsers.length,
                    itemBuilder: (context, index) => Container(
                        key: ValueKey(_filteredUsers[index]["id"]),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                            AssetImage('assets/images/profile.png'),
                          ),
                          title: Text(
                            _filteredUsers[index]['name'],
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                          subtitle: Text(
                            _filteredUsers[index]['email_id'],
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  // Define the text's action here
                                  print(
                                      'Text pressed for user: ${_filteredUsers[index]['name']}');
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child:  Text(
                                    'Add Friend',
                                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 12),
                                  ),

                                ),
                              ),
                            ],
                          ),
                        ))),
              ),
            ],
            ),
            ),
          ),
        );
      },
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

