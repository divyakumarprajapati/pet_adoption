import 'package:flutter/material.dart';
import 'package:pet_adoption/components/pet_list_component.dart';
import 'package:pet_adoption/pages/history_page.dart';
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
        leading: Container(
          height: 32,
          width: 32,
          margin: EdgeInsets.only(left: 12),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/app_icon.png'),
            ),
            shape: BoxShape.circle,
          ),
        ),
        leadingWidth: 50,
        title: Text(
          'Home',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  HistoryPage.ROUTE_NAME,
                );
              },
              icon: const Icon(
                Icons.bookmark_sharp,
                size: 36,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
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
      ),
    );
  }
}
