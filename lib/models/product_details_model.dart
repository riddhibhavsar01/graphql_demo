
class ProductData {
  Products? products;

  ProductData({this.products});

  ProductData.fromJson(Map<String, dynamic>? json) {
    products = json?['products'] != null
        ?  Products.fromJson(json?['products'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products?.toJson();
    }
    return data;
  }
}

class Products {
  List<Items>? items;

  Products({this.items});

  Products.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add( Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  int? id;
  int? attributeSetId;
  String? name;
  String? sku;
  ShortDescription? shortDescription;
  ShortDescription? description;
  Reviews? reviews;
  String? avgReviews;
  Image? image;
  Image? smallImage;
  Image? thumbnail;
  List<MediaGallery>? mediaGallery;
  String? sTypename;
  PriceRange? priceRange;
  List<Categories>? categories;
  List<ConfigurableOptions>? configurableOptions;
  List<Variants>? variants;
  List<RelatedProducts>? relatedProducts;

  Items(
      {this.id,
        this.attributeSetId,
        this.name,
        this.sku,
        this.shortDescription,
        this.description,
        this.reviews,
        this.avgReviews,
        this.image,
        this.smallImage,
        this.thumbnail,
        this.mediaGallery,
        this.sTypename,
        this.priceRange,
        this.categories,
        this.configurableOptions,
        this.variants,
        this.relatedProducts});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attributeSetId = json['attribute_set_id'];
    name = json['name'];
    sku = json['sku'];
    shortDescription = json['short_description'] != null
        ?  ShortDescription.fromJson(json['short_description'])
        : null;
    description = json['description'] != null
        ?  ShortDescription.fromJson(json['description'])
        : null;
    reviews =
    json['reviews'] != null ?  Reviews.fromJson(json['reviews']) : null;
    avgReviews = json['avg_reviews'];
    image = json['image'] != null ?  Image.fromJson(json['image']) : null;
    smallImage = json['small_image'] != null
        ?  Image.fromJson(json['small_image'])
        : null;
    thumbnail = json['thumbnail'] != null
        ?  Image.fromJson(json['thumbnail'])
        : null;
    if (json['media_gallery'] != null) {
      mediaGallery = <MediaGallery>[];
      json['media_gallery'].forEach((v) {
        mediaGallery!.add( MediaGallery.fromJson(v));
      });
    }
    sTypename = json['__typename'];
    priceRange = json['price_range'] != null
        ?  PriceRange.fromJson(json['price_range'])
        : null;
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add( Categories.fromJson(v));
      });
    }
    if (json['configurable_options'] != null) {
      configurableOptions = <ConfigurableOptions>[];
      json['configurable_options'].forEach((v) {
        configurableOptions!.add( ConfigurableOptions.fromJson(v));
      });
    }
    if (json['variants'] != null) {
      variants = <Variants>[];
      json['variants'].forEach((v) {
        variants!.add( Variants.fromJson(v));
      });
    }
    if (json['related_products'] != null) {
      relatedProducts = <RelatedProducts>[];
      json['related_products'].forEach((v) {
        relatedProducts!.add( RelatedProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = this.id;
    data['attribute_set_id'] = this.attributeSetId;
    data['name'] = this.name;
    data['sku'] = this.sku;
    if (this.shortDescription != null) {
      data['short_description'] = this.shortDescription!.toJson();
    }
    if (this.description != null) {
      data['description'] = this.description!.toJson();
    }
    if (this.reviews != null) {
      data['reviews'] = this.reviews!.toJson();
    }
    data['avg_reviews'] = this.avgReviews;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    if (this.smallImage != null) {
      data['small_image'] = this.smallImage!.toJson();
    }
    if (this.thumbnail != null) {
      data['thumbnail'] = this.thumbnail!.toJson();
    }
    if (this.mediaGallery != null) {
      data['media_gallery'] =
          this.mediaGallery!.map((v) => v.toJson()).toList();
    }
    data['__typename'] = this.sTypename;
    if (this.priceRange != null) {
      data['price_range'] = this.priceRange!.toJson();
    }
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    if (this.configurableOptions != null) {
      data['configurable_options'] =
          this.configurableOptions!.map((v) => v.toJson()).toList();
    }
    if (this.variants != null) {
      data['variants'] = this.variants!.map((v) => v.toJson()).toList();
    }
    if (this.relatedProducts != null) {
      data['related_products'] =
          this.relatedProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ShortDescription {
  String? html;

  ShortDescription({this.html});

  ShortDescription.fromJson(Map<String, dynamic> json) {
    html = json['html'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['html'] = this.html;
    return data;
  }
}

class Reviews {
  List<ReviewItems>? reviewItems;
  int? reviewCount;

  Reviews({this.reviewItems, this.reviewCount});

  Reviews.fromJson(Map<String, dynamic> json) {
    if (json['review_items'] != null) {
      reviewItems = <ReviewItems>[];
      json['review_items'].forEach((v) {
        reviewItems!.add( ReviewItems.fromJson(v));
      });
    }
    reviewCount = json['review_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (this.reviewItems != null) {
      data['review_items'] = this.reviewItems!.map((v) => v.toJson()).toList();
    }
    data['review_count'] = this.reviewCount;
    return data;
  }
}

class ReviewItems {
  int? reviewId;
  String? createdAt;
  String? title;
  String? detail;
  String? nickname;
  int? ratingValue;

  ReviewItems(
      {this.reviewId,
        this.createdAt,
        this.title,
        this.detail,
        this.nickname,
        this.ratingValue});

  ReviewItems.fromJson(Map<String, dynamic> json) {
    reviewId = json['review_id'];
    createdAt = json['created_at'];
    title = json['title'];
    detail = json['detail'];
    nickname = json['nickname'];
    ratingValue = json['rating_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['review_id'] = this.reviewId;
    data['created_at'] = this.createdAt;
    data['title'] = this.title;
    data['detail'] = this.detail;
    data['nickname'] = this.nickname;
    data['rating_value'] = this.ratingValue;
    return data;
  }
}

class Image {
  String? url;
  String? label;

  Image({this.url, this.label});

  Image.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    return data;
  }
}

class MediaGallery {
  String? url;

  MediaGallery({this.url});

  MediaGallery.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['url'] = this.url;
    return data;
  }
}

class PriceRange {
  MinimumPrice? minimumPrice;

  PriceRange({this.minimumPrice});

  PriceRange.fromJson(Map<String, dynamic> json) {
    minimumPrice = json['minimum_price'] != null
        ?  MinimumPrice.fromJson(json['minimum_price'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (this.minimumPrice != null) {
      data['minimum_price'] = this.minimumPrice!.toJson();
    }
    return data;
  }
}

class MinimumPrice {
  RegularPrice? regularPrice;

  MinimumPrice({this.regularPrice});

  MinimumPrice.fromJson(Map<String, dynamic> json) {
    regularPrice = json['regular_price'] != null
        ?  RegularPrice.fromJson(json['regular_price'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (this.regularPrice != null) {
      data['regular_price'] = this.regularPrice!.toJson();
    }
    return data;
  }
}

class RegularPrice {
  int? value;
  String? currency;

  RegularPrice({this.value, this.currency});

  RegularPrice.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['value'] = this.value;
    data['currency'] = this.currency;
    return data;
  }
}

class Categories {
  int? id;

  Categories({this.id});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}

class ConfigurableOptions {
  int? id;
  String? attributeId;
  String? label;
  int? position;
  bool? useDefault;
  String? attributeCode;
  List<Values>? values;
  int? productId;

  ConfigurableOptions(
      {this.id,
        this.attributeId,
        this.label,
        this.position,
        this.useDefault,
        this.attributeCode,
        this.values,
        this.productId});

  ConfigurableOptions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attributeId = json['attribute_id'];
    label = json['label'];
    position = json['position'];
    useDefault = json['use_default'];
    attributeCode = json['attribute_code'];
    if (json['values'] != null) {
      values = <Values>[];
      json['values'].forEach((v) {
        values!.add( Values.fromJson(v));
      });
    }
    productId = json['product_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = this.id;
    data['attribute_id'] = this.attributeId;
    data['label'] = this.label;
    data['position'] = this.position;
    data['use_default'] = this.useDefault;
    data['attribute_code'] = this.attributeCode;
    if (this.values != null) {
      data['values'] = this.values!.map((v) => v.toJson()).toList();
    }
    data['product_id'] = this.productId;
    return data;
  }
}

class Values {
  int? valueIndex;
  String? label;
  SwatchData? swatchData;

  Values({this.valueIndex, this.label, this.swatchData});

  Values.fromJson(Map<String, dynamic> json) {
    valueIndex = json['value_index'];
    label = json['label'];
    swatchData = json['swatch_data'] != null
        ?  SwatchData.fromJson(json['swatch_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['value_index'] = this.valueIndex;
    data['label'] = this.label;
    if (this.swatchData != null) {
      data['swatch_data'] = this.swatchData!.toJson();
    }
    return data;
  }
}

class SwatchData {
  String? value;

  SwatchData({this.value});

  SwatchData.fromJson(Map<String, dynamic> json) {
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['value'] = this.value;
    return data;
  }
}

class Variants {
  Product? product;
  List<Attributes>? attributes;

  Variants({this.product, this.attributes});

  Variants.fromJson(Map<String, dynamic> json) {
    product =
    json['product'] != null ?  Product.fromJson(json['product']) : null;
    if (json['attributes'] != null) {
      attributes = <Attributes>[];
      json['attributes'].forEach((v) {
        attributes!.add( Attributes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    if (this.attributes != null) {
      data['attributes'] = this.attributes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Product {
  int? id;
  String? name;
  String? sku;
  int? attributeSetId;
  int? weight;
  PriceRange? priceRange;

  Product(
      {this.id,
        this.name,
        this.sku,
        this.attributeSetId,
        this.weight,
        this.priceRange});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    sku = json['sku'];
    attributeSetId = json['attribute_set_id'];
    weight = json['weight'];
    priceRange = json['price_range'] != null
        ?  PriceRange.fromJson(json['price_range'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['sku'] = this.sku;
    data['attribute_set_id'] = this.attributeSetId;
    data['weight'] = this.weight;
    if (this.priceRange != null) {
      data['price_range'] = this.priceRange!.toJson();
    }
    return data;
  }
}

class Attributes {
  String? label;
  String? code;
  int? valueIndex;

  Attributes({this.label, this.code, this.valueIndex});

  Attributes.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    code = json['code'];
    valueIndex = json['value_index'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['label'] = this.label;
    data['code'] = this.code;
    data['value_index'] = this.valueIndex;
    return data;
  }
}

class RelatedProducts {
  int? id;
  String? sku;
  String? name;
  ShortDescription? shortDescription;
  Image? image;
  Image? smallImage;
  Image? thumbnail;
  String? urlKey;
  Null? specialPrice;
  PriceRange? priceRange;

  RelatedProducts(
      {this.id,
        this.sku,
        this.name,
        this.shortDescription,
        this.image,
        this.smallImage,
        this.thumbnail,
        this.urlKey,
        this.specialPrice,
        this.priceRange});

  RelatedProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sku = json['sku'];
    name = json['name'];
    shortDescription = json['short_description'] != null
        ?  ShortDescription.fromJson(json['short_description'])
        : null;
    image = json['image'] != null ?  Image.fromJson(json['image']) : null;
    smallImage = json['small_image'] != null
        ?  Image.fromJson(json['small_image'])
        : null;
    thumbnail = json['thumbnail'] != null
        ?  Image.fromJson(json['thumbnail'])
        : null;
    urlKey = json['url_key'];
    specialPrice = json['special_price'];
    priceRange = json['price_range'] != null
        ?  PriceRange.fromJson(json['price_range'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = this.id;
    data['sku'] = this.sku;
    data['name'] = this.name;
    if (this.shortDescription != null) {
      data['short_description'] = this.shortDescription!.toJson();
    }
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    if (this.smallImage != null) {
      data['small_image'] = this.smallImage!.toJson();
    }
    if (this.thumbnail != null) {
      data['thumbnail'] = this.thumbnail!.toJson();
    }
    data['url_key'] = this.urlKey;
    data['special_price'] = this.specialPrice;
    if (this.priceRange != null) {
      data['price_range'] = this.priceRange!.toJson();
    }
    return data;
  }
}

