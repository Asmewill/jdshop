/// result : [{"_id":"59f6ef443ce1fb0fb02c7a43","pic":"ahqPYzFvx_C9CQjU8KiX.png","status":"1","title":"笔记本电脑","url":"12"},{"_id":"5a012efb93ec4d199c18d1b4","pic":"PX5AA4Ov95Q7DEM.png","status":"1","title":"第二个轮播图"},{"_id":"5a012f2433574208841e0820","pic":"LuvBHvWFMJHzS.jpg","status":"1","title":"第三个轮播图"},{"_id":"5a688a0ca6dcba0ff4861a3d","pic":"pubV28ynDSp8TaGwd.png","status":"1","title":"教程"}]

class BannerModel {
  BannerModel({
    List<BannerItem>? result,
  }) {
    _result = result;
  }

  BannerModel.fromJson(dynamic json) {
    if (json['result'] != null) {
      _result = [];
      json['result'].forEach((v) {
        _result?.add(BannerItem.fromJson(v));
      });
    }
  }

  List<BannerItem>? _result;

  BannerModel copyWith({
    List<BannerItem>? result,
  }) =>
      BannerModel(
        result: result ?? _result,
      );

  List<BannerItem>? get result => _result;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_result != null) {
      map['result'] = _result?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// _id : "59f6ef443ce1fb0fb02c7a43"
/// pic : "ahqPYzFvx_C9CQjU8KiX.png"
/// status : "1"
/// title : "笔记本电脑"
/// url : "12"

class BannerItem {
  BannerItem({
    String? id,
    String? pic,
    String? status,
    String? title,
    String? url,
  }) {
    _id = id;
    _pic = pic;
    _status = status;
    _title = title;
    _url = url;
  }

  BannerItem.fromJson(dynamic json) {
    _id = json['_id'];
    _pic = json['pic'];
    _status = json['status'];
    _title = json['title'];
    _url = json['url'];
  }

  String? _id;
  String? _pic;
  String? _status;
  String? _title;
  String? _url;

  BannerItem copyWith({
    String? id,
    String? pic,
    String? status,
    String? title,
    String? url,
  }) =>
      BannerItem(
        id: id ?? _id,
        pic: pic ?? _pic,
        status: status ?? _status,
        title: title ?? _title,
        url: url ?? _url,
      );

  String? get id => _id;

  String? get pic => _pic;

  String? get status => _status;

  String? get title => _title;

  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['pic'] = _pic;
    map['status'] = _status;
    map['title'] = _title;
    map['url'] = _url;
    return map;
  }
}
