import 'package:flutter/material.dart';

class QuestionWithAnswer {
  final String question;
  final List<Answer> answers;
  final String correctAnswer;

  QuestionWithAnswer({
    required this.question,
    required this.answers,
    required this.correctAnswer,
  });
}

class Answer {
  final String text;
  final IconData icon;
  Answer({required this.text, required this.icon});
}

List<QuestionWithAnswer> questionsWithAnswers = [
  QuestionWithAnswer(
    question: 'What is the capital of France?',
    answers: [
      Answer(
        text: 'Paris',
        icon: Icons.location_city,
      ),
      Answer(
        text: 'Rome',
        icon: Icons.flight_takeoff,
      ),
      Answer(
        text: 'Berlin',
        icon: Icons.landscape,
      ),
      Answer(
        text: 'Madrid',
        icon: Icons.directions_walk,
      ),
    ],
    correctAnswer: 'Paris',
  ),
  QuestionWithAnswer(
    question: 'Who wrote "Romeo and Juliet"?',
    answers: [
      Answer(
        text: 'William Shakespeare',
        icon: Icons.menu_book,
      ),
      Answer(
        text: 'Charles Dickens',
        icon: Icons.book,
      ),
      Answer(
        text: 'Jane Austen',
        icon: Icons.book_online,
      ),
      Answer(
        text: 'Leo Tolstoy',
        icon: Icons.library_books,
      ),
    ],
    correctAnswer: 'William Shakespeare',
  ),
  QuestionWithAnswer(
    question: 'What is the lightest element in the periodic table?',
    answers: [
      Answer(
        text: 'Hydrogen',
        icon: Icons.bubble_chart,
      ),
      Answer(
        text: 'Oxygen',
        icon: Icons.invert_colors,
      ),
      Answer(
        text: 'Helium',
        icon: Icons.ballot,
      ),
      Answer(
        text: 'Carbon',
        icon: Icons.icecream,
      ),
    ],
    correctAnswer: 'Hydrogen',
  ),
  QuestionWithAnswer(
    question: 'Who\'s your favorite instructor?',
    answers: [
      Answer(
        text: 'Tarek',
        icon: Icons.add,
      ),
      Answer(
        text: 'Tarekk',
        icon: Icons.reorder_sharp,
      ),
      Answer(
        text: 'Tarekkk',
        icon: Icons.face,
      ),
      Answer(
        text: 'Tarekkkk',
        icon: Icons.access_alarm,
      ),
    ],
    correctAnswer: 'Tarek',
  ),
];
