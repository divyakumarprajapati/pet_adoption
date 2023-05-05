import 'dart:async';
import 'package:pet_adoption/models/pet.dart';
import 'package:pet_adoption/preferences/adoption_preferences.dart';

class PetComponent {
  final List<Pet> pets;
  final int id;
  AdoptionPreferences adoptionPreferences;
  PetComponent({
    required this.pets,
    required this.id,
    required this.adoptionPreferences,
  });

  StreamController<Pet> _subject = StreamController<Pet>();
  Stream<Pet> get pet => _subject.stream;

  void dispose() {
    _subject.close();
  }

  late Pet _pet;
  late List<int> _adoptedPetIds;

  getPet() async {
    _adoptedPetIds = adoptionPreferences.adoptedPetIds;
    _pet = pets.firstWhere((pet) {
      return pet.id == id;
    });
    if (_adoptedPetIds.contains(id)) {
      _pet.adopt();
    }
    _subject.sink.add(_pet);
  }

  adoptPet() async {
    _pet.adopt();
    _adoptedPetIds.add(id);
    adoptionPreferences.adoptedPetIds = _adoptedPetIds;
    _subject.sink.add(_pet);
  }
}
