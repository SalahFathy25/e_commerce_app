class CategoryModel {
  String id;
  String name;
  String image;
  String parentId;
  bool isFeatured;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.isFeatured,
    this.parentId = '',
  });

  static CategoryModel empty() =>
      CategoryModel(id: '', name: '', image: '', isFeatured: false);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'parent_id': parentId,
      'is_featured': isFeatured,
    };
  }

  factory CategoryModel.fromJson(Map<String, dynamic> data) {
    return CategoryModel(
      id: data['id']?.toString() ?? '',
      name: data['name'] ?? '',
      image: data['image'] ?? '',
      parentId: data['parent_id'] ?? '',
      isFeatured: data['is_featured'] ?? false,
    );
  }
}
