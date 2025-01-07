import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rpg/models/character.dart';
import 'package:rpg/services/firestore_service.dart';

class CharacterStore extends ChangeNotifier {
  final List<Character> _characters = [];

  get characters => _characters;

  void fetchCharacters() async {
    if (characters.length == 0) {
      QuerySnapshot<Character> snapshot =
          await FirestoreService.getCharacters();

      for (var doc in snapshot.docs) {
        _characters.add(doc.data());
      }

      notifyListeners();
    }
  }

  void addCharacter(Character character) {
    FirestoreService.addCharacter(character);

    _characters.add(character);
    notifyListeners();
  }

  void save(Character character) async {
    await FirestoreService.updateCharacter(character);
    return;
  }

  void removeCharacter(String id) {
    FirestoreService.deleteCharacter(id);

    _characters.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
