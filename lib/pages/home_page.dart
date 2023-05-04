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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
        actionsIconTheme: IconThemeData(size: 50),
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            size: 32,
          ),
          onPressed: () {},
        ),
      ),
      body: Stack(
        alignment: AlignmentDirectional.topStart,
        children: [
          Container(
            width: size.width,
            height: size.height,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50.0,
                ),
                const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
