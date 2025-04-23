import 'package:flutter/material.dart';

class BouncingBallAnimation extends StatefulWidget {
  const BouncingBallAnimation({super.key});

  @override
  State<BouncingBallAnimation> createState() => _BouncingBallAnimationState();
}

class _BouncingBallAnimationState extends State<BouncingBallAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> bouncingBallAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    bouncingBallAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      animationController,
    );
    bouncingBallAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animationController.forward();
      }
    });

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bouncing Ball Animation"),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AnimatedBuilder(
              animation: bouncingBallAnimation,
              builder: (context, child) {
                return CustomPaint(
                  size: Size(200, 200),
                  painter: BouncingBallPainter(bouncingBallAnimation.value),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class BouncingBallPainter extends CustomPainter {
  final double animationValue;
  const BouncingBallPainter(this.animationValue);
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
      Offset(
        size.width / 2,
        size.height - (size.height * animationValue),
      ),
      20,
      Paint()..color = Colors.blue,
    );
  }

  @override
  bool shouldRepaint(BouncingBallPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(BouncingBallPainter oldDelegate) => false;
}
