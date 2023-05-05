import 'package:flutter/material.dart';
import 'package:pet_adoption/factory/route_factory.dart';
import 'package:pet_adoption/pages/details_page.dart';
import 'package:pet_adoption/pages/history_page.dart';
import 'package:pet_adoption/pages/home_page.dart';

class PetAdoptionApp extends StatelessWidget {
  final RoutesFactory routesFactory;
  const PetAdoptionApp({Key? key, required this.routesFactory})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Adoption App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.ROUTE_NAME,
      routes: {
        HomePage.ROUTE_NAME: (context) => routesFactory.buildHomePage(),
        HistoryPage.ROUTE_NAME: (context) => routesFactory.buildHistoryPage(),
      },
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case DetailsPage.ROUTE_NAME:
            late int id;
            if (settings.arguments is int) {
              id = settings.arguments as int;
            }
            return MaterialPageRoute(
              builder: (context) => routesFactory.buildDetailsPage(id),
            );
        }
      },
    );
  }
}
