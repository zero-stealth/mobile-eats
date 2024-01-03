class NotificationModel{
  int id;
  String title;
  String content;
  DateTime date;
  bool read;

  NotificationModel({
    required this.id,
    required this.title,
    required this.content,
    required this.date,
    required this.read
});
}