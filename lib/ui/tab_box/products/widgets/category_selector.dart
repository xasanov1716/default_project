import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CategorySelector extends StatelessWidget {
  const CategorySelector({
    super.key,
    required this.categories,
    required this.onCategorySelected,
  });

  final List<String> categories;
  final ValueChanged<String> onCategorySelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ZoomTapAnimation(
              onTap: () {
                onCategorySelected.call("");
              },
              child: Container(
                  height: 60,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white),
                  child: Center(child: const Text("All")))),
          ...List.generate(categories.length, (index) {
            return ZoomTapAnimation(
              onTap: () {
                onCategorySelected.call(categories[index]);
              },
              child: Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.only(left: 6, right: 6),
                height: 60,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white),
                child: Center(
                  child: Text(
                    categories[index],
                  ),
                ),
              ),
            );
          })
        ],
      ),
    );
  }
}
