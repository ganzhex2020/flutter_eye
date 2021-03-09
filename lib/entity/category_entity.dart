/// id : 14
/// name : "广告"
/// alias : null
/// description : "为广告人的精彩创意点赞"
/// bgPicture : "http://img.kaiyanapp.com/57472e13fd2b6c9655c8a600597daf4d.png?imageMogr2/quality/60/format/jpg"
/// bgColor : ""
/// headerImage : "http://img.kaiyanapp.com/fc228d16638214b9803f46aabb4f75e0.png"
/// defaultAuthorId : 2162
/// tagId : 16

class CategoryEntity {
  int id;
  String name;
  String description;
  String bgPicture;
  String bgColor;
  String headerImage;
  int defaultAuthorId;
  int tagId;

  CategoryEntity({
      this.id, 
      this.name,
      this.description, 
      this.bgPicture, 
      this.bgColor, 
      this.headerImage, 
      this.defaultAuthorId, 
      this.tagId});

  CategoryEntity.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"];
    description = json["description"];
    bgPicture = json["bgPicture"];
    bgColor = json["bgColor"];
    headerImage = json["headerImage"];
    defaultAuthorId = json["defaultAuthorId"];
    tagId = json["tagId"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["name"] = name;
    map["description"] = description;
    map["bgPicture"] = bgPicture;
    map["bgColor"] = bgColor;
    map["headerImage"] = headerImage;
    map["defaultAuthorId"] = defaultAuthorId;
    map["tagId"] = tagId;
    return map;
  }

}