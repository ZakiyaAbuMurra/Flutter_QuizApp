import 'package:flutter/material.dart';
import 'package:task2/models/question_with_answer.dart';
import 'package:task2/utils/app_colors.dart';

class AnswerWidgetItem extends StatelessWidget {
  final Answer answer;
  final String? selectedAnswer;
  final String correctAnswer;
  final bool isFinished;
  final VoidCallback onTap;

  const AnswerWidgetItem({
    super.key,
    required this.answer,
    this.selectedAnswer,
    required this.correctAnswer,
    required this.onTap,
    this.isFinished = false,
  });

  @override
  Widget build(BuildContext context) {
    final bool isCorrect = answer.text == correctAnswer;
    final bool isSelected = answer.text == selectedAnswer;

    Color backgroundColor;
    Color textColor;
    IconData iconData;

    if (isFinished) {
      if (isSelected && isCorrect) {
        backgroundColor = AppColors.green;
        textColor = AppColors.white;
        iconData = Icons.check;
      } else if (isSelected && !isCorrect) {
        backgroundColor = AppColors.red;
        textColor = AppColors.white;
        iconData = Icons.close;
      } else if (!isSelected && isCorrect) {
        backgroundColor = AppColors.green.withOpacity(0.5);
        textColor = AppColors.white;
        iconData = Icons.check;
      } else {
        backgroundColor = AppColors.white;
        textColor = AppColors.black;
        iconData = answer.icon;
      }
    } else {
      backgroundColor = isSelected ? AppColors.green : AppColors.white;
      textColor = isSelected ? AppColors.white : AppColors.black;
      iconData = answer.icon;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: isFinished
            ? null
            : onTap, // Disable the onTap if the quiz is finished
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: AppColors.grey.withOpacity(0.3),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(
                  iconData,
                  color: textColor,
                ),
                const SizedBox(width: 8),
                Text(
                  answer.text,
                  style: TextStyle(
                    color: textColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
