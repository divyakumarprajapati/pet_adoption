import 'package:flutter/material.dart';
import 'package:pet_adoption/components/pet_list_component.dart';

class PetSearchField extends StatelessWidget {
  final PetListComponent petListComponent;
  PetSearchField({
    Key? key,
    required this.petListComponent,
  }) : super(key: key);
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
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
      child: Row(
        children: [
          Icon(Icons.search),
          SizedBox(width: 8.0),
          Expanded(
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search Pet',
                border: InputBorder.none,
              ),
              onChanged: (String value) {
                petListComponent.getPets(search: value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
