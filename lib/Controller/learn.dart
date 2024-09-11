import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/Controller/ExpanionTile/expansionTile.dart';
import 'package:quiz_app/Model/Provider/articleProvider.dart';

class LearnComponent extends ConsumerStatefulWidget {
  const LearnComponent({super.key});

  @override
  ConsumerState<LearnComponent> createState() => _LearnComponentState();
}

class _LearnComponentState extends ConsumerState<LearnComponent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Article')),
      body: ref.watch(articleProvider).document == null
          ? const Center(child: Text('No article loaded'))
          : ListView.builder(
              itemCount: ref.watch(articleProvider).document!.sections.length,
              itemBuilder: (context, index) {
                final section =
                    ref.watch(articleProvider).document!.sections[index];
                return ExpansionTile(
                  title: Text(section.mainHeading),
                  children: section.subsections.map((subsection) {
                    return ListTile(
                      title: Text(subsection.subheading),
                      subtitle: Text(subsection.content),
                    );
                  }).toList(),
                );
              },
            ),
    );
  }
}
