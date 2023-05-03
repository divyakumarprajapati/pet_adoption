import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:pet_adoption/components/pet_component.dart';
import 'package:pet_adoption/components/pet_list_component.dart';
import 'package:pet_adoption/models/pet.dart';

class ComponentFactory {
  late List<Pet> pets;

  void init() async {
    String _petsJson = await rootBundle.loadString('lib/pets.json');
    List<Map<String, dynamic>> _pets = json.decode(_petsJson);
    pets = _pets.map((pet) => Pet.fromJson(pet)).toList();
  }

  PetComponent buildPetComponent(int id) {
    return PetComponent(id: id, pets: pets);
  }

  PetListComponent buildPetListComponent() {
    return PetListComponent(pets: pets);
  }
}
