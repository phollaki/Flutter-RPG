import 'package:flutter/material.dart';
import 'package:rpg/models/vocation.dart';
import 'package:rpg/shared/styled_text.dart';
import 'package:rpg/theme.dart';

class VocationCard extends StatelessWidget {
  const VocationCard(
      {super.key,
      required this.vocation,
      required this.selected,
      required this.onTap});

  final Vocation vocation;
  final bool selected;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: selected ? AppColors.secondaryColor : Colors.transparent,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            children: [
              Image.asset(
                'assets/img/vocations/${vocation.image}',
                width: 80,
                colorBlendMode: BlendMode.color,
                color: selected
                    ? Colors.transparent
                    : Colors.black.withValues(alpha: 0.8),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StyledHeading(text: vocation.title),
                    StyledText(text: vocation.description),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
