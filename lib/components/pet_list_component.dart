import 'dart:async';
import 'package:pet_adoption/models/pet.dart';
import 'package:pet_adoption/preferences/adoption_preferences.dart';

class PetListComponent {
  final List<Pet> pets;
  AdoptionPreferences adoptionPreferences;
  PetListComponent({
    required this.pets,
    required this.adoptionPreferences,
  });

  StreamController<List<Pet>> _subject = StreamController<List<Pet>>();
  Stream<List<Pet>> get petList => _subject.stream;

  void dispose() {
    _subject.close();
  }

  late List<int> _adoptedPetIds;

  getPets({String? search, bool adopted = false}) async {
    _adoptedPetIds = adoptionPreferences.adoptedPetIds;
    List<Pet> _filteredPets = pets.where((pet) {
      return pet.name.toLowerCase().contains(search?.toLowerCase() ?? '');
    }).toList();
    _filteredPets.forEach((pet) {
      if (_adoptedPetIds.contains(pet.id)) {
        pet.adopt();
      }
    });
    if (adopted) {
      _filteredPets = _filteredPets.where((pet) => pet.adopted).toList();
    }
    _subject.sink.add(_filteredPets);
  }
}
