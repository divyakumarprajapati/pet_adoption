import 'package:flutter/material.dart';
import 'package:pet_adoption/components/pet_list_component.dart';
import 'package:pet_adoption/widgets/pet_list.dart';

class HistoryPage extends StatelessWidget {
  static const ROUTE_NAME = 'history_page';
  final PetListComponent petListComponent;
  const HistoryPage({
    Key? key,
    required this.petListComponent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    petListComponent.getPets(adopted: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actionsIconTheme: IconThemeData(size: 50),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 32,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'History',
          style: TextStyle(
            fontSize: 24,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        child: PetList(petListComponent: petListComponent),
      ),
    );
  }
}
