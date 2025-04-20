import 'package:flutter/material.dart';

class AnimatedShoppingCart extends StatefulWidget {
  const AnimatedShoppingCart({super.key});

  @override
  State<AnimatedShoppingCart> createState() => _AnimatedShoppingCartState();
}

class _AnimatedShoppingCartState extends State<AnimatedShoppingCart> {
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
  }

  void toggle() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Shopping Cart'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: toggle,
          child: AnimatedContainer(
            duration: Durations.extralong4,
            width: isExpanded ? 50 : 180,
            height: 50,
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: isExpanded ? Colors.blue : Colors.green,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: isExpanded
                  ? Icon(
                      Icons.shopping_cart_checkout,
                      color: Colors.white,
                    )
                  : Row(
                      children: [
                        SizedBox(width: 20),
                        Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: const Text(
                            'Added to Cart!',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              overflow: TextOverflow.fade,
                            ),
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
