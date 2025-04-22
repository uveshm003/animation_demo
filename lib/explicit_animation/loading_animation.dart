import 'package:flutter/material.dart';

class RadialLoadingAnimation extends StatefulWidget {
  const RadialLoadingAnimation({super.key});

  @override
  State<RadialLoadingAnimation> createState() => _RadialLoadingAnimationState();
}

class _RadialLoadingAnimationState extends State<RadialLoadingAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> radialLoadingAnimation;
  int progressValue = 65;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    radialLoadingAnimation = Tween<double>(
      begin: 0,
      end: progressValue.toDouble(),
    ).animate(
      animationController,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Radial Loading Animation'),
      ),
      body: Center(
        child: AnimatedBuilder(
          builder: (context, child) {
            return Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 160,
                  height: 160,
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                    value: (radialLoadingAnimation.value / 100),
                    strokeWidth: 10,
                  ),
                ),
                Text(
                  '${radialLoadingAnimation.value.toInt()}%',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            );
          },
          animation: radialLoadingAnimation,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (animationController.isCompleted) {
            animationController.reverse();
          } else {
            animationController.forward();
          }
        },
        child: const Icon(Icons.start),
      ),
    );
  }
}
