class ProductDetailsModel {
  final String? sts;
  final String? msg;
  final bool? isFavorite;
  final Product? product;
  final List<Unit>? units;
  final List<dynamic>? relatedProducts;

  ProductDetailsModel({
    this.sts,
    this.msg,
    this.isFavorite,
    this.product,
    this.units,
    this.relatedProducts,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailsModel(
      sts: json['sts'] as String?,
      msg: json['msg'] as String?,
      isFavorite: json['is_favorite'] as bool?,
      product:
          json['product'] != null ? Product.fromJson(json['product']) : null,
      units: json['units'] != null
          ? List<Unit>.from(json['units'].map((x) => Unit.fromJson(x)))
          : null,
      relatedProducts: json['related_products'] as List<dynamic>?,
    );
  }
}

class Product {
  final int? id;
  final int? shopid;
  final String? name;
  final String? featured;
  final String? popular;
  final String? trending;
  final String? desc;
  final int? categoryid;
  final String? status;
  final String? image;
  final String? image2;
  final String? image3;
  final String? image4;
  final dynamic video;
  final String? link;
  final int? deliveryCharge;
  final String? delStatus;

  Product({
    this.id,
    this.shopid,
    this.name,
    this.featured,
    this.popular,
    this.trending,
    this.desc,
    this.categoryid,
    this.status,
    this.image,
    this.image2,
    this.image3,
    this.image4,
    this.video,
    this.link,
    this.deliveryCharge,
    this.delStatus,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int?,
      shopid: json['shopid'] as int?,
      name: json['name'] as String?,
      featured: json['featured'] as String?,
      popular: json['popular'] as String?,
      trending: json['trending'] as String?,
      desc: json['desc'] as String?,
      categoryid: json['categoryid'] as int?,
      status: json['status'] as String?,
      image: json['image'] as String?,
      image2: json['image2'] as String?,
      image3: json['image3'] as String?,
      image4: json['image4'] as String?,
      video: json['video'],
      link: json['link'] as String?,
      deliveryCharge: json['delivery_charge'] as int?,
      delStatus: json['del_status'] as String?,
    );
  }
}

class Unit {
  final int? id;
  final int? productid;
  final String? name;
  final int? price;
  final int? offerprice;
  final String? status;
  final int? dispOrder;
  final int? deliveryCharge;
  final int? cgst;
  final int? sgst;
  final String? delStatus;

  Unit({
    this.id,
    this.productid,
    this.name,
    this.price,
    this.offerprice,
    this.status,
    this.dispOrder,
    this.deliveryCharge,
    this.cgst,
    this.sgst,
    this.delStatus,
  });

  factory Unit.fromJson(Map<String, dynamic> json) {
    return Unit(
      id: json['id'] as int?,
      productid: json['productid'] as int?,
      name: json['name'] as String?,
      price: json['price'] as int?,
      offerprice: json['offerprice'] as int?,
      status: json['status'] as String?,
      dispOrder: json['disp_order'] as int?,
      deliveryCharge: json['delivery_charge'] as int?,
      cgst: json['cgst'] as int?,
      sgst: json['sgst'] as int?,
      delStatus: json['del_status'] as String?,
    );
  }
}
