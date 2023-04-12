import 'package:flutter/material.dart';
import 'package:quizz_app/welcom_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz Time',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  WelcomePage({super.key});
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
      ),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('asset/1393376.jpg'), fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Text(
                      'Provide Your Name Below..',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.indigo,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Your Name',
                        label: Text(
                          'Name',
                          style: TextStyle(color: Colors.indigoAccent),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext ctx) =>
                                  HomePage(name: nameController.text)));
                        },
                        icon: const Icon(Icons.arrow_circle_right_outlined),
                        label: const Text('Continue')),
                  ),
                  const Text(
                      '         A personal evaluation quiz is a tool used to assess and reflect on various aspects of an individual\'s life, behavior, skills, or attitudes. It typically consists of a series of questions or prompts that require self-reflection and introspection to help individuals gain insight into their strengths, weaknesses, and areas for improvement. Personal evaluation quizzes are commonly used for self-assessment, self-awareness, and self-improvement purposes.'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
