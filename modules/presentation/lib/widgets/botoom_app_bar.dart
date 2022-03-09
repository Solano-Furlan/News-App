import 'package:flutter/material.dart';

class CustomBottomAppBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) setActiveIndex;
  const CustomBottomAppBar({
    Key? key,
    required this.currentIndex,
    required this.setActiveIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 2,
          width: double.infinity,
          color: Colors.grey.shade300,
        ),
        Container(
            height: 70,
            width: double.infinity,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () => setActiveIndex(0),
                  icon: const Icon(
                    Icons.home,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () => setActiveIndex(1),
                  icon: const Icon(
                    Icons.search,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () => setActiveIndex(2),
                  icon: const Icon(
                    Icons.favorite_border_outlined,
                    size: 30,
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
