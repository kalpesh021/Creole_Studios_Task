import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart'; 
import 'package:test_app/constants/common_variables.dart';

class CachedImage extends StatelessWidget {
  final String imgUri;
  final double? height;
  final double? width;
  const CachedImage({super.key, required this.imgUri, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imgUri,
      imageBuilder: (context, imageProvider) => Container(
        height: height ?? deviceHeight * 0.07,
        width: width ?? deviceWidth * 0.16,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.fill,
          ),
        ),
      ),
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
