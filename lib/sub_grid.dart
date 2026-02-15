import 'package:flutter/material.dart';
import 'package:sudoku_api/sudoku_api.dart';

class Subgrid extends StatelessWidget {
  const Subgrid({
    super.key,
    required this.subBoard,
    required this.solvedSubBoard,
    this.selectedIndex,
    this.onCellTap,
  });
  final List<Cell>? subBoard;
  final List<Cell>? solvedSubBoard;
  final int? selectedIndex;
  final ValueChanged<int>? onCellTap;
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(9, (y) {
        final cellValue = subBoard?[y].getValue();
        final solvedValue = solvedSubBoard?[y].getValue();
        final isEmpty = cellValue == null || cellValue == 0;
        final displayValue = isEmpty ? solvedValue : cellValue;
        final isSelected = selectedIndex == y;
        return Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => onCellTap?.call(y),
            child: Container(
              width: 0.3,
              height: 0.3,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                color: isSelected
                    ? Colors.blueAccent.shade100.withAlpha(100)
                    : Colors.transparent,
              ),
              child: Center(
                child: Text(
                  displayValue == null ? '' : displayValue.toString(),
                  style: TextStyle(
                    fontSize: 24,
                    color: isEmpty ? Colors.black12 : Colors.black,
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
