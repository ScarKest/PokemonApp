import 'package:flutter/material.dart';
import 'package:pokemon_app/app.dart';
import 'injection_container.dart' as di;

void main() async{
  await di.init();
  runApp(const MyApp());
}
