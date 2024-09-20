import 'dart:io';

import 'package:flutter/material.dart';
import 'package:saas_app/constants/colors.dart';

class ImagePreview extends StatelessWidget {
  final String? imagePath;
  const ImagePreview({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: kMainColor),
        borderRadius: BorderRadius.circular(20),
        color: kMainColor.withOpacity(0.2),
      ),
      height: MediaQuery.of(context).size.height * 0.4,
      width: double.infinity,
      child: imagePath == null
          ? const Center(
              child: Icon(
                Icons.image,
                size: 150,
                color: kMainColor,
              ),
            )
          : Image.file(
              File(imagePath!),
              fit: BoxFit.cover,
            ),
    );
  }
}
