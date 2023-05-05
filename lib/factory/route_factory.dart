import 'package:pet_adoption/app_theme.dart';
import 'package:pet_adoption/factory/component_factory.dart';
import 'package:pet_adoption/pages/details_page.dart';
import 'package:pet_adoption/pages/history_page.dart';
import 'package:pet_adoption/pages/home_page.dart';
import 'package:pet_adoption/preferences/dark_theme_preference.dart';

class RoutesFactory {
  final ComponentFactory componentFactory;
  final DarkThemePreference darkThemePreference;
  RoutesFactory({
    required this.componentFactory,
    required this.darkThemePreference,
  });

  AppTheme get _appTheme => AppTheme(
        darkThemeStatus: darkThemePreference.darkThemeStatus,
      );

  HomePage buildHomePage() {
    return HomePage(
      petListComponent: componentFactory.buildPetListComponent(),
      darkThemePreference: darkThemePreference,
    );
  }

  DetailsPage buildDetailsPage(int id) {
    return DetailsPage(
      petComponent: componentFactory.buildPetComponent(id),
      appTheme: _appTheme,
    );
  }

  HistoryPage buildHistoryPage() {
    return HistoryPage(
      petListComponent: componentFactory.buildPetListComponent(),
      appTheme: _appTheme,
    );
  }
}
