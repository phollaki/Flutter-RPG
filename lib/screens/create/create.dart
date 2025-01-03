import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rpg/models/character.dart';
import 'package:rpg/models/vocation.dart';
import 'package:rpg/screens/create/vocation_card.dart';
import 'package:rpg/screens/home/home.dart';
import 'package:rpg/shared/styled_button.dart';
import 'package:rpg/shared/styled_text.dart';
import 'package:rpg/theme.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  final _nameController = TextEditingController();
  final _sloganController = TextEditingController();
  Vocation vocation = Vocation.values[0];

  @override
  void dispose() {
    _nameController.dispose();
    _sloganController.dispose();
    super.dispose();
  }

  handleSubmit() {
    var name = _nameController.text.trim();
    var slogan = _sloganController.text.trim();

    if (name.isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const StyledHeading(text: 'Name is required'),
          content:
              const StyledText(text: 'Please enter a name for your character'),
          actions: [
            StyledButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const StyledHeading(text: 'Close'),
            ),
          ],
        ),
      );
      return;
    }

    if (slogan.isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const StyledHeading(text: 'Slogan is required'),
          content: const StyledText(
              text: 'Please enter a slogan for your character'),
          actions: [
            StyledButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: StyledHeading(text: 'Close'),
            ),
          ],
        ),
      );
      return;
    }

    characters.add(
      Character(
        id: uuid.v4(),
        name: name,
        slogan: slogan,
        vocation: vocation,
      ),
    );

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Home()),
    );
  }

  selectVocation(Vocation v) {
    setState(() {
      vocation = v;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StyledTitle(text: 'Character creation'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            children: [
              Center(
                child: Icon(
                  Icons.code,
                  color: AppColors.primaryColor,
                  size: 30,
                ),
              ),
              const Center(
                child: StyledHeading(text: 'Welcome new player'),
              ),
              const Center(
                child: StyledText(
                    text: 'Create a name and slogan for your character'),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: _nameController,
                style: GoogleFonts.kanit(
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                cursorColor: AppColors.textColor,
                decoration: const InputDecoration(
                  label: StyledText(text: 'Character name'),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _sloganController,
                style: GoogleFonts.kanit(
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                cursorColor: AppColors.textColor,
                decoration: const InputDecoration(
                  label: StyledText(text: 'Slogan'),
                  prefixIcon: Icon(Icons.chat),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Icon(
                  Icons.code,
                  color: AppColors.primaryColor,
                  size: 30,
                ),
              ),
              const Center(
                child: StyledHeading(text: 'Choose a vocation'),
              ),
              const Center(
                child:
                    StyledText(text: 'This determines your available skills.'),
              ),
              const SizedBox(height: 20),
              for (int i = 0; i < Vocation.values.length; i++)
                VocationCard(
                    onTap: () => selectVocation(Vocation.values[i]),
                    vocation: Vocation.values[i],
                    selected: Vocation.values[i].title == vocation.title),
              const SizedBox(height: 10),
              Center(
                child: Icon(
                  Icons.code,
                  color: AppColors.primaryColor,
                  size: 30,
                ),
              ),
              const Center(
                child: StyledHeading(text: 'Good luck!'),
              ),
              const Center(
                child: StyledText(text: 'And enjoy the journey.'),
              ),
              const SizedBox(height: 20),
              StyledButton(
                onPressed: handleSubmit,
                child: StyledHeading(text: 'Create character'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
