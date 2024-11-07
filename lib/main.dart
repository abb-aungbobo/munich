import 'package:flutter/material.dart';
import 'package:munich/app/munich_app.dart';
import 'package:munich/locator/locator.dart';

void main() {
  setupLocator();
  runApp(const MunichApp());
}
