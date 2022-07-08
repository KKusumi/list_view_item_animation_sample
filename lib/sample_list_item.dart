import 'package:flutter/material.dart';

class SampleListItem extends StatefulWidget {
  const SampleListItem({super.key, required this.name});

  final String name;

  @override
  State<StatefulWidget> createState() => SampleListItemState();
}

class SampleListItemState extends State<SampleListItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final opacityAnimation = Tween<double>(
      begin: 1.0,
      end: 0.3,
    ).animate(_animationController);

    var opacityAnimationCounter = 0;
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        if (opacityAnimationCounter < 2) {
          _animationController.forward();
          opacityAnimationCounter++;
        } else {
          opacityAnimationCounter = 0;
        }
      }
    });

    return FadeTransition(
      opacity: opacityAnimation,
      child: Container(
        color: Colors.teal,
        padding: const EdgeInsets.all(16),
        child: Text(widget.name),
      ),
    );
  }

  void animate() {
    _animationController.forward();
  }
}
