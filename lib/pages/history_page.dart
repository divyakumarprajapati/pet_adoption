import 'package:flutter/material.dart';
import 'package:pet_adoption/app_theme.dart';
import 'package:pet_adoption/components/pet_list_component.dart';
import 'package:pet_adoption/widgets/pet_list.dart';

class HistoryPage extends StatelessWidget {
  static const ROUTE_NAME = 'history_page';
  final PetListComponent petListComponent;
  final AppTheme appTheme;
  const HistoryPage({
    Key? key,
    required this.petListComponent,
    required this.appTheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    petListComponent.getPets(adopted: true);
    return Scaffold(
      backgroundColor: appTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: appTheme.backgroundColor,
        elevation: 0,
        actionsIconTheme: IconThemeData(size: 50),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 32,
            color: appTheme.iconColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'History',
          style: TextStyle(
            fontSize: 24,
            color: appTheme.textColor,
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
