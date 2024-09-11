import 'dart:convert';

// Define a class for the individual examples
class Example {
  final String description;
  final String codeSnippet;

  Example({required this.description, required this.codeSnippet});

  factory Example.fromJson(Map<String, dynamic> json) {
    return Example(
      description: json['description'],
      codeSnippet: json['code_snippet'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'code_snippet': codeSnippet,
    };
  }
}

// Define a class for the subsections
class Subsection {
  final String subheading;
  final String content;
  final String notes;
  final List<Example> examples;
  final List<String> references;

  Subsection({
    required this.subheading,
    required this.content,
    required this.notes,
    required this.examples,
    required this.references,
  });

  factory Subsection.fromJson(Map<String, dynamic> json) {
    return Subsection(
      subheading: json['subheading'],
      content: json['content'],
      notes: json['notes'],
      examples: (json['examples'] as List<dynamic>)
          .map((e) => Example.fromJson(e as Map<String, dynamic>))
          .toList(),
      references: List<String>.from(json['references']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'subheading': subheading,
      'content': content,
      'notes': notes,
      'examples': examples.map((e) => e.toJson()).toList(),
      'references': references,
    };
  }
}

// Define a class for the main headings
class Section {
  final String mainHeading;
  final List<Subsection> subsections;

  Section({required this.mainHeading, required this.subsections});

  factory Section.fromJson(Map<String, dynamic> json) {
    return Section(
      mainHeading: json['main_heading'],
      subsections: (json['subsections'] as List<dynamic>)
          .map((e) => Subsection.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'main_heading': mainHeading,
      'subsections': subsections.map((e) => e.toJson()).toList(),
    };
  }
}

// Define a class for the entire document
class Document {
  final List<Section> sections;

  Document({required this.sections});

  factory Document.fromJson(Map<String, dynamic> json) {
    return Document(
      sections: (json['sections'] as List<dynamic>)
          .map((e) => Section.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sections': sections.map((e) => e.toJson()).toList(),
    };
  }
}
