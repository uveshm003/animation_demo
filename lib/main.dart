import 'package:animation_demo/explicit_animation/list_animation.dart';
import 'package:animation_demo/explicit_animation/login_screen_animation.dart';
import 'package:animation_demo/implicit_animation/animated_color_palette.dart';
import 'package:animation_demo/implicit_animation/animated_shopping_cart.dart';
import 'package:animation_demo/implicit_animation/pulsating_circle_animation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animation Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: double.maxFinite,
            height: 20,
          ),
          ...List.generate(
            myAnimationPages.length,
            (index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return myAnimationPages[index].widget;
                        },
                      ),
                    );
                  },
                  child: Text(myAnimationPages[index].name),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

List<NavigationModel> myAnimationPages = [
  NavigationModel(
    name: 'Animated Color Pallette',
    widget: AnimatedColorPalette(),
  ),
  NavigationModel(
    name: 'Animated Shopping Cart',
    widget: AnimatedShoppingCart(),
  ),
  NavigationModel(
    name: 'Pulsating Circle Animation',
    widget: PulsatingCircleAnimation(),
  ),
  NavigationModel(
    name: 'Login Screen Animation',
    widget: LoginScreenAnimation(),
  ),
  NavigationModel(
    name: 'List Animation',
    widget: ListAnimation(),
  ),
];

class NavigationModel {
  final String name;
  final Widget widget;

  NavigationModel({required this.name, required this.widget});
}
