import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'app_colors.dart';


class ApplicationThem{

  static ThemeData lightthem= ThemeData(

    appBarTheme: AppBarTheme(
        backgroundColor: AppColor.primarycolor,
      centerTitle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30)
        )
      )
    ),
    iconTheme: IconThemeData(
        color: Colors.white
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: 'poppins',
        fontSize: 30,
      ),

      bodyMedium: TextStyle(

          fontSize: 30,
          fontWeight: FontWeight.w700,
          fontFamily: 'poppins'),
      bodySmall: TextStyle(
          fontFamily: 'poppins',
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: AppColor.whitecolor
      ),
    ),
  );

}