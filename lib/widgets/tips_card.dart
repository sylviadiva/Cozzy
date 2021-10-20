import 'package:flutter/material.dart';
import 'package:flutter_bwa/models/tips.dart';
import 'package:flutter_bwa/theme.dart';

class TipsCard extends StatelessWidget {
  final Tips tips;
  TipsCard(this.tips);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Image.asset(tips.imageUrl, width: 80),
      SizedBox(width: 16),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tips.name,
            style: blackTextStyle.copyWith(
              fontSize: 18,
            ),
          ),
          SizedBox(height: 4),
          Text('Updated ${tips.updatedAt}', style: greryTextStyle)
        ],
      ),
      Spacer(),
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.chevron_right, color: greyColor),
      ),
    ]);
  }
}
