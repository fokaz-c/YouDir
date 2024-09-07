class Videomodel {
  //id,title,desc,thumbnails,created,updated
  int id;
  String title;
  String desc;
  DateTime created;
  DateTime updated;
  String thubnail;

  Videomodel(
      {required this.id,
      required this.title,
      this.desc = "",
      required this.created,
      required this.updated,
      required this.thubnail});
}
