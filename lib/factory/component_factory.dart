import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:pet_adoption/components/pet_component.dart';
import 'package:pet_adoption/components/pet_list_component.dart';
import 'package:pet_adoption/models/pet.dart';
import 'package:pet_adoption/preferences/adoption_preferences.dart';

class ComponentFactory {
  late List<Pet> pets;
  AdoptionPreferences adoptionPreferences;
  ComponentFactory({required this.adoptionPreferences});

  Future<void> init() async {
    String _petsJson = await rootBundle.loadString('lib/pets.json');
    List<dynamic> _pets = json.decode(_petsJson);
    pets = _pets.map((pet) => Pet.fromJson(pet)).toList();
  }

  PetComponent buildPetComponent(int id) {
    return PetComponent(
      id: id,
      pets: pets,
      adoptionPreferences: adoptionPreferences,
    );
  }

  PetListComponent buildPetListComponent() {
    return PetListComponent(
      pets: pets,
      adoptionPreferences: adoptionPreferences,
    );
  }
}
