import 'package:flutter/material.dart';
import 'package:task2/models/question_with_answer.dart';
import 'package:task2/utils/app_colors.dart';

class CongratsWidgets extends StatelessWidget {
  final int score;
  final VoidCallback onTap;
  final VoidCallback onTopShow;

  const CongratsWidgets({
    super.key,
    required this.score,
    required this.onTap,
    required this.onTopShow,
  });

  @override
  Widget build(BuildContext context) {
    String imagePath;
    String message;
    Color messageColor;

    if (score < 2) {
      imagePath = 'assets/falied.png';
      message = 'Don\'t give up, try again!';
      messageColor = Colors.red;
    } else {
      imagePath = 'assets/congratulations-icon.jpg';
      message = 'Great job, keep it up!';
      messageColor = Colors.green;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 8),
          Image.asset(
            imagePath,
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.width * 0.4,
          ),
          const SizedBox(height: 16),
          Text(
            message,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: messageColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Your score: $score/${questionsWithAnswers.length}',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColors.grey,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.center, // Center the row content
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 40.0, right: 10.0), // Adjust the padding as needed
                  child: ElevatedButton(
                    onPressed: onTap,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.green,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: const Text('Reset Quiz'),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, right: 40.0), // Adjust the padding as needed
                  child: ElevatedButton(
                    onPressed: onTopShow,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.green,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: const Text('Show Answers'),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
