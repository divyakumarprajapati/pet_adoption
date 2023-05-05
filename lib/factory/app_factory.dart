import 'package:pet_adoption/factory/component_factory.dart';
import 'package:pet_adoption/factory/route_factory.dart';
import 'package:pet_adoption/pet_adoption_app.dart';
import 'package:pet_adoption/preferences/adoption_preferences.dart';
import 'package:pet_adoption/preferences/dark_theme_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppFactory {
  Future<PetAdoptionApp> buildPetAdoptionApp() async {
    var preferences = await SharedPreferences.getInstance();
    AdoptionPreferences _adoptionPreferences =
        _buildAdoptionPreferences(preferences);
    DarkThemePreference _darkThemePreference =
        _buildDarkThemePreference(preferences);
    ComponentFactory componentFactory = ComponentFactory(
      adoptionPreferences: _adoptionPreferences,
    );
    await componentFactory.init();
    RoutesFactory routesFactory = RoutesFactory(
      componentFactory: componentFactory,
      darkThemePreference: _darkThemePreference,
    );
    return PetAdoptionApp(
      routesFactory: routesFactory,
    );
  }

  AdoptionPreferences _buildAdoptionPreferences(SharedPreferences preferences) {
    return AdoptionPreferences(
      preferences: preferences,
    );
  }

  DarkThemePreference _buildDarkThemePreference(SharedPreferences preferences) {
    return DarkThemePreference(
      preferences: preferences,
    );
  }
}
