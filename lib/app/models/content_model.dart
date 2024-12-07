import 'can_model.dart';

class ContentModel {
  int? type;
  int? id;
  String? title;
  int? topicsCount;
  int? createdAt;
  int? checkAllContentsPass;
  List<ContentItem>? items;
  bool isOpen=false;
  int? sort;
  String? videoTime;

  ContentModel(
      {
      this.type,
      this.id,
      this.title,
      this.topicsCount,
      this.createdAt,
      this.checkAllContentsPass,
      this.items, 
      this.sort,
      this.videoTime});

  ContentModel.fromJson(Map<String, dynamic> json) {
    id = json['courseSectionId'];
    title = json['courseSectionTitle'];
    if (json['courseActivities'] != null) {
      items = <ContentItem>[];
      json['courseActivities'].forEach((v) {
        items!.add(ContentItem.fromJson(v));
      });
    }
    sort =  json['courseSectionSort'];
    videoTime = json['courseSectionVideoTime'];

    topicsCount = json['topics_count'];
    type = json['type'];
    createdAt = json['created_at'];
    checkAllContentsPass = json['check_all_contents_pass'];

    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['id'] = id;
    data['title'] = title;
    data['topics_count'] = topicsCount;
    data['created_at'] = createdAt;
    data['check_all_contents_pass'] = checkAllContentsPass;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ContentItem {
  Can? can;
  var canViewError;
  bool? authHasRead;
  int? type;
  int? createdAt;
  String? link;
  int? id;
  String? title;
  String? fileType;
  String? storage;
  String? volume;
  String? summary;
  int? downloadable;
  String? time;
  int? questionCount;
  int? date;

  ContentItem(
      {this.can,
      this.canViewError,
      this.authHasRead,
      this.type,
      this.createdAt,
      this.link,
      this.id,
      this.title,
      this.fileType,
      this.storage,
      this.volume,
      this.downloadable,
      this.time,
      this.questionCount,
      this.date
    });

  ContentItem.fromJson(Map<String, dynamic> json) {
    id = json['courseActivityId'];
    title = json['courseActivityTitle'];
    type = json['courseActivityType'];
    time = json['videoTime'];
    downloadable = json['downloadable'] ?? 1;
    can = json['courseActicityStatus'] != null ? Can(view: json['courseActicityStatus'] == -1 ? false : true) : null; //Can.fromJson(json['can']) : null;

    canViewError = json['can_view_error'];
    authHasRead = json['auth_has_read'];
    createdAt = json['created_at'];
    link = json['link'];
    fileType = json['file_type'];
    storage = json['storage'];
    volume = json['volume'];
    questionCount = json['question_count'];
    date = json['date'];
    summary = json['summary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (can != null) {
      data['can'] = can!.toJson();
    }
    data['can_view_error'] = canViewError;
    data['auth_has_read'] = authHasRead;
    data['type'] = type;
    data['created_at'] = createdAt;
    data['link'] = link;
    data['id'] = id;
    data['title'] = title;
    data['file_type'] = fileType;
    data['storage'] = storage;
    data['volume'] = volume;
    data['downloadable'] = downloadable;
    return data;
  }
}

enum CourseActivityType {
  video,
  file
}

extension CourseActivityTypeExtension on CourseActivityType {
  int get value {
    switch (this) {
      case CourseActivityType.video:
        return 1;
      case CourseActivityType.file:
        return 2;
    }
  }
}