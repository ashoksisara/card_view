import 'package:card_view_demo/shared/constant/image_resources.dart';
import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  final double height;
  final double width;
  final String imageUrl;
  final BoxFit fit;
  const ImageView({Key? key,required this.imageUrl,
    this.fit = BoxFit.cover,
    this.height = double.infinity,
    this.width = double.infinity
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      fit: fit,
      height: height,
      width: width,
      errorBuilder: (context, error, stackTrace) {
        return Image.asset(ImageResources.placeholder,
          fit: fit,
          width: width,
          height: height,);
      },
    );
  }
}
