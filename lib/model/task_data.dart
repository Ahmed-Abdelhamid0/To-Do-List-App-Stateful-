
class Task {
  String ? content;
  String ? taskStatus;
  bool ? isDone;


  Task({
    required this.content,

    this.taskStatus = 'Not-Completed',
    this.isDone = false,
  });

  void changeCheckBoxStatus() {
    isDone = !isDone!;
    if (isDone!) {
      taskStatus = 'you have done this task';
    } else {
      taskStatus = 'task not completed yet';
    }
  }

}