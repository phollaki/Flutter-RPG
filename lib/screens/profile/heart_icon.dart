import 'package:flutter/material.dart';
import 'package:rpg/models/character.dart';
import 'package:rpg/theme.dart';

class HeartIcon extends StatefulWidget {
  const HeartIcon({super.key, required this.character});

  final Character character;

  @override
  State<HeartIcon> createState() => _HeartIconState();
}

class _HeartIconState extends State<HeartIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _sizeAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _sizeAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 25.0, end: 40.0), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 40.0, end: 25.0), weight: 50),
    ]).animate(_controller);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => IconButton(
        onPressed: () => {
          widget.character.toggleIsFav(),
          _controller.reset(),
          _controller.forward(),
        },
        icon: Icon(
          Icons.favorite,
          color: widget.character.isFav ? AppColors.primaryColor : Colors.grey,
          size: _sizeAnimation.value,
        ),
      ),
    );
  }
}
