import 'package:flutter/material.dart';
import 'package:flutter_bwa/pages/home_page.dart';
import 'package:flutter_bwa/theme.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/404.png',
                width: 300,
              ),
              SizedBox(
                height: 70,
              ),
              Text(
                'Where are you going?',
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Text(
                'Seems like the page that you were\n requested is already gone',
                style: greryTextStyle.copyWith(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                height: 50,
                width: 210,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                        (route) => false);
                  },
                  child: Text(
                    'Back to Home',
                    style: whiteTextStyle.copyWith(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: purpleColor, //styling change button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
