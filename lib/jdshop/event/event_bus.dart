import 'package:event_bus/event_bus.dart';
EventBus eventBus = EventBus();

//商品详情Event
class ProductContentEvent{
  String text;
  ProductContentEvent({this.text=""});
}

//商品详情Event
class UserEvent{
  String text;
  UserEvent({this.text=""});
}
//地址Event
class AddressEvent{
  String text;
  AddressEvent({this.text=""});
}
//核对Event
class CheckoutEvent{
  String text;
  CheckoutEvent({this.text=""});
}