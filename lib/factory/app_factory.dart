import 'package:pet_adoption/factory/component_factory.dart';
import 'package:pet_adoption/factory/route_factory.dart';
import 'package:pet_adoption/pet_adoption_app.dart';

class AppFactory {
  PetAdoptionApp buildPetAdoptionApp() {
    ComponentFactory componentFactory = ComponentFactory();
    componentFactory.init();
    RoutesFactory routesFactory = RoutesFactory(
      componentFactory: componentFactory,
    );
    routesFactory.init();
    return PetAdoptionApp(
      routesFactory: routesFactory,
    );
  }
}
