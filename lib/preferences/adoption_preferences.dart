import 'package:shared_preferences/shared_preferences.dart';

class AdoptionPreferences {
  static const String ADOPTED_PET_IDS = "adopted_pet_ids";
  final SharedPreferences preferences;
  AdoptionPreferences({required this.preferences});

  List<int>? _adoptedPetIds;

  List<int> get adoptedPetIds {
    if (_adoptedPetIds == null) {
      List<String> _adoptedPetStringIds =
          preferences.getStringList(ADOPTED_PET_IDS) ?? [];
      _adoptedPetIds = _adoptedPetStringIds.map((e) => int.parse(e)).toList();
    }
    return _adoptedPetIds ?? [];
  }

  set adoptedPetIds(List<int> value) {
    _adoptedPetIds = value;
    preferences.setStringList(
        ADOPTED_PET_IDS, value.map((e) => e.toString()).toList());
  }
}
