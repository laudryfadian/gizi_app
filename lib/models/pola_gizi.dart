class PolaGizi {
  PolaGizi({
    required this.title,
    required this.description,
    required this.asset,
    required this.listDesc,
  });
  late final String title;
  late final String description;
  late final String asset;
  late final List<String> listDesc;

  PolaGizi.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    asset = json['asset'];
    listDesc = List.castFrom<dynamic, String>(json['list_desc']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['title'] = title;
    _data['description'] = description;
    _data['asset'] = asset;
    _data['list_desc'] = listDesc;
    return _data;
  }
}
