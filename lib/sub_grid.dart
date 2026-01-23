import 'package:flutter/material.dart';

class Subgrid extends StatelessWidget {
  const Subgrid({super.key});
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(9, (y) {
        return Container(
          width: 0.3,
          height: 0.3,
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        );
      }),
    );
  }
}
