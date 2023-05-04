import 'dart:async';
import 'package:pet_adoption/models/pet.dart';

class PetListComponent {
  final List<Pet> pets;
  PetListComponent({required this.pets});

  StreamController<List<Pet>> _subject = StreamController<List<Pet>>();
  Stream<List<Pet>> get petList => _subject.stream;

  void dispose() {
    _subject.close();
  }

  getPets({String? search}) async {
    List<Pet> _filteredPets = pets.where((pet) {
      return pet.name.toLowerCase().contains(search?.toLowerCase() ?? '');
    }).toList();
    _subject.sink.add(_filteredPets);
  }
}
