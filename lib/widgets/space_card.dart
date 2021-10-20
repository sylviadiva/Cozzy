import 'package:flutter/material.dart';
import 'package:flutter_bwa/models/space.dart';
import 'package:flutter_bwa/pages/detail_page.dart';
import 'package:flutter_bwa/theme.dart';

class SpaceCard extends StatelessWidget {
  final Space space;
  SpaceCard(this.space);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //routes ke detail page di recommended space
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailPage(space)));
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Container(
              width: 130,
              height: 110,
              child: Stack(
                children: [
                  Image.network(space.imageUrl,
                      width: 130, height: 110, fit: BoxFit.cover),
                  //INI BAGIAN IS POPULAR
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 70,
                      height: 30,
                      decoration: BoxDecoration(
                        color: purpleColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(36),
                        ),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/icon_star.png',
                              width: 22,
                              height: 22,
                            ),
                            Text(
                              '${space.rating}/5',
                              style: whiteTextStyle.copyWith(fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(space.name,
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                  )),
              SizedBox(
                height: 2,
              ),
              Text.rich(TextSpan(
                  text: '\$${space.price}',
                  style: purpleTextStyle.copyWith(fontSize: 16),
                  children: [
                    TextSpan(
                        text: '/ month',
                        style: greryTextStyle.copyWith(fontSize: 16)),
                  ])),
              SizedBox(height: 16),
              Text('${space.city}, ${space.country}', style: greryTextStyle),
            ],
          )
        ],
      ),
    );
  }
}
