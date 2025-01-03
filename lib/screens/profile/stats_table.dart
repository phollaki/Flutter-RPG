import 'package:flutter/material.dart';
import 'package:rpg/models/character.dart';
import 'package:rpg/screens/profile/skill_list.dart';
import 'package:rpg/shared/styled_text.dart';
import 'package:rpg/theme.dart';

class StatsTable extends StatefulWidget {
  const StatsTable(this.character, {super.key});

  final Character character;

  @override
  State<StatsTable> createState() => _StatsTableState();
}

class _StatsTableState extends State<StatsTable> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            color: AppColors.secondaryColor,
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  color:
                      widget.character.points > 0 ? Colors.yellow : Colors.grey,
                ),
                const SizedBox(width: 20),
                const StyledText(text: "Available points: "),
                Expanded(
                  child: const SizedBox(width: 20),
                ),
                StyledHeading(
                  text: widget.character.points.toString(),
                ),
              ],
            ),
          ),
          Table(
            children: widget.character.statsAsFormattedList.map(
              (stat) {
                return TableRow(
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor.withValues(alpha: 0.5),
                  ),
                  children: [
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: StyledHeading(
                          text: stat['title']!,
                        ),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: StyledHeading(
                          text: stat['value']!,
                        ),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: IconButton(
                        icon: Icon(Icons.arrow_upward),
                        color: AppColors.textColor,
                        onPressed: () {
                          setState(() {
                            widget.character.increaseStat(stat['title']!);
                          });
                        },
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: IconButton(
                        icon: Icon(Icons.arrow_downward),
                        color: AppColors.textColor,
                        onPressed: () {
                          setState(() {
                            widget.character.decreaseStat(stat['title']!);
                          });
                        },
                      ),
                    )
                  ],
                );
              },
            ).toList(),
          ),
        ],
      ),
    );
  }
}
