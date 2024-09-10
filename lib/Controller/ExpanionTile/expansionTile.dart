// import 'package:flutter/material.dart';
// import 'package:quiz_app/Model/Provider/Lesson.dart';

// class ExpanionLearnComponent extends StatefulWidget {
//   const ExpanionLearnComponent({Key? key}) : super(key: key);

//   @override
//   State<ExpanionLearnComponent> createState() => _ExpanionLearnComponentState();
// }

// class _ExpanionLearnComponentState extends State<ExpanionLearnComponent> {
//   List<Lesson> learningLessons = [
//     Lesson(Title: 'Title 1', Subtitle: [
//       'Sublesson - 1',
//       'Sublesson - 2',
//       'Sublesson - 3',
//     ]),
//     Lesson(Title: 'Title 2', Subtitle: [
//       'Sublesson - 2 1',
//       'Sublesson - 2 2',
//       'Sublesson - 2 3',
//     ]),
//     Lesson(Title: 'Title 3', Subtitle: [
//       'Sublesson - 3 1',
//       'Sublesson - 3 2',
//       'Sublesson - 3 3',
//     ]),
//     Lesson(Title: 'Title 4', Subtitle: [
//       'Sublesson - 4 1',
//       'Sublesson - 4 2',
//       'Sublesson - 4 3',
//     ]),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Expansion List Example"),
//       ),
//       body: SingleChildScrollView(
//         child: ExpansionPanelList(
//           expansionCallback: (panelIndex, isExpanded) {
//             setState(() {
//               learningLessons[panelIndex].isExpanded = !isExpanded;
//             });
//           },
//           children: learningLessons.map((lesson) {
//             return ExpansionPanel(
//               headerBuilder: (context, isExpanded) {
//                 return ListTile(title: Text(lesson.Title));
//               },
//               body: Column(
//                 children: lesson.Subtitle.map((subLesson) {
//                   return ListTile(title: Text(subLesson));
//                 }).toList(),
//               ),
//               isExpanded: lesson.isExpanded,
//             );
//           }).toList(),
//         ),
//       ),
//     );
//   }
// }
