import 'package:flutter/material.dart';

import '../../../style/AssetsManager.dart';

class TimeTab extends StatelessWidget {
  const TimeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(AssetsManager.timeBack),fit: BoxFit.fitWidth)
      ),
    );
  }
}
