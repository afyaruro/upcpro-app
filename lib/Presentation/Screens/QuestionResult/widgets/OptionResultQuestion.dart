import 'package:flutter/material.dart';

class OptionResultQuestion extends StatelessWidget {
  final String answer;
  final String letter;
  final int index;
  final int? selectedOption;
  final int correct;

  const OptionResultQuestion({
    super.key,
    required this.answer,
    required this.letter,
    required this.index,
    required this.selectedOption,
    required this.correct,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = selectedOption == index;
    final isCorrect = correct == index;

    Color getBorderColor() {
      if (isCorrect) return Colors.green;
      if (isSelected) return Colors.redAccent;
      return Colors.grey[300]!;
    }

    Color getBackgroundColor() {
      if (isCorrect) return Colors.green.withOpacity(0.1);
      if (isSelected) return Colors.redAccent.withOpacity(0.1);
      return Colors.grey[100]!;
    }

    Color getTextColor() {
      if (isCorrect) return Colors.green;
      if (isSelected) return Colors.redAccent;
      return Colors.black87;
    }

    Color getCircleColor() {
      if (isCorrect) return Colors.green;
      if (isSelected) return Colors.redAccent;
      return Colors.grey[400]!;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
        decoration: BoxDecoration(
          color: getBackgroundColor(),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: getBorderColor(),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 15,
              backgroundColor: getCircleColor(),
              child: Text(
                letter,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                answer,
                style: TextStyle(
                  fontSize: 15,
                  color: getTextColor(),
                  fontWeight:
                      (isSelected || isCorrect) ? FontWeight.bold : FontWeight.normal,
                ),
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
