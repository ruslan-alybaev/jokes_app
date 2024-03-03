class JokesModel {
  String? createdAt;
  String? iconUrl;
  String? id;
  String? updatedAt;
  String? url;
  String? value;

  JokesModel(
      {
      this.createdAt,
      this.iconUrl,
      this.id,
      this.updatedAt,
      this.url,
      this.value});

  JokesModel.fromJson(Map<String, dynamic> json) {
    createdAt = json['created_at'];
    iconUrl = json['icon_url'];
    id = json['id'];
    updatedAt = json['updated_at'];
    url = json['url'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_at'] = this.createdAt;
    data['icon_url'] = this.iconUrl;
    data['id'] = this.id;
    data['updated_at'] = this.updatedAt;
    data['url'] = this.url;
    data['value'] = this.value;
    return data;
  }
}
