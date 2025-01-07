import 'package:flutter/material.dart';
import 'package:rpg/models/character.dart';
import 'package:rpg/screens/profile/profile.dart';
import 'package:rpg/shared/styled_text.dart';
import 'package:rpg/theme.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard(this.character, {super.key});

  final Character character;

  @override
  Widget build(BuildContext context) {
    navigateToCharacterDetails() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Profile(character: character),
        ),
      );
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Hero(
              tag: character.id,
              child: Image.asset(
                'assets/img/vocations/${character.vocation.image}',
                width: 80,
              ),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StyledHeading(text: character.name),
                StyledText(text: character.vocation.title)
              ],
            ),
            Expanded(child: SizedBox()),
            IconButton(
              onPressed: navigateToCharacterDetails,
              icon: Icon(
                Icons.arrow_right,
                color: AppColors.textColor,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
