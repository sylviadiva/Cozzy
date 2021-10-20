import 'package:flutter/material.dart';
import 'package:flutter_bwa/theme.dart';

class FacilityIcon extends StatelessWidget {
  final String name;
  final String imageUrl;
  final int total;

  FacilityIcon(
      {required this.name, required this.imageUrl, required this.total});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imageUrl,
          width: 32,
        ),
        SizedBox(
          height: 8,
        ),
        Text.rich(TextSpan(
            text: '$total',
            style: purpleTextStyle.copyWith(fontSize: 14),
            children: [
              TextSpan(
                  text: ' $name', style: greryTextStyle.copyWith(fontSize: 14)),
            ])),
      ],
    );
  }
}
