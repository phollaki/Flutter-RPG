import 'package:flutter/material.dart';
import 'package:rpg/models/character.dart';
import 'package:rpg/models/skill.dart';
import 'package:rpg/shared/styled_text.dart';
import 'package:rpg/theme.dart';

class SkillList extends StatefulWidget {
  const SkillList(this.character, {super.key});

  final Character character;

  @override
  State<SkillList> createState() => _SkillListState();
}

class _SkillListState extends State<SkillList> {
  // late will be declared but not initialized, later it will be initialized in the initState method
  late List<Skill> availableSkills;

  @override
  void initState() {
    availableSkills = allSkills.where((skill) {
      return skill.vocation == widget.character.vocation;
    }).toList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
          color: AppColors.secondaryColor.withValues(alpha: 0.5),
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const StyledHeading(text: "Choose an active skill"),
              const StyledText(text: "Skills are unique to your vocation"),
              const SizedBox(height: 10),
              Row(
                children: availableSkills.map((skill) {
                  return Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(2),
                    child: Image.asset(
                      "assets/img/skills/${skill.image}",
                      width: 70,
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 10),
            ],
          )),
    );
  }
}
