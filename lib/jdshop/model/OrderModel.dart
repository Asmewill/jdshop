/// message : "成功"
/// result : [{"_id":"64dc4a82149c900007181939","address":"湖北省孝感市云梦县/111","all_price":"5941.0","name":"shuij","order_item":[{"_id":"64dc4a82149c90000718193a","add_time":1692158594184,"order_id":"64dc4a82149c900007181939","product_count":1,"product_id":"5a080ac5ad8b300e28e2fec7","product_img":"W2B5NKXcTmEK.jpg","product_price":1233,"product_title":"三星 Galaxy S7 edge（G9350）4GB+32GB 铂光金 移动联通电信4G手机","selected_attr":"黑色,5寸"},{"_id":"64dc4a82149c90000718193b","add_time":1692158594187,"order_id":"64dc4a82149c900007181939","product_count":2,"product_id":"5a080a7dad8b300e28e2fec5","product_img":"a6ogKOPuNN5JB.jpg","product_price":2354,"product_title":"荣耀9 全网通 标配版 4GB+64GB 魅海蓝 移动联通电信4G手机 双卡双待","selected_attr":"黑色,6寸"}],"order_status":0,"pay_status":0,"phone":"13148735193","uid":"64d21c28149c90000718191f"}]
/// success : true

class OrderModel {
  OrderModel({
      this.message, 
      this.result, 
      this.success,});

  OrderModel.fromJson(dynamic json) {
    message = json['message'];
    if (json['result'] != null) {
      result = [];
      json['result'].forEach((v) {
        result?.add(OrderResult.fromJson(v));
      });
    }
    success = json['success'];
  }
  String? message;
  List<OrderResult>? result;
  bool? success;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (result != null) {
      map['result'] = result?.map((v) => v.toJson()).toList();
    }
    map['success'] = success;
    return map;
  }

}

/// _id : "64dc4a82149c900007181939"
/// address : "湖北省孝感市云梦县/111"
/// all_price : "5941.0"
/// name : "shuij"
/// order_item : [{"_id":"64dc4a82149c90000718193a","add_time":1692158594184,"order_id":"64dc4a82149c900007181939","product_count":1,"product_id":"5a080ac5ad8b300e28e2fec7","product_img":"W2B5NKXcTmEK.jpg","product_price":1233,"product_title":"三星 Galaxy S7 edge（G9350）4GB+32GB 铂光金 移动联通电信4G手机","selected_attr":"黑色,5寸"},{"_id":"64dc4a82149c90000718193b","add_time":1692158594187,"order_id":"64dc4a82149c900007181939","product_count":2,"product_id":"5a080a7dad8b300e28e2fec5","product_img":"a6ogKOPuNN5JB.jpg","product_price":2354,"product_title":"荣耀9 全网通 标配版 4GB+64GB 魅海蓝 移动联通电信4G手机 双卡双待","selected_attr":"黑色,6寸"}]
/// order_status : 0
/// pay_status : 0
/// phone : "13148735193"
/// uid : "64d21c28149c90000718191f"

class OrderResult {
  OrderResult({
      this.id, 
      this.address, 
      this.allPrice, 
      this.name, 
      this.orderItem, 
      this.orderStatus, 
      this.payStatus, 
      this.phone, 
      this.uid,});

  OrderResult.fromJson(dynamic json) {
    id = json['_id'];
    address = json['address'];
    allPrice = json['all_price'];
    name = json['name'];
    if (json['order_item'] != null) {
      orderItem = [];
      json['order_item'].forEach((v) {
        orderItem?.add(OrderItem.fromJson(v));
      });
    }
    orderStatus = json['order_status'];
    payStatus = json['pay_status'];
    phone = json['phone'];
    uid = json['uid'];
  }
  String? id;
  String? address;
  String? allPrice;
  String? name;
  List<OrderItem>? orderItem;
  num? orderStatus;
  num? payStatus;
  String? phone;
  String? uid;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['address'] = address;
    map['all_price'] = allPrice;
    map['name'] = name;
    if (orderItem != null) {
      map['order_item'] = orderItem?.map((v) => v.toJson()).toList();
    }
    map['order_status'] = orderStatus;
    map['pay_status'] = payStatus;
    map['phone'] = phone;
    map['uid'] = uid;
    return map;
  }

}

/// _id : "64dc4a82149c90000718193a"
/// add_time : 1692158594184
/// order_id : "64dc4a82149c900007181939"
/// product_count : 1
/// product_id : "5a080ac5ad8b300e28e2fec7"
/// product_img : "W2B5NKXcTmEK.jpg"
/// product_price : 1233
/// product_title : "三星 Galaxy S7 edge（G9350）4GB+32GB 铂光金 移动联通电信4G手机"
/// selected_attr : "黑色,5寸"

class OrderItem {
  OrderItem({
      this.id, 
      this.addTime, 
      this.orderId, 
      this.productCount, 
      this.productId, 
      this.productImg, 
      this.productPrice, 
      this.productTitle, 
      this.selectedAttr,});

  OrderItem.fromJson(dynamic json) {
    id = json['_id'];
    addTime = json['add_time'];
    orderId = json['order_id'];
    productCount = json['product_count'];
    productId = json['product_id'];
    productImg = json['product_img'];
    productPrice = json['product_price'];
    productTitle = json['product_title'];
    selectedAttr = json['selected_attr'];
  }
  String? id;
  num? addTime;
  String? orderId;
  num? productCount;
  String? productId;
  String? productImg;
  num? productPrice;
  String? productTitle;
  String? selectedAttr;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['add_time'] = addTime;
    map['order_id'] = orderId;
    map['product_count'] = productCount;
    map['product_id'] = productId;
    map['product_img'] = productImg;
    map['product_price'] = productPrice;
    map['product_title'] = productTitle;
    map['selected_attr'] = selectedAttr;
    return map;
  }

}