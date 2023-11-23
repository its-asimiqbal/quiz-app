import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/screens/questions_summar/questions_summary.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });

  final void Function() onRestart;

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i],
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData
        .where(
          (data) => data['user_answer'] == data['correct_answer'],
        )
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 206, 178, 255),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(
              getSummaryData(),
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: onRestart,
              icon: const Icon(Icons.refresh),
              label: const Text('Restart Quiz!'),
            ),
          ],
        ),
      ),
    );
  }
}






















































// import 'package:adv_basics/data/questions.dart';
// import 'package:adv_basics/screens/questions_summary.dart';
// import 'package:flutter/material.dart';

// class ResultScreen extends StatelessWidget {
//   const ResultScreen({
//     super.key,
//     required this.chosenAnswer,
//   });

//   final List<String> chosenAnswer;

//   List<Map<String, Object>> getSummaryData() {
//     final List<Map<String, Object>> summary = [];

//     for (var i = 0; i < chosenAnswer.length; i++) {
//       summary.add({
//         'question_index': i,
//         'question': questions[i].text,
//         'correct_answer': questions[i].answers[0],
//         'user_answer': chosenAnswer[i]
//       });
//     }

//     return summary;
//   }

//   @override
//   Widget build(BuildContext context) {
//     // final numTotalQuestions = questions.length;
//     // final numCorrectQuestions = 0;

//     return SizedBox(
//       width: double.infinity,
//       child: Container(
//         margin: const EdgeInsets.all(40),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text('You answerd X out of Y questions correctly!'),
//             const SizedBox(
//               height: 30,
//             ),
//             QuestionsSummary(getSummaryData()),
//             const SizedBox(
//               height: 30,
//             ),
//             TextButton(
//               onPressed: () {},
//               child: const Text('Restart quiz'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
