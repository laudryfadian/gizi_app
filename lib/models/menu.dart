class Menus {
  late String title;
  late String url;
  late String imageUrl;

  Menus({
    required this.title,
    required this.url,
    required this.imageUrl,
  });

  Menus.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    url = json['url'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = title;
    data['url'] = url;
    data['image_url'] = imageUrl;
    return data;
  }
}
