//---- hashtag Model

class hashtag {
  String tite;
  hashtag({required this.tite});
}

//---- blog model
class BlogModel {
  int id;
  String imageUrl;
  String title;
  String writer;
  String writerImageUrl;
  String date;
  String content;
  String views;

  BlogModel(
      {required this.id,
      required this.imageUrl,
      required this.title,
      required this.writer,
      required this.writerImageUrl,
      required this.date,
      required this.content,
      required this.views});
}

//---- podcast model
class PodcastModel {
  String imageUrl;
  String namePodcast;

  PodcastModel({required this.imageUrl, required this.namePodcast});
}
