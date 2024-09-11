const MONGO_URL =
    "mongodb+srv://ravalhari:ravalhari5114@cluster0.ga8cqdj.mongodb.net/QuizApp?retryWrites=true&w=majority&appName=Cluster0";
const USER_COLLECTION = "Users";
const String articles = '''
{
  "sections": [
    {
      "main_heading": "Introduction to C Programming",
      "subsections": [
        {
          "subheading": "What is C?",
          "content": "C is a powerful, general-purpose programming language developed in the 1970s by Dennis Ritchie at Bell Labs. It is widely used for system programming, real-time applications, and performance-critical tasks.",
          "notes": "C is procedural and follows a structured programming approach, where the program flow is controlled by functions and control structures like loops and conditionals.",
          "examples": [
            {
              "description": "Example of a simple C program that prints 'Hello, World!'",
              "code_snippet": "#include <stdio.h>\\nint main() {\\n    printf(\\"Hello, World!\\");\\n    return 0;\\n}"
            }
          ],
          "references": [
            "https://en.wikipedia.org/wiki/C_(programming_language)",
            "https://www.geeksforgeeks.org/c-language-set-1-introduction/"
          ]
        },
        {
          "subheading": "History of C",
          "content": "C was developed by Dennis Ritchie at Bell Labs between 1969 and 1973 as part of an effort to rewrite UNIX in a high-level language.",
          "notes": "C has influenced many modern languages including C++, Java, and C#.",
          "references": [
            "https://en.wikipedia.org/wiki/Dennis_Ritchie",
            "https://www.tutorialspoint.com/cprogramming/c_history.htm"
          ]
        }
      ]
    },
    {
      "main_heading": "Introduction to C++ Programming",
      "subsections": [
        {
          "subheading": "What is C++?",
          "content": "C++ is a general-purpose programming language developed by Bjarne Stroustrup in 1983 as an extension of C, adding object-oriented features like classes and inheritance.",
          "notes": "C++ supports both low-level and high-level programming paradigms, making it versatile for a wide range of applications.",
          "examples": [
            {
              "description": "Example of a simple C++ program that prints 'Hello, World!'",
              "code_snippet": "#include <iostream>\\nusing namespace std;\\nint main() {\\n    cout << \\"Hello, World!\\";\\n    return 0;\\n}"
            }
          ],
          "references": [
            "https://en.wikipedia.org/wiki/C%2B%2B",
            "https://www.geeksforgeeks.org/c-plus-plus/"
          ]
        }
      ]
    }
  ]
}
''';
