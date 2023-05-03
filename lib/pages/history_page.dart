import 'package:flutter/material.dart';
import 'package:pet_adoption/components/pet_list_component.dart';

class HistoryPage extends StatelessWidget {
  static const ROUTE_NAME = 'history_page';
  final PetListComponent petListComponent;
  const HistoryPage({
    Key? key,
    required this.petListComponent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
      ),
      body: Container(),
    );
  }
}
