class CategoryResponse {
  final String? sts;
  final String? msg;
  final List<Category>? categories;

  CategoryResponse({
    this.sts,
    this.msg,
    this.categories,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) {
    return CategoryResponse(
      sts: json['sts'] as String?,
      msg: json['msg'] as String?,
      categories: json['categories'] != null
          ? List<Category>.from(
              json['categories'].map((x) => Category.fromJson(x)))
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'sts': sts,
        'msg': msg,
        'categories': categories?.map((x) => x.toJson()).toList(),
      };
}

class Category {
  final int? id;
  final int? shopid;
  final String? name;
  final int? disporder;
  final String? image;
  final String? status;

  Category({
    this.id,
    this.shopid,
    this.name,
    this.disporder,
    this.image,
    this.status,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] as int?,
      shopid: json['shopid'] as int?,
      name: json['name'] as String?,
      disporder: json['disporder'] as int?,
      image: json['image'] as String?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'shopid': shopid,
        'name': name,
        'disporder': disporder,
        'image': image,
        'status': status,
      };
}
