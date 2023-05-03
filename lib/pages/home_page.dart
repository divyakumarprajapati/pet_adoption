import 'package:flutter/material.dart';
import 'package:pet_adoption/components/pet_list_component.dart';

class HomePage extends StatelessWidget {
  static const ROUTE_NAME = 'home_page';
  final PetListComponent petListComponent;
  const HomePage({
    Key? key,
    required this.petListComponent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(),
    );
  }
}
