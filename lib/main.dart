import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final List<Task> tasks = const [
    Task(title: "Projekt z matmy", deadline: "jutro"),
    Task(title: "Notatki z wykladu", deadline: "za tydzien"),
    Task(title: "Poczytac ksiazke", deadline: "za 40 minut"),
    Task(title: "Posprzatac", deadline: "za rok")
  ];



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        home: Column(
          children: [
            Text("Moje zadania",
                style: TextStyle(
                  fontSize: 64,
                  fontWeight: FontWeight.bold,
                )),
            Expanded(child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return TaskCard(
                    title: tasks[index].title,
                    deadline: tasks[index].deadline,
                    icon: tasks[index].icon
                );
              },
            ))
          ],
        )
    );
  }
}

class Task {
  final String title;
  final String deadline;
  final IconData icon = Icons.one_x_mobiledata_rounded;

  const Task({required this.title, required this.deadline});
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
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: Text(deadline),
      ),
    );
  }
}