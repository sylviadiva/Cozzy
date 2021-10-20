import 'package:flutter/material.dart';
import 'package:flutter_bwa/models/space.dart';
import 'package:flutter_bwa/pages/error_page.dart';
import 'package:flutter_bwa/theme.dart';
import 'package:flutter_bwa/widgets/facility_icon.dart';
import 'package:flutter_bwa/widgets/rating_item.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  final Space space;
  DetailPage(this.space);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  // untuk btn whistlist clicked
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    launchUrl(String url) async {
      if (await canLaunch(url)) {
        launch(url);
      } else {
        //throw (url);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ErrorPage(),
          ),
        );
      }
    }

    Future<void> showConfirmation() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Confirmation'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Do you want to call?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('No'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Call Now'),
                onPressed: () {
                  Navigator.of(context).pop();
                  launchUrl('tel:${widget.space.phone}');
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.network(
              widget.space.imageUrl,
              width: MediaQuery.of(context).size.width,
              height: 350,
              fit: BoxFit.cover,
            ),
            ListView(
              children: [
                SizedBox(
                  height: 328,
                ),
                Container(
                  // lebar sebesar layar
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                    color: whiteColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      //TITLE SECTION
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.space.name,
                                  style: blackTextStyle.copyWith(
                                    fontSize: 22,
                                  ),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text.rich(TextSpan(
                                    text: '\$${widget.space.price}',
                                    style:
                                        purpleTextStyle.copyWith(fontSize: 16),
                                    children: [
                                      TextSpan(
                                          text: '/ month',
                                          style: greryTextStyle.copyWith(
                                              fontSize: 16)),
                                    ])),
                              ],
                            ),
                            Row(
                              children: [1, 2, 3, 4, 5].map((index) {
                                return Container(
                                  margin: EdgeInsets.only(
                                    left: 2,
                                  ),
                                  child: RatingItem(
                                      index: index,
                                      rating: widget.space.rating),
                                );
                              }).toList(),
                              // children: [
                              //   RatingItem(index: 1, rating: space.rating),
                              //   SizedBox(width: 2),
                              //   RatingItem(index: 1, rating: space.rating),
                              //   SizedBox(width: 2),
                              //   Image.asset('assets/images/icon_star.png',
                              //       width: 20),
                              //   SizedBox(width: 2),
                              //   Image.asset('assets/images/icon_star.png',
                              //       width: 20),
                              //   SizedBox(width: 2),
                              //   RatingItem(index: 1, rating: space.rating),
                              // ],
                            ),
                          ],
                        ),
                      ),
                      //MAIN FACILITIES SECTION
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text(
                          'Main Facilities',
                          style: regulerTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FacilityIcon(
                              name: 'Kitchen',
                              imageUrl: 'assets/images/icon_kitchen.png',
                              total: widget.space.numberOfKitchens,
                            ),
                            FacilityIcon(
                              name: 'Bedroom',
                              imageUrl: 'assets/images/icon_bedroom.png',
                              total: widget.space.numberOfBedrooms,
                            ),
                            FacilityIcon(
                              name: 'Big Cupboard',
                              imageUrl: 'assets/images/icon_lemari.png',
                              total: widget.space.numberOfCupboards,
                            ),
                          ],
                        ),
                      ),
                      //PHOTO SECTION
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text(
                          'Photos',
                          style: regulerTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        height: 88,
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: widget.space.photos.map((item) {
                              return Container(
                                margin: EdgeInsets.only(
                                  left: 24,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.network(item,
                                      width: 110,
                                      height: 88,
                                      fit: BoxFit.cover),
                                ),
                              );
                            }).toList()
                            // [
                            //   SizedBox(
                            //     width: edge,
                            //   ),
                            //   Image.asset(
                            //     'assets/images/photos_new1.png',
                            //     width: 110,
                            //     height: 88,
                            //     fit: BoxFit.cover,
                            //   ),
                            //   SizedBox(
                            //     width: 18,
                            //   ),
                            //   Image.asset(
                            //     'assets/images/photos_new2.png',
                            //     width: 110,
                            //     height: 88,
                            //     fit: BoxFit.cover,
                            //   ),
                            //   SizedBox(
                            //     width: 18,
                            //   ),
                            //   Image.asset(
                            //     'assets/images/photos_new3.png',
                            //     width: 110,
                            //     height: 88,
                            //     fit: BoxFit.cover,
                            //   ),
                            //   SizedBox(
                            //     width: edge,
                            //   ),
                            // ],
                            ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      //LOCATION SECTION
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text(
                          'Location',
                          style: regulerTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${widget.space.address}\n${widget.space.city}',
                              style: greryTextStyle,
                            ),
                            InkWell(
                              onTap: () {
                                // launchUrl(
                                //     'https://goo.gl/maps/SyZx2yjWB1yR6AeH8');

                                launchUrl(widget.space.mapUrl);
                              },
                              child: Image.asset(
                                'assets/images/btn_location.png',
                                width: 40,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
                        height: 50,
                        width: MediaQuery.of(context).size.width - (2 * edge),
                        child: ElevatedButton(
                          onPressed: () {
                            showConfirmation();
                            //launchUrl('tel:${widget.space.phone}');
                          },
                          child: Text(
                            'Book Now',
                            style: whiteTextStyle.copyWith(fontSize: 18),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: purpleColor, //styling change button color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: edge,
                vertical: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset('assets/images/btn_back.png', width: 40),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isClicked = !isClicked;
                      });
                    },
                    child: Image.asset(
                        isClicked
                            ? 'assets/images/btn_wishlist_clicked.png'
                            : 'assets/images/btn_wishlist.png',
                        width: 40),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
