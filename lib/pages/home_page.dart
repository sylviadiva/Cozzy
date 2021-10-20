import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bwa/models/city.dart';
import 'package:flutter_bwa/models/space.dart';
import 'package:flutter_bwa/models/tips.dart';
import 'package:flutter_bwa/providers/space_provider.dart';
import 'package:flutter_bwa/theme.dart';
import 'package:flutter_bwa/widgets/bottom_bar.dart';
import 'package:flutter_bwa/widgets/city_card.dart';
import 'package:flutter_bwa/widgets/space_card.dart';
import 'package:flutter_bwa/widgets/tips_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);
    // spaceProvider.getRecommendedSpaces();

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            SizedBox(height: edge),
            // TITLE/HEADER
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Explore Now',
                style: blackTextStyle.copyWith(fontSize: 24),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Mencari kosan yang cozy',
                style: greryTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            //POPULAR CITIES SECTION
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Popular Cities',
                style: regulerTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 24,
                  ),
                  CityCard(
                    City(
                      id: 1,
                      name: 'Jakarta',
                      imageUrl: 'assets/images/city1.png',
                      isPopular: false,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                      id: 2,
                      name: 'Bandung',
                      imageUrl: 'assets/images/city2.png',
                      isPopular: true,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                      id: 3,
                      name: 'Surabaya',
                      imageUrl: 'assets/images/city3.png',
                      isPopular: false,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                      id: 4,
                      name: 'Palembang',
                      imageUrl: 'assets/images/city4.png',
                      isPopular: false,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                      id: 5,
                      name: 'Aceh',
                      imageUrl: 'assets/images/city5.png',
                      isPopular: true,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                      id: 6,
                      name: 'Bogor',
                      imageUrl: 'assets/images/city6.png',
                      isPopular: false,
                    ),
                  ),
                  SizedBox(
                    width: 24,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            //RECOMMENDED SPACE SECTION
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Recommended Space',
                style: regulerTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: edge,
              ),
              child: FutureBuilder(
                future: spaceProvider.getRecommendedSpaces(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Space> data = snapshot.data as List<Space>;

                    int index = 0;
                    return Column(
                      children: data.map((item) {
                        index++;
                        return Container(
                          margin: EdgeInsets.only(
                            top: index == 1 ? 0 : 30,
                          ),
                          child: SpaceCard(item),
                        );
                      }).toList(),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            SizedBox(height: 30),
            //TIPS AND GUIDE SECTION
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Tips and Guidance',
                style: regulerTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: edge,
              ),
              child: Column(
                children: [
                  TipsCard(
                    Tips(
                      id: 1,
                      name: ' City Guidelines',
                      imageUrl: 'assets/images/tips1.png',
                      updatedAt: 'April, 20',
                    ),
                  ),
                  SizedBox(height: 20),
                  TipsCard(
                    Tips(
                      id: 2,
                      name: ' Jakarta Fairship',
                      imageUrl: 'assets/images/tips2.png',
                      updatedAt: 'August, 11',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50 + edge,
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * edge),
        margin: EdgeInsets.symmetric(
          horizontal: edge,
        ),
        decoration: BoxDecoration(
            color: Color(0xffF6F7F8), borderRadius: BorderRadius.circular(23)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomBar(imageUrl: 'assets/images/Icon_home.png', isActive: true),
            BottomBar(imageUrl: 'assets/images/Icon_mail.png', isActive: false),
            BottomBar(imageUrl: 'assets/images/Icon_card.png', isActive: false),
            BottomBar(imageUrl: 'assets/images/Icon_love.png', isActive: false),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
