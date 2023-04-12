import 'package:flutter/material.dart';
import 'package:quizz_app/widgets/answer.dart';
import 'package:quizz_app/widgets/questions.dart';
import 'package:quizz_app/widgets/result.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.name});
  final String name;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final questions = const [
    {
      'questionText': ' How do you feel about your current job/career?',
      'answers': [
        {'text': 'I love my job and find it very fulfilling.', 'score': 5},
        {
          'text': 'My job is okay, but I\'m not completely satisfied.',
          'score': 2
        },
        {
          'text':
              'I don\'t enjoy my job and would like to find something better.',
          'score': 1
        }
      ]
    },
    {
      'questionText': ' What do you think are your greatest strengths?',
      'answers': [
        {
          'text': 'I\'m a great communicator and work well in teams.',
          'score': 2
        },
        {
          'text': 'I\'m very organized and good at prioritizing tasks.',
          'score': 1
        },
        {
          'text':
              'I\'m a creative problem-solver and can think outside the box.',
          'score': 4
        }
      ]
    },
    {
      'questionText': ' What areas do you think you need to work on improving?',
      'answers': [
        {'text': 'I need to improve my time-management skills.', 'score': 5},
        {
          'text': 'I could work on being more assertive and speaking up more.',
          'score': 1
        },
        {
          'text':
              'I need to work on being more patient and understanding with others.',
          'score': 2
        }
      ]
    },
    {
      'questionText': ' How do you like to spend your free time?',
      'answers': [
        {'text': 'I enjoy reading and watching movies.', 'score': 3},
        {
          'text': 'I love spending time outdoors and going for hikes.',
          'score': 5
        },
        {
          'text': 'I enjoy trying out new hobbies and learning new skills.',
          'score': 4
        }
      ]
    },
    {
      'questionText': ' What are your goals for the next year?',
      'answers': [
        {'text': 'I want to learn a new language.', 'score': 3},
        {
          'text': 'I want to get in better shape and start eating healthier.',
          'score': 4
        },
        {'text': 'I want to save enough money to take a big trip.', 'score': 2}
      ]
    },
    {
      'questionText': ' How do you handle stress and difficult situations?',
      'answers': [
        {
          'text':
              'I like to take a break and do something relaxing, like meditation or yoga.',
          'score': 3
        },
        {
          'text':
              'I talk to someone I trust to get their perspective and advice.',
          'score': 1
        },
        {
          'text':
              'I try to break down the problem into smaller parts and tackle them one at a time.',
          'score': 5
        }
      ]
    },
    {
      'questionText': ' What do you value most in life?',
      'answers': [
        {
          'text': 'My family and friends are the most important thing to me.',
          'score': 2
        },
        {
          'text': 'I value my health and well-being above all else.',
          'score': 4
        },
        {
          'text':
              'I think making a difference in the world is the most important thing.',
          'score': 5
        }
      ]
    },
    {
      'questionText': ' How would you describe your communication skills?',
      'answers': [
        {
          'text': 'I\'m a great listener and can empathize with others easily.',
          'score': 5
        },
        {
          'text': 'I\'m confident in expressing my ideas and opinions clearly.',
          'score': 5
        },
        {
          'text':
              'I\'m working on improving my communication skills, especially when it comes to conflict resolution.',
          'score': 4
        },
      ]
    },
    {
      'questionText': ' What motivates you to succeed?',
      'answers': [
        {
          'text': 'I want to make my family proud and provide for them.',
          'score': 5
        },
        {
          'text':
              'I\'m driven by a desire to achieve my goals and live up to my potential.',
          'score': 4
        },
        {
          'text':
              'I want to make a positive impact on the world and help others.',
          'score': 2
        }
      ]
    },
    {
      'questionText': ' How do you handle failure and setbacks?',
      'answers': [
        {
          'text':
              'I try to learn from my mistakes and figure out what I can do differently next time.',
          'score': 1
        },
        {
          'text':
              'I remind myself that failure is a natural part of the learning process.',
          'score': 1
        },
        {
          'text':
              'I seek out support from friends and family to help me through difficult times.',
          'score': 1
        }
      ]
    }
  ];

  void answerQuest(int score) {
    _totalScore += score;

    setState(() {
      questionIndex++;
    });
  }

  int questionIndex = 0;
  int _totalScore = 0;
  String? length;

  @override
  Widget build(BuildContext context) {
    length = questions.length.toString();
    int qNo = questionIndex + 1;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Personal Evaluation '),
        leading: Center(
            child: questionIndex < questions.length
                ? Text(
                    '$qNo/${length!}',
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  )
                : const Text('')),
        actions: [
          if (questionIndex > 0 && questionIndex < questions.length)
            IconButton(
                tooltip: 'Previouse Question',
                onPressed: () {
                  setState(() {
                    questionIndex--;
                  });
                },
                icon: const Icon(Icons.undo)),
          if (questionIndex > 0)
            IconButton(
                tooltip: 'Reset Evaluation',
                onPressed: () {
                  setState(() {
                    _totalScore = 0;
                    questionIndex = 0;
                  });
                },
                icon: const Icon(Icons.restart_alt))
        ],
      ),
      body: questionIndex < questions.length
          ? Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                color: Colors.grey.shade200,
                height: 310,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Welcome ${widget.name}!'.toUpperCase(),
                      style: const TextStyle(
                        color: Color.fromARGB(255, 39, 31, 1),
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Question(
                        questions[questionIndex]['questionText'].toString()),
                    ...(questions[questionIndex]['answers']
                            as List<Map<String, Object>>)
                        .map((answer) {
                      return Answer(() => answerQuest(answer['score'] as int),
                          answer['text'] as String);
                    }).toList()
                  ],
                ),
              ),
            )
          : Result(totalScore: _totalScore, name: widget.name),
    ));
  }
}
