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

  factory Category1.fromMapJson(Map<String, dynamic> jsonObject) {
    return Category1(
      jsonObject['collectionId'],
      jsonObject['id'],
      jsonObject['thumbnail'],
      jsonObject['title'],
      jsonObject['color'],
      jsonObject['icon'],
    );
  }
}
