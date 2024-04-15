import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final String titleCoffe;
  final bool isChoose;

  const CategoryTile(
      {super.key, required this.titleCoffe, required this.isChoose});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: Text(
        titleCoffe,
        style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: isChoose ? 21 : 18,
            color: isChoose ? Colors.orange : Colors.white),

      ),
    );
  }
}
