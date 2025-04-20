import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedColorPalette extends StatefulWidget {
  const AnimatedColorPalette({super.key});

  @override
  State<AnimatedColorPalette> createState() => _AnimatedColorPaletteState();
}

class _AnimatedColorPaletteState extends State<AnimatedColorPalette> {
  List<Color> currentPalette = generateColorPalette();

  static List<Color> generateColorPalette() {
    final random = Random();
    return List.generate(
      5,
      (index) => Color.fromRGBO(
          random.nextInt(256), random.nextInt(256), random.nextInt(256), 1),
    );
  }

  void regeneratePalette() {
    setState(() {
      currentPalette = generateColorPalette();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Color Palette Demo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: double.maxFinite),
          Wrap(
            alignment: WrapAlignment.center,
            children: [
              for (var color in currentPalette) ...{
                AnimatedContainer(
                  duration: Durations.long2,
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: const EdgeInsets.all(10),
                ),
              }
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: regeneratePalette,
            child: const Text('Generate New Palette'),
          ),
        ],
      ),
    );
  }
}
