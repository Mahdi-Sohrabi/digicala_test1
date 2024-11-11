class Category1 {
  String? collectionId;
  String? id;
  String? thumbnail;
  String? title;
  String? color;
  String? icon;

  Category1(
    this.collectionId,
    this.id,
    this.thumbnail,
    this.title,
    this.color,
    this.icon,
  );

//http://127.0.0.1:8090/api/files/COLLECTION_ID_OR_NAME/RECORD_ID/FILENAME

  factory Category1.fromMapJson(Map<String, dynamic> jsonObject) {
    return Category1(
      jsonObject['collectionId'],
      jsonObject['id'],
      'https://startflutter.ir/api/files/${jsonObject['collectionId']}/${jsonObject['id']} /${jsonObject['thumbnail']}',
      jsonObject['title'],
      jsonObject['color'],
      jsonObject['icon'],
    );
  }
}
