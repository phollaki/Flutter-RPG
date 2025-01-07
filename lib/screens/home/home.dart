import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rpg/screens/create/create.dart';
import 'package:rpg/screens/home/character_card.dart';
import 'package:rpg/services/character_store.dart';
import 'package:rpg/shared/styled_button.dart';
import 'package:rpg/shared/styled_text.dart';
import 'package:rpg/theme.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  initState() {
    Provider.of<CharacterStore>(context, listen: false).fetchCharacters();
    super.initState();
  }

  navigateToCreate() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CreateScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StyledTitle(text: "Your Character"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Consumer<CharacterStore>(
                builder: (context, value, child) {
                  return ListView.builder(
                    itemCount: value.characters.length,
                    itemBuilder: (_, index) {
                      return Dismissible(
                        key: Key(value.characters[index].id),
                        onDismissed: (direction) {
                          Provider.of<CharacterStore>(context, listen: false)
                              .removeCharacter(
                            value.characters[index].id,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: AppColors.secondaryColor,
                              content: const Text("Character removed!"),
                              showCloseIcon: true,
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        },
                        child: CharacterCard(
                          value.characters[index],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            StyledButton(
              onPressed: navigateToCreate,
              child: StyledHeading(text: "Create new"),
            ),
          ],
        ),
      ),
    );
  }
}
