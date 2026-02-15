import 'package:flutter/material.dart';
import 'package:sudoku_api/sudoku_api.dart';

class Subgrid extends StatelessWidget {
  const Subgrid({
    super.key,
    required this.subBoard,
    this.selectedIndex,
    this.onCellTap,
  });
  final List<Cell>? subBoard;
  final int? selectedIndex;
  final ValueChanged<int>? onCellTap;
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(9, (y) {
        final cellValue = subBoard?[y].getValue();
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
                  cellValue == null || cellValue == 0 ? '' : cellValue.toString(),
                  style: const TextStyle(fontSize: 24),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
