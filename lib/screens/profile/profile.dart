import 'package:flutter/material.dart';
import 'package:rpg/models/character.dart';
import 'package:rpg/screens/profile/skill_list.dart';
import 'package:rpg/screens/profile/stats_table.dart';
import 'package:rpg/shared/styled_text.dart';
import 'package:rpg/theme.dart';

class Profile extends StatelessWidget {
  const Profile({super.key, required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StyledTitle(text: character.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              color: AppColors.secondaryColor.withValues(alpha: 0.5),
              child: Row(
                children: [
                  Image.asset(
                    "assets/img/vocations/${character.vocation.image}",
                    width: 140,
                    height: 140,
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StyledHeading(
                          text: character.vocation.title,
                        ),
                        StyledText(
                          text: character.vocation.description,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Icon(
                Icons.code,
                color: AppColors.primaryColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                padding: const EdgeInsets.all(16),
                color: AppColors.secondaryColor.withValues(alpha: 0.5),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const StyledHeading(text: "Slogan"),
                    StyledText(text: character.slogan),
                    const SizedBox(height: 10),
                    const StyledHeading(text: "Weapon of Choice"),
                    StyledText(text: character.vocation.weapon),
                    const SizedBox(height: 10),
                    const StyledHeading(text: "Unique Ability"),
                    StyledText(text: character.vocation.ability),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),

            Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  StatsTable(character),
                ],
              ),
            ),

            SkillList(character),

            // save button
          ],
        ),
      ),
    );
  }
}
