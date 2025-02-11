class CategoryModel {
  final String name;
  final String imageurl;

  CategoryModel({required this.name, required this.imageurl});
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(name: json['name'], imageurl: json['imageurl']);
  }
}
