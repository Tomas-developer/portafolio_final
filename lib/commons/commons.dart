
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
/*
const primaryColor = Color.fromARGB(255, 218, 186, 223);
const secondaryColor = Color.fromARGB(255, 60, 49, 62);
const titleLetterColor = Color.fromARGB(255, 81, 26, 88);
const iconsColor = Color.fromARGB(255, 81, 17, 86);
const colorText = Color.fromARGB(255, 235, 197, 236);
*/

const primaryColor = Color.fromRGBO(236, 206, 238, 1);
const secondaryColor = Color.fromARGB(255, 56, 40, 35);
const titleLetterColor = Color.fromARGB(255, 56, 40, 35);
const iconsColor = Color.fromARGB(255, 56, 40, 35);
const colorText =  Color.fromARGB(255, 236, 206, 238);

Function launchUrlFunction = (String url) async {
  Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    throw 'No se puede abrir $url';
  }
  
};