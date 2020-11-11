class Note{
  String noteID , noteTitle , noteContent;
  DateTime createDateTime , latestDateTime;

  Note({this.noteID, this.latestDateTime , this.noteTitle, this.createDateTime, this.noteContent});

  factory Note.fromJson(Map<String , dynamic> item){
    return Note(
      noteID: item['noteID'],
      noteTitle: item['noteTitle'],
      noteContent: item['noteContent'],
      createDateTime: DateTime.parse(item['createDateTime']),
      latestDateTime: item['latestEditDateTime'] != null
          ? DateTime.parse(item['latestEditDateTime'])
          : null,
    );
  }

}