class CarouselModel {
  final String status;
  final String message;
  final List<BannerItem> mainBanners;
  final List<BannerItem> footerBanners;
  final String? shopStatus;
  final PosterItem? poster;
  final String? theme;

  CarouselModel({
    required this.status,
    required this.message,
    required this.mainBanners,
    required this.footerBanners,
    this.shopStatus,
    this.poster,
    this.theme,
  });

  factory CarouselModel.fromJson(Map<String, dynamic> json) {
    return CarouselModel(
      status: json['sts'],
      message: json['msg'],
      mainBanners: (json['mainbanners'] as List)
          .map((item) => BannerItem.fromJson(item))
          .toList(),
      footerBanners: (json['footerbanners'] as List)
          .map((item) => BannerItem.fromJson(item))
          .toList(),
      shopStatus: json['shopstatus'],
      poster:
          json['poster'] != null ? PosterItem.fromJson(json['poster']) : null,
      theme: json['theme'],
    );
  }
}

class BannerItem {
  final int id;
  final int sellerId;
  final String type;
  final String image;
  final String title;
  final String url;

  BannerItem({
    required this.id,
    required this.sellerId,
    required this.type,
    required this.image,
    required this.title,
    required this.url,
  });

  factory BannerItem.fromJson(Map<String, dynamic> json) {
    return BannerItem(
      id: json['id'],
      sellerId: json['sellerid'],
      type: json['type'],
      image: json['image'],
      title: json['title'],
      url: json['url'],
    );
  }
}

class PosterItem {
  final int id;
  final String title;
  final String categoryId;
  final String image;

  PosterItem({
    required this.id,
    required this.title,
    required this.categoryId,
    required this.image,
  });

  factory PosterItem.fromJson(Map<String, dynamic> json) {
    return PosterItem(
      id: json['id'],
      title: json['title'],
      categoryId: json['cat_id'],
      image: json['image'],
    );
  }
}
