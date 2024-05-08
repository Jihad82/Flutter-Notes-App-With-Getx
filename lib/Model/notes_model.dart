class NotesModel {
  final String title;
  final String descriptions;
  final DateTime? createdate;
  final DateTime? updatedate;

  NotesModel({
    required this.title,
    required this.descriptions,
    required this.createdate,
    this.updatedate, // updatedate remains nullable
  });
}
