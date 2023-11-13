import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppImage extends StatelessWidget {
  const AppImage({Key? key, this.imageName, this.color, this.size})
      : super(key: key);

  final String? imageName;
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    if (imageName == null) {
      return Container();
    }
    final String imagePath = 'assets/images/$imageName';
    final String extension = imageName!.split('.').last.toLowerCase();

    Widget imageWidget;
    switch (extension) {
      case 'svg':
        imageWidget = SvgPicture.asset(
          imagePath,
          height: size,
          width: size,
          fit: BoxFit.fitHeight,
        );
        break;
      case 'png':
      case 'jpg':
      case 'jpeg':
      case 'gif':
        imageWidget = Image.asset(
          imagePath,
          color: color,
          height: size,
          width: size,
          fit: BoxFit.contain,
        );
        break;
      default:
        imageWidget = Container();
        break;
    }

    return imageWidget;
  }
}
