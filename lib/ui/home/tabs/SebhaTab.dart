import 'package:flutter/material.dart';

import '../../../style/AssetsManager.dart';

class SebhaTab extends StatelessWidget {
  const SebhaTab({super.key});

  @override
  Widget build(BuildContext context) {
    // finish sebha logic
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(AssetsManager.sebhaBack),fit: BoxFit.fitWidth)
      ),
    );
  }
}
