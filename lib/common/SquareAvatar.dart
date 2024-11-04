

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SquareAvatar extends StatelessWidget {
  final double size;
  final String imageUrl;

  SquareAvatar({required this.size, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
        shape: BoxShape.rectangle,
      ),
    );
  }
}