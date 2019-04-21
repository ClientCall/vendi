class Store {
  int id;
  String name;
  String description;
  String user;
  String createdAt;
  String updateAt;
  String urlImage;

  Store.fromJson(Map<String,dynamic> parsedJson){
    id = parsedJson['id'];
    name = parsedJson['name'];
    description = parsedJson['description'];
    user = parsedJson['user'];
    createdAt = parsedJson['created_at'];
    updateAt = parsedJson['update_at'];
    urlImage = parsedJson['image'];
  }

  Store({ this.id, this.name, this.description, this.user, this.createdAt, this.updateAt, this.urlImage });
}