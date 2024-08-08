import 'package:flutter/material.dart';


abstract class AppStyles {

  static Color primaryClr = const Color(0xff13A090);
  static Color darkGreyClr = const Color(0xff94A3B8);
  static Color darkRedClr = const Color(0xffB40000);
  static Color blackClr = const Color(0xff000000);



  // NotoKufiArabic
  /// regular10
  static TextStyle regular10(BuildContext context) {
    return TextStyle(
      color: darkGreyClr,
      fontSize: getResponsiveFontSize(context, baseFontSize: 10),
      fontFamily: 'NotoKufiArabic',
      fontWeight: FontWeight.w400,
    );
  }

  /// regular11
  static TextStyle regular11(BuildContext context) {
    return TextStyle(
      color: const Color(0xff262626),
      fontSize: getResponsiveFontSize(context, baseFontSize: 11),
      fontFamily: 'NotoKufiArabic',
      fontWeight: FontWeight.w400,
    );
  }
 /// regular13
  static TextStyle regular13(BuildContext context) {
    return TextStyle(
      color: blackClr,
      fontSize: getResponsiveFontSize(context, baseFontSize: 13),
      fontFamily: 'NotoKufiArabic',
      fontWeight: FontWeight.w400,
    );
  }

  /// bold10
  static TextStyle bold10(BuildContext context) {
    return TextStyle(
      color: primaryClr,
      fontSize: getResponsiveFontSize(context, baseFontSize: 10),
      fontFamily: 'NotoKufiArabic',
      fontWeight: FontWeight.w700,
    );
  }

  /// bold14
  static TextStyle bold14(BuildContext context) {
    return TextStyle(
      color: primaryClr,
      fontSize: getResponsiveFontSize(context, baseFontSize: 14),
      fontFamily: 'NotoKufiArabic',
      fontWeight: FontWeight.w700,
    );
  }

  /// bold20
  static TextStyle bold20(BuildContext context) {
    return TextStyle(
      color: primaryClr,
      fontSize: getResponsiveFontSize(context, baseFontSize: 20),
      fontFamily: 'NotoKufiArabic',
      fontWeight: FontWeight.w700,
    );
  }

  // Poppins
  /// medium12
  static TextStyle poppinsMedium12(BuildContext context) {
    return TextStyle(
      color: const Color(0xff787878),
      fontSize: getResponsiveFontSize(context, baseFontSize: 12),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
    );
  }
  /// medium21
  static TextStyle poppinsMedium21(BuildContext context) {
    return TextStyle(
      color: const Color(0xffF22323),
      fontSize: getResponsiveFontSize(context, baseFontSize: 21),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
    );
  }
  /// medium19
  static TextStyle poppinsMedium19(BuildContext context) {
    return TextStyle(
      color: blackClr,
      fontSize: getResponsiveFontSize(context, baseFontSize: 19),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
    );
  }

  // Alexandria
  /// regular10
  static TextStyle alexandriaRegular10(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF788597),
      fontSize: getResponsiveFontSize(context, baseFontSize: 10),
      fontFamily: 'Alexandria',
      fontWeight: FontWeight.w400,
    );
  }

  /// bold12
  static TextStyle alexandriaBold12(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF242424),
      fontSize: getResponsiveFontSize(context, baseFontSize: 12),
      fontFamily: 'Alexandria',
      fontWeight: FontWeight.w700,
    );
  }

} // AppStyles


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
