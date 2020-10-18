class LoadData {
  final String username;
  final String email;
  final String url;
  LoadData({this.username, this.email , this.url});

  factory LoadData.fromJson(Map<String, dynamic> json) {
    return LoadData(username: json['username'], email: json['email'] ,url: json['url']);
  }
}
