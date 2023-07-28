/// result : [{"_id":"59f1e4919bfd8f3bd030eed6","pic":"public1WbzxpSbLF-vjDYTo.png","pid":"59f1e1ada1da8b15d42234e9","sort":"100","status":"1","title":"手机/电脑"},{"_id":"59f1e49a9bfd8f3bd030eed7","pic":"pubgE9O6zKajRTmb50B.png","pid":"59f1e1ada1da8b15d42234e9","sort":"100","status":"1","title":"轻薄本"}]

class RightModel {
  List<RightItem>? result;
  RightModel({
      this.result,});

  RightModel.fromJson(dynamic json) {
    if (json['result'] != null) {
      result = [];
      json['result'].forEach((v) {
        result?.add(RightItem.fromJson(v));
      });
    }
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (result != null) {
      map['result'] = result?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// _id : "59f1e4919bfd8f3bd030eed6"
/// pic : "public1WbzxpSbLF-vjDYTo.png"
/// pid : "59f1e1ada1da8b15d42234e9"
/// sort : "100"
/// status : "1"
/// title : "手机/电脑"

class RightItem {
  RightItem({
      this.id, 
      required this.pic,
      this.pid, 
      this.sort, 
      this.status, 
      this.title,});

  RightItem.fromJson(dynamic json) {
    id = json['_id'];
    pic = json['pic'];
    pid = json['pid'];
    sort = json['sort'];
    status = json['status'];
    title = json['title'];
  }
  String? id;
  String  pic="";
  String? pid;
  String? sort;
  Object? status;
  String? title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['pic'] = pic;
    map['pid'] = pid;
    map['sort'] = sort;
    map['status'] = status;
    map['title'] = title;
    return map;
  }

}