import 'package:flutter/material.dart';
import 'package:techblog/_myColors.dart';

class dividerLine extends StatelessWidget {
  const dividerLine({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: solidcolors.dividerCoror,
      indent: size.width / 6,
      endIndent: size.width / 6,
    );
  }
}
