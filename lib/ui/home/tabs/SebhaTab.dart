import 'package:flutter/material.dart';

import '../../../style/AssetsManager.dart';

class SebhaTab extends StatelessWidget {
  const SebhaTab({super.key});
  // add sebha image and rotation
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(AssetsManager.sebhaBack),fit: BoxFit.fitWidth)
      ),
    );
  }
}
