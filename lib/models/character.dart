import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rpg/models/skill.dart';
import 'package:rpg/models/stats.dart';
import 'package:rpg/models/vocation.dart';

class Character with Stats {
  // constructor
  Character({
    required this.name,
    required this.slogan,
    required this.vocation,
    required this.id,
  });

  // fields
  final Set<Skill> skills = {};
  final Vocation vocation;
  final String name;
  final String slogan;
  final String id;
  bool _isFav = false;

  // getters
  bool get isFav => _isFav;

  // setters
  void toggleIsFav() {
    _isFav = !_isFav;
  }

  void updateSkill(Skill skill) {
    skills.clear();
    skills.add(skill);
  }

  // character to firestore (map)
  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'slogan': slogan,
      'vocation': vocation.toString(),
      'skills': skills.map((skill) => skill.id).toList(),
      'stats': statsAsMap,
      'points': points,
      'isFav': _isFav,
    };
  }

  // character from firestore
  factory Character.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;

    final character = Character(
      id: snapshot.id,
      name: data['name'],
      slogan: data['slogan'],
      vocation: Vocation.values.firstWhere(
        (vocation) => vocation.toString() == data['vocation'],
      ),
    );

    for (String id in data['skills']) {
      Skill skill = allSkills.firstWhere((element) => element.id == id);
      character.updateSkill(skill);
    }

    if (data['isFav'] == true) {
      character.toggleIsFav();
    }

    character.setStats(points: data['points'], stats: data['stats']);

    return character;
  }
}
