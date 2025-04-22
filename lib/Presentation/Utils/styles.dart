import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const TextStyle styleTextSplash = TextStyle(
  fontSize: 30.0,
  fontWeight: FontWeight.bold,
  color: Color.fromARGB(255, 255, 255, 255),
);

marginBtn() {
  return const EdgeInsets.only(bottom: 5);
}

textStyle({
  required double fontSize,
  required FontWeight fontWeight,
  required Color colortext,
}) {
  //quiero mejor una fuente descargada
  return GoogleFonts.krub(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: colortext,
  );
}

colorText() {
  return Color.fromARGB(221, 36, 35, 35);
}

paddingDefauld() {
  return const EdgeInsets.symmetric(horizontal: 20);
}

fullWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

fullHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

paddingBtn() {
  return const EdgeInsets.only(top: 15.0, bottom: 15.0);
}
