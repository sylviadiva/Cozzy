import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//color lib
Color purpleColor = Color(0xff5843BE);
Color orangeColor = Color(0xffFF9376);
Color blackColor = Color(0xff000000);
Color whiteColor = Color(0xffFFFFFF);
Color greyColor = Color(0xff82868E);

double edge = 24;

//text style lib
//w500 itu medium, w300 itu light, w400 itu reguler
TextStyle blackTextStyle = GoogleFonts.poppins(
  fontWeight: FontWeight.w500,
  color: blackColor,
);

TextStyle whiteTextStyle = GoogleFonts.poppins(
  fontWeight: FontWeight.w500,
  color: whiteColor,
);

TextStyle greryTextStyle = GoogleFonts.poppins(
  fontWeight: FontWeight.w300,
  color: greyColor,
);

TextStyle purpleTextStyle = GoogleFonts.poppins(
  fontWeight: FontWeight.w500,
  color: purpleColor,
);

TextStyle regulerTextStyle = GoogleFonts.poppins(
  fontWeight: FontWeight.w400,
  color: blackColor,
);
