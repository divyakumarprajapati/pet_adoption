import 'package:flutter/material.dart';
import 'package:pet_adoption/components/pet_component.dart';

class DetailsPage extends StatelessWidget {
  static const ROUTE_NAME = 'details_page';
  final PetComponent petComponent;
  const DetailsPage({
    Key? key,
    required this.petComponent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Container(),
    );
  }
}
