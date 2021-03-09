class TopicDetailEntity {
  int id;
  String headerImage;
  String brief;
  String text;
  String shareLink;
  List<TopicDetailItemData> itemList;
  int count;


  TopicDetailEntity({
      this.id, 
      this.headerImage, 
      this.brief, 
      this.text, 
      this.shareLink, 
      this.itemList, 
      this.count});

  TopicDetailEntity.fromJson(dynamic json) {
    id = json["id"];
    headerImage = json["headerImage"];
    brief = json["brief"];
    text = json["text"];
    shareLink = json["shareLink"];
    if (json["itemList"] != null) {
      itemList = [];
      json["itemList"].forEach((v) {
        itemList.add(TopicDetailItemData.fromJson(v));
      });
    }
    count = json["count"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["headerImage"] = headerImage;
    map["brief"] = brief;
    map["text"] = text;
    map["shareLink"] = shareLink;
    if (itemList != null) {
      map["itemList"] = itemList.map((v) => v.toJson()).toList();
    }
    map["count"] = count;
    return map;
  }

}


class TopicDetailItemData {
  String type;
  ContentData data;
  int id;
  int adIndex;

  TopicDetailItemData({
      this.type, 
      this.data,
      this.id, 
      this.adIndex});

  TopicDetailItemData.fromJson(dynamic json) {
    type = json["type"];
    data = json["data"] != null ? ContentData.fromJson(json["data"]) : null;
    id = json["id"];
    adIndex = json["adIndex"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["type"] = type;
    if (data != null) {
      map["data"] = data.toJson();
    }
    map["id"] = id;
    map["adIndex"] = adIndex;
    return map;
  }

}



class ContentData {
  String dataType;
  Header header;
  Content content;

  ContentData({
      this.dataType, 
      this.header, 
      this.content});

  ContentData.fromJson(dynamic json) {
    dataType = json["dataType"];
    header = json["header"] != null ? Header.fromJson(json["header"]) : null;
    content = json["content"] != null ? Content.fromJson(json["content"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["dataType"] = dataType;
    if (header != null) {
      map["header"] = header.toJson();
    }
    if (content != null) {
      map["content"] = content.toJson();
    }
    return map;
  }

}


class Content {
  String type;
  DataItem data;
  int id;
  int adIndex;

  Content({
      this.type, 
      this.data,
      this.id, 
      this.adIndex});

  Content.fromJson(dynamic json) {
    type = json["type"];
    data = json["data"] != null ? DataItem.fromJson(json["data"]) : null;
    id = json["id"];
    adIndex = json["adIndex"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["type"] = type;
    if (data != null) {
      map["data"] = data.toJson();
    }
    map["id"] = id;
    map["adIndex"] = adIndex;
    return map;
  }

}



class DataItem {
  String dataType;
  int id;
  String title;
  String description;
  String library;
  List<Tags> tags;
  Consumption consumption;
  String resourceType;
  String slogan;
  Provider provider;
  String category;
  Author author;
  Cover cover;
  String playUrl;
  int duration;
  WebUrl webUrl;
  int releaseTime;
  List<PlayInfo> playInfo;
  bool ad;
  String type;
  String remark;
  bool ifLimitVideo;
  int searchWeight;
  VideoPosterBean videoPosterBean;
  int idx;
  int date;
  String descriptionEditor;
  bool collected;
  bool reallyCollected;
  bool played;


  DataItem({
      this.dataType, 
      this.id, 
      this.title, 
      this.description, 
      this.library, 
      this.tags, 
      this.consumption, 
      this.resourceType, 
      this.slogan, 
      this.provider, 
      this.category, 
      this.author, 
      this.cover, 
      this.playUrl,
      this.duration, 
      this.webUrl, 
      this.releaseTime, 
      this.playInfo,
      this.ad,
      this.type,
      this.remark, 
      this.ifLimitVideo, 
      this.searchWeight,
      this.videoPosterBean, 
      this.idx,
      this.date,
      this.descriptionEditor, 
      this.collected, 
      this.reallyCollected, 
      this.played
    });

  DataItem.fromJson(dynamic json) {
    dataType = json["dataType"];
    id = json["id"];
    title = json["title"];
    description = json["description"];
    library = json["library"];
    if (json["tags"] != null) {
      tags = [];
      json["tags"].forEach((v) {
        tags.add(Tags.fromJson(v));
      });
    }
    consumption = json["consumption"] != null ? Consumption.fromJson(json["consumption"]) : null;
    resourceType = json["resourceType"];
    slogan = json["slogan"];
    provider = json["provider"] != null ? Provider.fromJson(json["provider"]) : null;
    category = json["category"];
    author = json["author"] != null ? Author.fromJson(json["author"]) : null;
    cover = json["cover"] != null ? Cover.fromJson(json["cover"]) : null;
    playUrl = json["playUrl"];
    duration = json["duration"];
    webUrl = json["webUrl"] != null ? WebUrl.fromJson(json["webUrl"]) : null;
    releaseTime = json["releaseTime"];
    if (json["playInfo"] != null) {
      playInfo = [];
      json["playInfo"].forEach((v) {
        playInfo.add(PlayInfo.fromJson(v));
      });
    }
    ad = json["ad"];
    type = json["type"];
    remark = json["remark"];
    ifLimitVideo = json["ifLimitVideo"];
    searchWeight = json["searchWeight"];
    videoPosterBean = json["videoPosterBean"] != null ? VideoPosterBean.fromJson(json["videoPosterBean"]) : null;
    idx = json["idx"];

    date = json["date"];

    descriptionEditor = json["descriptionEditor"];
    collected = json["collected"];
    reallyCollected = json["reallyCollected"];
    played = json["played"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["dataType"] = dataType;
    map["id"] = id;
    map["title"] = title;
    map["description"] = description;
    map["library"] = library;
    if (tags != null) {
      map["tags"] = tags.map((v) => v.toJson()).toList();
    }
    if (consumption != null) {
      map["consumption"] = consumption.toJson();
    }
    map["resourceType"] = resourceType;
    map["slogan"] = slogan;
    if (provider != null) {
      map["provider"] = provider.toJson();
    }
    map["category"] = category;
    if (author != null) {
      map["author"] = author.toJson();
    }
    if (cover != null) {
      map["cover"] = cover.toJson();
    }
    map["playUrl"] = playUrl;
    map["duration"] = duration;
    if (webUrl != null) {
      map["webUrl"] = webUrl.toJson();
    }
    map["releaseTime"] = releaseTime;
    if (playInfo != null) {
      map["playInfo"] = playInfo.map((v) => v.toJson()).toList();
    }
    map["type"] = type;
    map["remark"] = remark;
    map["ifLimitVideo"] = ifLimitVideo;
    map["searchWeight"] = searchWeight;
    if (videoPosterBean != null) {
      map["videoPosterBean"] = videoPosterBean.toJson();
    }
    map["idx"] = idx;
    map["date"] = date;
    map["descriptionEditor"] = descriptionEditor;
    map["collected"] = collected;
    map["reallyCollected"] = reallyCollected;
    map["played"] = played;
    return map;
  }

}


class VideoPosterBean {
  double scale;
  String url;
  String fileSizeStr;

  VideoPosterBean({
      this.scale, 
      this.url, 
      this.fileSizeStr});

  VideoPosterBean.fromJson(dynamic json) {
    scale = json["scale"];
    url = json["url"];
    fileSizeStr = json["fileSizeStr"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["scale"] = scale;
    map["url"] = url;
    map["fileSizeStr"] = fileSizeStr;
    return map;
  }

}



class PlayInfo {
  int height;
  int width;
  List<UrlList> urlList;
  String name;
  String type;
  String url;

  PlayInfo({
      this.height, 
      this.width, 
      this.urlList, 
      this.name, 
      this.type, 
      this.url});

  PlayInfo.fromJson(dynamic json) {
    height = json["height"];
    width = json["width"];
    if (json["urlList"] != null) {
      urlList = [];
      json["urlList"].forEach((v) {
        urlList.add(UrlList.fromJson(v));
      });
    }
    name = json["name"];
    type = json["type"];
    url = json["url"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["height"] = height;
    map["width"] = width;
    if (urlList != null) {
      map["urlList"] = urlList.map((v) => v.toJson()).toList();
    }
    map["name"] = name;
    map["type"] = type;
    map["url"] = url;
    return map;
  }

}


class UrlList {
  String name;
  String url;
  int size;

  UrlList({
      this.name, 
      this.url, 
      this.size});

  UrlList.fromJson(dynamic json) {
    name = json["name"];
    url = json["url"];
    size = json["size"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["name"] = name;
    map["url"] = url;
    map["size"] = size;
    return map;
  }

}



class WebUrl {
  String raw;
  String forWeibo;

  WebUrl({
      this.raw, 
      this.forWeibo});

  WebUrl.fromJson(dynamic json) {
    raw = json["raw"];
    forWeibo = json["forWeibo"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["raw"] = raw;
    map["forWeibo"] = forWeibo;
    return map;
  }

}



class Cover {
  String feed;
  String detail;
  String blurred;
  String homepage;

  Cover({
      this.feed, 
      this.detail, 
      this.blurred,
      this.homepage});

  Cover.fromJson(dynamic json) {
    feed = json["feed"];
    detail = json["detail"];
    blurred = json["blurred"];
    homepage = json["homepage"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["feed"] = feed;
    map["detail"] = detail;
    map["blurred"] = blurred;

    map["homepage"] = homepage;
    return map;
  }

}



class Author {
  int id;
  String icon;
  String name;
  String description;
  String link;
  int latestReleaseTime;
  int videoNum;
  Follow follow;
  Shield shield;
  int approvedNotReadyVideoCount;
  bool ifPgc;
  int recSort;
  bool expert;

  Author({
      this.id, 
      this.icon, 
      this.name, 
      this.description, 
      this.link, 
      this.latestReleaseTime, 
      this.videoNum,
      this.follow, 
      this.shield, 
      this.approvedNotReadyVideoCount, 
      this.ifPgc, 
      this.recSort, 
      this.expert});

  Author.fromJson(dynamic json) {
    id = json["id"];
    icon = json["icon"];
    name = json["name"];
    description = json["description"];
    link = json["link"];
    latestReleaseTime = json["latestReleaseTime"];
    videoNum = json["videoNum"];
    follow = json["follow"] != null ? Follow.fromJson(json["follow"]) : null;
    shield = json["shield"] != null ? Shield.fromJson(json["shield"]) : null;
    approvedNotReadyVideoCount = json["approvedNotReadyVideoCount"];
    ifPgc = json["ifPgc"];
    recSort = json["recSort"];
    expert = json["expert"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["icon"] = icon;
    map["name"] = name;
    map["description"] = description;
    map["link"] = link;
    map["latestReleaseTime"] = latestReleaseTime;
    map["videoNum"] = videoNum;
    if (follow != null) {
      map["follow"] = follow.toJson();
    }
    if (shield != null) {
      map["shield"] = shield.toJson();
    }
    map["approvedNotReadyVideoCount"] = approvedNotReadyVideoCount;
    map["ifPgc"] = ifPgc;
    map["recSort"] = recSort;
    map["expert"] = expert;
    return map;
  }

}

/// itemType : "author"
/// itemId : 2162
/// shielded : false

class Shield {
  String itemType;
  int itemId;
  bool shielded;

  Shield({
      this.itemType, 
      this.itemId, 
      this.shielded});

  Shield.fromJson(dynamic json) {
    itemType = json["itemType"];
    itemId = json["itemId"];
    shielded = json["shielded"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["itemType"] = itemType;
    map["itemId"] = itemId;
    map["shielded"] = shielded;
    return map;
  }

}

/// itemType : "author"
/// itemId : 2162
/// followed : false

class Follow {
  String itemType;
  int itemId;
  bool followed;

  Follow({
      this.itemType, 
      this.itemId, 
      this.followed});

  Follow.fromJson(dynamic json) {
    itemType = json["itemType"];
    itemId = json["itemId"];
    followed = json["followed"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["itemType"] = itemType;
    map["itemId"] = itemId;
    map["followed"] = followed;
    return map;
  }

}

/// name : "YouTube"
/// alias : "youtube"
/// icon : "http://img.kaiyanapp.com/fa20228bc5b921e837156923a58713f6.png"

class Provider {
  String name;
  String alias;
  String icon;

  Provider({
      this.name, 
      this.alias, 
      this.icon});

  Provider.fromJson(dynamic json) {
    name = json["name"];
    alias = json["alias"];
    icon = json["icon"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["name"] = name;
    map["alias"] = alias;
    map["icon"] = icon;
    return map;
  }

}

/// collectionCount : 1484
/// shareCount : 970
/// replyCount : 19
/// realCollectionCount : 616

class Consumption {
  int collectionCount;
  int shareCount;
  int replyCount;
  int realCollectionCount;

  Consumption({
      this.collectionCount, 
      this.shareCount, 
      this.replyCount, 
      this.realCollectionCount});

  Consumption.fromJson(dynamic json) {
    collectionCount = json["collectionCount"];
    shareCount = json["shareCount"];
    replyCount = json["replyCount"];
    realCollectionCount = json["realCollectionCount"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["collectionCount"] = collectionCount;
    map["shareCount"] = shareCount;
    map["replyCount"] = replyCount;
    map["realCollectionCount"] = realCollectionCount;
    return map;
  }

}


class Tags {
  int id;
  String name;
  String actionUrl;
  String bgPicture;
  String headerImage;
  String tagRecType;
  bool haveReward;
  bool ifNewest;
  int communityIndex;

  Tags({
      this.id, 
      this.name, 
      this.actionUrl,
      this.bgPicture, 
      this.headerImage, 
      this.tagRecType,
      this.haveReward, 
      this.ifNewest,
      this.communityIndex});

  Tags.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"];
    actionUrl = json["actionUrl"];
    bgPicture = json["bgPicture"];
    headerImage = json["headerImage"];
    tagRecType = json["tagRecType"];
    haveReward = json["haveReward"];
    ifNewest = json["ifNewest"];
    communityIndex = json["communityIndex"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["name"] = name;
    map["actionUrl"] = actionUrl;
    map["bgPicture"] = bgPicture;
    map["headerImage"] = headerImage;
    map["tagRecType"] = tagRecType;
    map["haveReward"] = haveReward;
    map["ifNewest"] = ifNewest;
    map["communityIndex"] = communityIndex;
    return map;
  }

}


class Header {
  int id;
  String actionUrl;
  String icon;
  String iconType;
  int time;
  bool showHateVideo;
  String followType;
  int tagId;
  String issuerName;
  bool topShow;

  Header({
      this.id, 
      this.actionUrl,
      this.icon, 
      this.iconType, 
      this.time, 
      this.showHateVideo, 
      this.followType, 
      this.tagId,
      this.issuerName, 
      this.topShow});

  Header.fromJson(dynamic json) {
    id = json["id"];
    actionUrl = json["actionUrl"];
    icon = json["icon"];
    iconType = json["iconType"];
    time = json["time"];
    showHateVideo = json["showHateVideo"];
    followType = json["followType"];
    tagId = json["tagId"];
    issuerName = json["issuerName"];
    topShow = json["topShow"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["actionUrl"] = actionUrl;
    map["icon"] = icon;
    map["iconType"] = iconType;
    map["time"] = time;
    map["showHateVideo"] = showHateVideo;
    map["followType"] = followType;
    map["tagId"] = tagId;
    map["issuerName"] = issuerName;
    map["topShow"] = topShow;
    return map;
  }

}