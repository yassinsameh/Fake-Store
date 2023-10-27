import 'dart:ui';

import 'package:flutter/material.dart';

abstract class Palette {
  ///Primary color
  static const primaryColor1 = Color(0XFF7F298D);
  static const primaryColor2 = Color(0XFF9430A4);
  static const primaryColor3 = Color(0xFFA936BB);
  static const primaryColor4 = Color(0xFFB746C9);
  static const primaryColor5 = Color(0xFFC05DD0);
  static const primaryColor6 = Color(0xFFC974D7);
  static const primaryColor7 = Color(0xFFD28BDD);
  static const primaryColor8 = Color(0xFFDBA3E4);
  static const primaryColor9 = Color(0xFFE4BAEB);
  static const primaryColor10 = Color(0xFFF0E6F2);
  static const primaryColor11 = Color(0xFFF8F2F8);

  static const highlightedPrimaryColor = Color(0xFFFFE7E7);
  static final disabledPrimaryButton = primaryColor1.withOpacity(0.5);

  ///Secondary color
  static const secondaryColor1 = Color(0XFFFEA621);
  static const secondaryColor2 = Color(0XFFFEAF37);
  static const secondaryColor3 = Color(0XFFFEB84D);
  static const secondaryColor4 = Color(0XFFFEC164);
  static const secondaryColor5 = Color(0XFFFECA7A);
  static const secondaryColor6 = Color(0XFFFFD390);
  static const secondaryColor7 = Color(0XFFFFE4BC);
  static const secondaryColor8 = Color(0XFFFFEDD3);
  static const secondaryColor9 = Color(0XFFFFF6E9);
  static const secondaryColor10 = Color(0XFFFFFBF4);

  ///Third color
  static const thirdColor1 = Color(0XFF205B8C);
  static const thirdColor2 = Color(0XFF366B97);
  static const thirdColor3 = Color(0XFF4D7CA3);
  static const thirdColor4 = Color(0XFF638CAF);
  static const thirdColor5 = Color(0XFF799DBA);
  static const thirdColor6 = Color(0XFF8FADC5);
  static const thirdColor7 = Color(0XFFA6BDD1);
  static const thirdColor8 = Color(0XFFBCCEDD);

  static const thirdColor9 = Color(0XFFD2DEE8);
  static const thirdColor10 = Color(0xFFE9EFF3);
  static const thirdColor11 = Color(0xFFF5FBFF);

  ///Text colors
  static const black1 = Color(0xFF58595B);
  static const black2 = Color(0XFF67686A);
  static const black3 = Color(0XFF5C5C5C);
  static const black4 = Color(0XFF707070);
  static const black5 = Color(0XFF858585);
  static const black6 = Color(0XFF999999);
  static const black7 = Color(0XFFADADAD);
  static const black8 = Color(0XFFC2C2C2);
  static const black9 = Color(0XFFD6D6D6);
  static const black10 = Color(0XFFEBEBEB);
  static const black11 = Color(0XFFF5F5F5);

  static const blackDark = Color(0XFF262338);
  static const pensionBlack = Color(0xFF14132A);

  static const lightBlackTextColor = Color(0XFF686868);
  static const grayBackground1 = Color(0XFFEFF0F6);
  static const gray1 = Color(0XFFA0A3BD);
  static const gray2 = Color(0XFF4E4B66);
  static const gray3 = Color(0XFF999999);
  static const gray4 = Color(0xFFF6F7FB);
  static const stepsTile = Color(0XFF6E7191);
  static const lightTextColor = Color(0XFFC2C8CC);

  ///White
  static const whiteText = Colors.white;
  static const whiteBackground = Colors.white;

  ///General pages background
  static const backgroundColor = Colors.white;
  static const backgroundColor2 = Color(0XFFF7F7FC);

  ///Expanded text sections
  static const expansionLightColor = Color(0xFFFFFBF4);

  ///Buttons border & background colors
  static const buttonBorder = Color(0XFFE5E5E5);

  static const inputFieldColor = black11;
  static const inputFieldHint = black3;

  ///Other colors
  static const hintsDarkColor = Color(0xFF205B8C);
  static const successColor = Color(0xFF008A00);
  static const successLightColor = Color(0xFFEAF9DE);
  static const discountedPriceText = Color(0xFFD25F49);
  static const discountedPriceBackground = Color(0xFFFBCEC0);
  static const errorColor = Color(0xFFE52030);
  static const errorColorIcons = Color(0xFFFD6150);
  static const informationColor = Color(0xFF333333);

  ///Verification section
  static const verificationSectionBackground = Color(0xFFFBFBFB);
}
