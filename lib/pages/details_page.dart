import 'package:flutter/material.dart';
import 'package:pet_adoption/components/pet_component.dart';
import 'package:pet_adoption/models/pet.dart';

class DetailsPage extends StatelessWidget {
  static const ROUTE_NAME = 'details_page';
  final PetComponent petComponent;
  const DetailsPage({
    Key? key,
    required this.petComponent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    petComponent.getPet();
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: SafeArea(
        child: StreamBuilder<Pet>(
            stream: petComponent.pet,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else if (snapshot.hasData) {
                return Column(
                  children: [
                    Hero(
                      tag: 'pet_image_${snapshot.data!.id}',
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: SizedBox(
                          width: double.maxFinite,
                          child: Image.asset(
                            snapshot.data?.image ?? '',
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
