import 'package:flutter/material.dart';

class PeteImageAsset extends StatelessWidget {
  const PeteImageAsset({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = const AssetImage("images/pete.jpg");
    Image image = Image(image: assetImage, width: 400, height:300);
    return Container(child: image);
  }
}