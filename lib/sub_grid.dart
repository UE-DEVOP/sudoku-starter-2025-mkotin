import 'package:flutter/material.dart';
import 'package:sudoku_api/sudoku_api.dart';

class Subgrid extends StatelessWidget {
  const Subgrid({super.key, required this.subBoard});
  final List<Cell>? subBoard;
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(9, (y) {
        final cellValue = subBoard?[y].getValue();
        return Container(
          width: 0.3,
          height: 0.3,
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: Center(
            child: Text(
              cellValue == null || cellValue == 0 ? '' : cellValue.toString(),
              style: const TextStyle(fontSize: 24),
            ),
          )
        );
      }),
    );
  }
}
