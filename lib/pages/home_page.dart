import 'package:flutter/material.dart';
import 'package:pet_adoption/components/pet_list_component.dart';
import 'package:pet_adoption/widgets/pet_list.dart';
import 'package:pet_adoption/widgets/pet_serach_field.dart';

class HomePage extends StatelessWidget {
  static const ROUTE_NAME = 'home_page';
  final PetListComponent petListComponent;
  const HomePage({
    Key? key,
    required this.petListComponent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    petListComponent.getPets();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actionsIconTheme: IconThemeData(size: 50),
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: const Icon(
            Icons.menu,
            size: 32,
            color: Colors.black,
          ),
        ),
        title: Text(
          'Home',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
        actions: [
          Container(
            height: 36,
            width: 36,
            margin: EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/app_icon.png'),
              ),
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: PetSearchField(petListComponent: petListComponent),
              ),
              Expanded(
                child: PetList(petListComponent: petListComponent),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
