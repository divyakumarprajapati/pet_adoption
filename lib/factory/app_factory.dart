import 'package:pet_adoption/factory/component_factory.dart';
import 'package:pet_adoption/factory/route_factory.dart';
import 'package:pet_adoption/pet_adoption_app.dart';

class AppFactory {
  Future<PetAdoptionApp> buildPetAdoptionApp() async {
    ComponentFactory componentFactory = ComponentFactory();
    await componentFactory.init();
    RoutesFactory routesFactory = RoutesFactory(
      componentFactory: componentFactory,
    );
    routesFactory.init();
    return PetAdoptionApp(
      routesFactory: routesFactory,
    );
  }
}
