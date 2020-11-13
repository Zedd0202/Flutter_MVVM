class Post {

  int id;
  String title;
  String body;

  Post({this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        id: json['id'],
        title: json['title'],
        body: json['body']
    );
  }
}