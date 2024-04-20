import 'package:mesh_msgr/constants/constants.dart';
import 'package:flutter/material.dart';

class FullScreenImage extends StatelessWidget {
  final String? imagePath;
  const FullScreenImage({super.key, @required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: whiteColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Hero(
          tag: imagePath!,
          child: Image.asset(
            imagePath!,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
