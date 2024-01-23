import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quotes_app/utils/app_routes..dart';
import 'package:quotes_app/utils/global.dart';
import 'dart:io';

void main()
{
  convert();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
     routes:app_routes,
    ),
  );
}