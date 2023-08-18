


 import 'package:flutter/cupertino.dart';

class CheckoutProvider with ChangeNotifier{
   List checkoutList=[];
   void setCheckoutList(data){
     this.checkoutList=data;
     notifyListeners();
   }

 }