class ProductImage {
  String? imageUrl;
  String? prductId;

  ProductImage(this.imageUrl, this.prductId);

  factory ProductImage.fromjson(Map<String, dynamic> jsonObject) {
    return ProductImage(
        'https://startflutter.ir/api/files/${jsonObject['collectionId']}/${jsonObject['id']}/${jsonObject['image']}',
        jsonObject['prduct_Id']);
  }
}
