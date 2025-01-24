class ProductResponse {
  final String? sts;
  final String? msg;
  final ProductPagination? products;

  ProductResponse({
    this.sts,
    this.msg,
    this.products,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      ProductResponse(
        sts: json['sts'] as String?,
        msg: json['msg'] as String?,
        products: json['products'] == null
            ? null
            : ProductPagination.fromJson(
                json['products'] as Map<String, dynamic>),
      );
}

class ProductPagination {
  final int? currentPage;
  final List<Product>? data;
  final String? firstPageUrl;
  final int? from;
  final int? lastPage;
  final String? lastPageUrl;
  final List<Link>? links;
  final String? nextPageUrl;
  final String? path;
  final int? perPage;
  final String? prevPageUrl;
  final int? to;
  final int? total;

  ProductPagination({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory ProductPagination.fromJson(Map<String, dynamic> json) =>
      ProductPagination(
        currentPage: json['current_page'] as int?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
            .toList(),
        firstPageUrl: json['first_page_url'] as String?,
        from: json['from'] as int?,
        lastPage: json['last_page'] as int?,
        lastPageUrl: json['last_page_url'] as String?,
        links: (json['links'] as List<dynamic>?)
            ?.map((e) => Link.fromJson(e as Map<String, dynamic>))
            .toList(),
        nextPageUrl: json['next_page_url'] as String?,
        path: json['path'] as String?,
        perPage: json['per_page'] as int?,
        prevPageUrl: json['prev_page_url'] as String?,
        to: json['to'] as int?,
        total: json['total'] as int?,
      );
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
  final String? video;
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

  factory Product.fromJson(Map<String, dynamic> json) => Product(
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
        video: json['video'] as String?,
        link: json['link'] as String?,
        deliveryCharge: json['delivery_charge'] as int?,
        delStatus: json['del_status'] as String?,
      );
}

class Link {
  final String? url;
  final String? label;
  final bool? active;

  Link({
    this.url,
    this.label,
    this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json['url'] as String?,
        label: json['label'] as String?,
        active: json['active'] as bool?,
      );
}
