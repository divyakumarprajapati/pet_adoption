// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pet_adoption/components/pet_list_component.dart';

import 'package:pet_adoption/models/pet.dart';
import 'package:pet_adoption/pages/home_page.dart';
import 'package:pet_adoption/preferences/adoption_preferences.dart';
import 'package:pet_adoption/preferences/dark_theme_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('test search in home screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    SharedPreferences preferences = await SharedPreferences.getInstance();
    PetListComponent petListComponent = PetListComponent(
      pets: [
        Pet(
          id: 1,
          name: 'name',
          age: 12,
          price: 200,
          image: 'assets/dogs1.jpg',
        ),
        Pet(
          id: 2,
          name: 'game',
          age: 12,
          price: 200,
          image: 'assets/dogs1.jpg',
        ),
        Pet(
          id: 3,
          name: 'lame',
          age: 12,
          price: 200,
          image: 'assets/dogs1.jpg',
        ),
      ],
      adoptionPreferences: AdoptionPreferences(
        preferences: preferences,
      ),
    );
    await tester.pumpWidget(
      HomePage(
        petListComponent: petListComponent,
        darkThemePreference: DarkThemePreference(preferences: preferences),
      ),
    );

    expect(find.text('name'), findsOneWidget);
    expect(find.text('game'), findsOneWidget);
    expect(find.text('lame'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'na');

    expect(find.text('name'), findsOneWidget);
    expect(find.text('game'), findsNothing);
    expect(find.text('lame'), findsNothing);
  });
}
