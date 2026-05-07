class LocalNotification {
  final int id;
  final String title;
  final String body;
  final String payload;

  LocalNotification(this.id, this.title, this.body, this.payload);

  @override
  String toString() => 'Notification(id: $id, title: $title, body: $body)';
}
