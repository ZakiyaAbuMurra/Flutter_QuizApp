import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:task2/utils/app_colors.dart';

class StepProgress extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const StepProgress({
    Key? key,
    required this.currentStep,
    required this.totalSteps,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 0.1), // Padding for the entire Row
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Aligns the text to the start (left)
        children: [
          // Text for "Step X of Y"
          Padding(
            padding: const EdgeInsets.only(
                bottom: 8.0), // Space between text and progress bar
            child: Text(
              'Step $currentStep of $totalSteps',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.green,
              ),
            ),
          ),
          // Row for the progress bar
          Row(
            children: [
              Expanded(
                // Expanded to make the progress bar fill the available width
                child: StepProgressIndicator(
                  totalSteps: totalSteps,
                  currentStep: currentStep,
                  size: 8,
                  padding: 0,
                  selectedColor: AppColors.green,
                  unselectedColor: Colors.grey[300]!,
                  roundedEdges: const Radius.circular(10),
                  // Gradient colors for the selected and unselected portions
                  selectedGradientColor: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.greenAccent, Colors.green],
                  ),
                  unselectedGradientColor: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.grey[300]!, Colors.grey[300]!],
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
