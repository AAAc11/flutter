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

class TaskRepository {
  static List<Task> tasks = [
    Task(title: "Projekt z matmy", deadline: "jutro", done: true, priority: "wysoki"),
    Task(title: "Notatki z wykladu", deadline: "za tydzien", done: false, priority: "średni"),
    Task(title: "Poczytac ksiazke", deadline: "za 40 minut", done: false, priority: "niski"),
    Task(title: "Posprzatac", deadline: "za rok", done: false, priority: "niski")
  ];
}
