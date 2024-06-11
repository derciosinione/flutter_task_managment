import 'package:flutter/material.dart';

import '../../themes/app_images.dart';

class TopHeader extends StatelessWidget {
  // final String imageUrl;
  final Image image;

  const TopHeader({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Image.asset(
          AppImages.headerCircles,
          fit: BoxFit.fill,
        ),
        Center(
          child: Container(
            margin: EdgeInsets.only(top: size.height * 0.25),
            child: image,
          ),
        ),
      ],
    );
  }
}
