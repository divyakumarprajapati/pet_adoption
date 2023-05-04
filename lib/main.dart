import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pet_adoption/factory/app_factory.dart';
import 'package:pet_adoption/pet_adoption_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  PetAdoptionApp app = await AppFactory().buildPetAdoptionApp();
  runApp(app);
}
