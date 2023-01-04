class Distribusi {
  Distribusi({
    required this.city,
    required this.district,
  });
  late final String city;
  late final List<String> district;

  Distribusi.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    district = List.castFrom<dynamic, String>(json['district']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['city'] = city;
    _data['district'] = district;
    return _data;
  }
}
