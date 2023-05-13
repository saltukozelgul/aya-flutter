import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AvatarBottomSheet {
  Padding circleAvatarGridView() {
    String? imagePath = dotenv.env['AVATAR-IMAGE-PATH'];

    double itemSpacing = 30;
    int axisCount = 2;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GridView.builder(
        itemCount: 41,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: itemSpacing,
          mainAxisSpacing: itemSpacing / 2,
          crossAxisCount: axisCount,
        ),
        itemBuilder: (context, index) {
          String tempImage = '$imagePath$index.jpg';
          return GestureDetector(
            onTap: () => Navigator.of(context).pop<String>(tempImage),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: CachedNetworkImage(
                imageUrl: tempImage,
                fit: BoxFit.cover,
                progressIndicatorBuilder: ((context, url, progress) => const CircularProgressIndicator()),
              ),
            ),
          );
        },
      ),
    );
  }
}
