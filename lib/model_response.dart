class ModelTestResponse {
  int? id;
  String? name;
  int? value;
  double? num;

  ModelTestResponse({this.id, this.name, this.value, this.num});

  ModelTestResponse.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    value = map['value'];
    num = map['num'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['value'] = value;
    data['num'] = num;
    return data;
  }
}
