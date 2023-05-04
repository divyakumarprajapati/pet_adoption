import 'dart:async';

import 'package:pet_adoption/models/pet.dart';

class PetComponent {
  final List<Pet> pets;
  final int id;
  PetComponent({required this.pets, required this.id});

  StreamController<Pet> _subject = StreamController<Pet>();
  Stream<Pet> get pet => _subject.stream;

  void dispose() {
    _subject.close();
  }

  getPet() async {
    _subject.sink.add(pets.firstWhere((pet) {
      return pet.id == id;
    }));
  }
}
