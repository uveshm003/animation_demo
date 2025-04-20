import 'package:flutter/material.dart';

class PulsatingCircleAnimation extends StatelessWidget {
  const PulsatingCircleAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pulsating Circle Animation'),
      ),
      body: Center(
        child: TweenAnimationBuilder<double>(
          tween: Tween(begin: 0, end: 200),
          duration: Duration(milliseconds: 1200),
          builder: (context, tween, child) {
            return Container(
              width: tween,
              height: tween,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withAlpha(125),
                    blurRadius: tween,
                    spreadRadius: tween / 2,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
