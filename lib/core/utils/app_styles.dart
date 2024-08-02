import 'package:flutter/material.dart';

abstract class AppStyles {
  /// light w300
  /// regular w400
  /// medium w500
  /// semiBold w600
  /// bold w700
  


  /// light12
  static TextStyle light12(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF000000),
      fontSize: getResponsiveFontSize(context, baseFontSize: 12),
      fontFamily: 'Alexandria',
      fontWeight: FontWeight.w300,
    );
  }

  /// regular18
  static TextStyle regular18(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF000000),
      fontSize: getResponsiveFontSize(context, baseFontSize: 18),
      fontFamily: 'Alexandria',
      fontWeight: FontWeight.w400,
    );
  }

  /// regular14
  static TextStyle regular14(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF000000),
      fontSize: getResponsiveFontSize(context, baseFontSize: 14),
      fontFamily: 'Alexandria',
      fontWeight: FontWeight.w400,
    );
  }

  /// regular13 gray
  static TextStyle regular13(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF666666),
      fontSize: getResponsiveFontSize(context, baseFontSize: 13),
      fontFamily: 'Alexandria',
      fontWeight: FontWeight.w400,
    );
  }

  /// regular11
  static TextStyle regular11(BuildContext context) {
    return TextStyle(
      color: const Color(0xFFAAAAAA),
      fontSize: getResponsiveFontSize(context, baseFontSize: 11),
      fontFamily: 'Alexandria',
      fontWeight: FontWeight.w400,
    );
  }

  /// regular12
  static TextStyle regular12(BuildContext context) {
    return TextStyle(
      color: const Color(0xFFB4B4B4),
      fontSize: getResponsiveFontSize(context, baseFontSize: 12),
      fontFamily: 'Alexandria',
      fontWeight: FontWeight.w400,
    );
  }

  /// regular16
  static TextStyle regular16(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF000000),
      fontSize: getResponsiveFontSize(context, baseFontSize: 16),
      fontFamily: 'Alexandria',
      fontWeight: FontWeight.w400,
    );
  }

  /// medium11
  static TextStyle medium11(BuildContext context) {
    return TextStyle(
      color: const Color(0xFFAAAAAA),
      fontSize: getResponsiveFontSize(context, baseFontSize: 11),
      fontFamily: 'Alexandria',
      fontWeight: FontWeight.w500,
    );
  }

  /// medium12
  static TextStyle medium12(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF000000),
      fontSize: getResponsiveFontSize(context, baseFontSize: 12),
      fontFamily: 'Alexandria',
      fontWeight: FontWeight.w500,
    );
  }

  /// medium13 black
  static TextStyle medium13(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF000000),
      fontSize: getResponsiveFontSize(context, baseFontSize: 13),
      fontFamily: 'Alexandria',
      fontWeight: FontWeight.w500,
    );
  }

  /// medium15
  static TextStyle medium15(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF000000),
      fontSize: getResponsiveFontSize(context, baseFontSize: 15),
      fontFamily: 'Alexandria',
      fontWeight: FontWeight.w500,
    );
  }

  /// medium14
  static TextStyle medium14(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF979797),
      fontSize: getResponsiveFontSize(context, baseFontSize: 14),
      fontFamily: 'Alexandria',
      fontWeight: FontWeight.w500,
    );
  }

  /// semiBold12 gray
  static TextStyle semiBold12(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF979797),
      fontSize: getResponsiveFontSize(context, baseFontSize: 12),
      fontFamily: 'Alexandria',
      fontWeight: FontWeight.w600,
    );
  }

  /// semiBold13 black
  static TextStyle semiBold13(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF000000),
      fontSize: getResponsiveFontSize(context, baseFontSize: 13),
      fontFamily: 'Alexandria',
      fontWeight: FontWeight.w600,
    );
  }

  /// semiBold17 black
  static TextStyle semiBold17(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF000000),
      fontSize: getResponsiveFontSize(context, baseFontSize: 17),
      fontFamily: 'Alexandria',
      fontWeight: FontWeight.w600,
    );
  }

  /// semiBold16 black
  static TextStyle semiBold16(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF000000),
      fontSize: getResponsiveFontSize(context, baseFontSize: 16),
      fontFamily: 'Alexandria',
      fontWeight: FontWeight.w600,
    );
  }

  /// semiBold15 black
  static TextStyle semiBold15(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF000000),
      fontSize: getResponsiveFontSize(context, baseFontSize: 15),
      fontFamily: 'Alexandria',
      fontWeight: FontWeight.w600,
    );
  }

  /// semiBold14 black
  static TextStyle semiBold14(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF000000),
      fontSize: getResponsiveFontSize(context, baseFontSize: 14),
      fontFamily: 'Alexandria',
      fontWeight: FontWeight.w600,
    );
  }

  /// semiBold18
  static TextStyle semiBold18(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF000000),
      fontSize: getResponsiveFontSize(context, baseFontSize: 18),
      fontFamily: 'Alexandria',
      fontWeight: FontWeight.w600,
    );
  }

  /// semiBold25
  static TextStyle semiBold25(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF000000),
      fontSize: getResponsiveFontSize(context, baseFontSize: 25),
      fontFamily: 'Alexandria',
      fontWeight: FontWeight.w600,
    );
  }

  /// Bold25
  static TextStyle bold25(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF000000),
      fontSize: getResponsiveFontSize(context, baseFontSize: 25),
      fontFamily: 'Alexandria',
      fontWeight: FontWeight.w700,
    );
  }

  /// Bold17
  static TextStyle bold17(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF000000),
      fontSize: getResponsiveFontSize(context, baseFontSize: 17),
      fontFamily: 'Alexandria',
      fontWeight: FontWeight.w700,
    );
  }

  /// Bold16
  static TextStyle bold16(BuildContext context) {
    return TextStyle(
      color: const Color(0xFFFFFFFF),
      fontSize: getResponsiveFontSize(context, baseFontSize: 16),
      fontFamily: 'Alexandria',
      fontWeight: FontWeight.w700,
    );
  }

  /// Bold15
  static TextStyle bold15(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF979797),
      fontSize: getResponsiveFontSize(context, baseFontSize: 15),
      fontFamily: 'Alexandria',
      fontWeight: FontWeight.w700,
    );
  }

  /// Bold13
  static TextStyle bold13(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF000000),
      fontSize: getResponsiveFontSize(context, baseFontSize: 13),
      fontFamily: 'Alexandria',
      fontWeight: FontWeight.w700,
    );
  }

  /// Bold12
  static TextStyle bold12(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF000000),
      fontSize: getResponsiveFontSize(context, baseFontSize: 12),
      fontFamily: 'Alexandria',
      fontWeight: FontWeight.w700,
    );
  }

  /// Bold18
  static TextStyle bold18(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF000000),
      fontSize: getResponsiveFontSize(context, baseFontSize: 18),
      fontFamily: 'Alexandria',
      fontWeight: FontWeight.w700,
    );
  }

}


/// Responsive FontSize

double getResponsiveFontSize(BuildContext context,
    {required double baseFontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = baseFontSize * scaleFactor;

  double lowerLimit = baseFontSize * 0.8;
  double upperLimit = baseFontSize * 1.2;

  //log('responsiveFontSize = $responsiveFontSize / lowerLimit = $lowerLimit / upperLimit = $upperLimit / clamp = ${responsiveFontSize.clamp(lowerLimit, upperLimit)}');

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

// # 1 ScaleFactor
double getScaleFactor(BuildContext context) {
  double width = MediaQuery.sizeOf(context).width;

  if (width < 800) {
    // Mobile Platform w 400
    return width / 400;//550
  } else if (width < 1200) {
    // Tablet Platform w 700
    return width / 1000;
  } else {
    // Desktop Platform w 1000
    return width / 1900;
  }
}
