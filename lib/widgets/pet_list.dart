import 'package:flutter/material.dart';
import 'package:pet_adoption/components/pet_list_component.dart';
import 'package:pet_adoption/models/pet.dart';
import 'package:pet_adoption/pages/details_page.dart';

class PetList extends StatelessWidget {
  final PetListComponent petListComponent;
  const PetList({
    Key? key,
    required this.petListComponent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Pet>>(
      stream: petListComponent.petList,
      builder: (context, AsyncSnapshot<List<Pet>> snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else if (snapshot.hasData) {
          return ListView.builder(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            itemBuilder: (context, index) {
              Pet _pet = snapshot.data![index];
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    DetailsPage.ROUTE_NAME,
                    arguments: _pet.id,
                  ).then((value) => petListComponent.getPets());
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10,
                  ),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  width: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                        tag: 'pet_image_${_pet.id}',
                        createRectTween: (Rect? begin, Rect? end) {
                          return MaterialRectCenterArcTween(
                              begin: begin, end: end);
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Stack(
                            children: [
                              SizedBox(
                                height: 200,
                                width: double.maxFinite,
                                child: ColorFiltered(
                                  colorFilter: ColorFilter.mode(
                                    _pet.adopted
                                        ? Colors.grey
                                        : Colors.transparent,
                                    BlendMode.saturation,
                                  ),
                                  child: Image.asset(
                                    _pet.image,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                              if (_pet.adopted)
                                Padding(
                                  padding: const EdgeInsets.only(top: 90.0),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Already Adopted',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 8.0,
                          top: 8.0,
                          right: 8.0,
                        ),
                        child: Row(
                          children: [
                            Text(
                              _pet.name,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 3.0),
                              child: Text(
                                '(${_pet.age} years)',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Spacer(),
                            Text(
                              'Rs. ${_pet.price}',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
            itemCount: snapshot.data?.length,
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
