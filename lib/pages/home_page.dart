import 'package:flutter/material.dart';
import 'package:task2/models/question_with_answer.dart';
import 'package:task2/utils/app_colors.dart';
import 'package:task2/widgets/answer_widget_item.dart';
import 'package:task2/widgets/congrats_widgets.dart';
import 'package:task2/widgets/main_button.dart';
import 'package:task2/widgets/steps_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int questionIndex = 0;
  bool isFinished = false;
  int score = 0;
  bool showAnswers = false;
  String? selectedAnswer;
  List<String?> selectedAnswers =
      List.generate(questionsWithAnswers.length, (index) => null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: !isFinished
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      Text(
                        questionsWithAnswers[questionIndex].question,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Answer and get points!',
                        style: TextStyle(
                          fontSize: 17,
                          color: AppColors.grey,
                        ),
                      ),
                      const SizedBox(height: 36),
                      StepIndicator(
                          currentStep: questionIndex + 1,
                          totalSteps:
                              questionsWithAnswers.length), // Add this line
                      const SizedBox(height: 36),
                      Column(
                        children: questionsWithAnswers[questionIndex]
                            .answers
                            .map((answer) => AnswerWidgetItem(
                                  correctAnswer:
                                      questionsWithAnswers[questionIndex]
                                          .correctAnswer,
                                  answer: answer,
                                  selectedAnswer: selectedAnswer,
                                  onTap: () {
                                    setState(() {
                                      selectedAnswer = answer.text;
                                      selectedAnswers[questionIndex] =
                                          selectedAnswer; // Update the selected answer for the current question
                                    });
                                  },
                                ))
                            .toList(),
                      ),
                      const Spacer(),
                      MainButton(
                        text: 'Next',
                        onTap: () {
                          if (selectedAnswers[questionIndex] != null) {
                            // Only proceed if an answer is selected
                            setState(() {
                              final questionObj =
                                  questionsWithAnswers[questionIndex];
                              if (selectedAnswers[questionIndex] ==
                                  questionObj.correctAnswer) {
                                score++;
                              }
                              if (questionIndex <
                                  questionsWithAnswers.length - 1) {
                                questionIndex++;
                                selectedAnswer =
                                    null; // Reset the selected answer for the next question
                              } else {
                                isFinished = true;
                              }
                            });
                          } else {
                            // Show a snackbar if no answer is selected
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'Please select an answer before going to the next question.'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  )
                : showAnswers
                    ? showAnswer() // Show answers if showAnswers is true
                    : CongratsWidgets(
                        score: score,
                        onTap: () {
                          setState(() {
                            resetQuiz();
                          });
                        },
                        onTopShow: () {
                          setState(() {
                            showAnswers = true;
                          });
                        },
                      ),
          ),
        ),
      ),
    );
  }

  Widget showAnswer() {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: questionsWithAnswers.length,
            itemBuilder: (context, index) {
              var question = questionsWithAnswers[index];
              bool isFinished = true; // Set to true when showing answers
              //  String userAnswer = selectedAnswers[index] ; // Assuming you have a list of selected answers

              return Card(
                margin: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        question.question,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ...question.answers.map((answer) {
                        return AnswerWidgetItem(
                          answer: answer,
                          correctAnswer: question.correctAnswer,
                          selectedAnswer: selectedAnswers[index],
                          isFinished: isFinished,
                          onTap: () {},
                        );
                      }).toList(),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        MainButton(
          onTap: resetQuiz,
          text: 'Reset Quiz',
        ),
      ],
    );
  }

  void resetQuiz() {
    setState(() {
      questionIndex = 0;
      isFinished = false;
      score = 0;
      showAnswers = false;
      selectedAnswer = null;
      selectedAnswers = List.generate(questionsWithAnswers.length,
          (index) => null); // Reset all selected answers
    });

    // Use a short delay to ensure that the Scaffold has been rebuilt before showing the SnackBar
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('The quiz has been reset.'),
          duration: Duration(seconds: 2),
        ),
      );
    });
  }
}
