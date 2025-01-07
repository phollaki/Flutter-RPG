import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rpg/models/character.dart';

class FirestoreService {
  static final ref = FirebaseFirestore.instance
      .collection('characters')
      .withConverter(
          fromFirestore: Character.fromFirestore,
          toFirestore: (Character c, _) => c.toFirestore());

  // add a new character
  static Future<void> addCharacter(Character character) async {
    await ref.doc(character.id).set(character);
  }

  // get all characters
  static Future<QuerySnapshot<Character>> getCharacters() {
    return ref.get();
  }

  // update a character
  static Future<void> updateCharacter(Character character) async {
    await ref.doc(character.id).update({
      'isFav': character.isFav,
      'points': character.points,
      'stats': character.statsAsMap,
      'skills': character.skills.map((s) => s.id).toList(),
    });
  }

  // delete a character
  static Future<void> deleteCharacter(String id) async {
    await ref.doc(id).delete();
  }
}
