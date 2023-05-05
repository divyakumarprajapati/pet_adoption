import 'package:pet_adoption/factory/component_factory.dart';
import 'package:pet_adoption/pages/details_page.dart';
import 'package:pet_adoption/pages/history_page.dart';
import 'package:pet_adoption/pages/home_page.dart';

class RoutesFactory {
  final ComponentFactory componentFactory;
  RoutesFactory({required this.componentFactory});

  HomePage buildHomePage() {
    return HomePage(
      petListComponent: componentFactory.buildPetListComponent(),
    );
  }

  DetailsPage buildDetailsPage(int id) {
    return DetailsPage(
      petComponent: componentFactory.buildPetComponent(id),
    );
  }

  HistoryPage buildHistoryPage() {
    return HistoryPage(
      petListComponent: componentFactory.buildPetListComponent(),
    );
  }
}
