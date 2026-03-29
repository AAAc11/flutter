import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final List<Task> tasks = const [
    Task(title: "Projekt z matmy", deadline: "jutro", done: true, priority: "wysoki"),
    Task(title: "Notatki z wykladu", deadline: "za tydzien", done: false, priority: "średni"),
    Task(title: "Poczytac ksiazke", deadline: "za 40 minut", done: false, priority: "niski"),
    Task(title: "Posprzatac", deadline: "za rok", done: false, priority: "niski")
  ];



  @override
  Widget build(BuildContext context) {
    int doneCount = tasks.where((t) => t.done).length;
    return MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Text("Masz dziś ${tasks.length} zadania, Wykonane: $doneCount",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                  )),
              SizedBox(height: 16),
              Text("Dzisiejsze zadania",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                  )),
              Expanded(child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return TaskCard(
                      title: "${tasks[index].title} | priorytet: ${tasks[index].priority}",
                      deadline: "termin: ${tasks[index].deadline}",
                      icon: tasks[index].done ? Icons.check_circle : Icons.radio_button_unchecked
                  );
                },
              ))
            ],
          )
        )
    );
  }
}

class Task {
  final String title;
  final String deadline;
  final bool done;
  final String priority;

  const Task({
    required this.title,
    required this.deadline,
    required this.done,
    required this.priority,
  });
}

class TaskCard extends StatelessWidget {
  final String title;
  final String deadline;
  final IconData icon;

  const TaskCard({
    super.key,
    required this.title,
    required this.deadline,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Card(
          child: ListTile(
            leading: Icon(icon),
            title: Text(title),
            subtitle: Text(deadline),
          ),
        ),
      ),
    );
  }
}