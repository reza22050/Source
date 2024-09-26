import 'package:webinar/app/models/profile_model.dart';
import 'package:webinar/app/models/user_model.dart';

class CartModel {
  Amounts? amounts;
  var totalCashbackAmount;
  UserGroup? userGroup;
  
  late int id;
  int? discountAmount;
  String? voucherCode;
  List<Items>? items;

  CartModel({this.items, this.amounts, this.voucherCode, this.discountAmount, required this.id});

  CartModel.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];  
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
    amounts = json['amounts'] != null ? Amounts.fromJson(json['amounts']) : null;
    
    userGroup = json['user_group'] != null ? UserGroup.fromJson(json['user_group']) : null;
    totalCashbackAmount = json['totalCashbackAmount'];

    id=json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    if (amounts != null) {
      data['amounts'] = amounts!.toJson();
    }
    return data;
  }
}

class Items {
  String? type;
  String? image;
  String? teacherName;
  String? rate;
  String? day;
  String? timezone;
  Time? time;
  Time? timeUser;

  int? id;
  int? quantity;
  int? courseEnrollmentId;
  String? title;
  int? salePrice;
  int? originalPrice;
  int? discountPrice;
  int? enrollmentType;
  int? courseId;

  Items(
      {this.id,
      this.type,
      this.image,
      this.title,
      this.teacherName,
      this.rate,
      this.salePrice,
      this.discountPrice,
      this.quantity,
      this.courseEnrollmentId, 
      this.originalPrice, 
      this.enrollmentType, 
      this.courseId
      
      
      });

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    image = json['image'];
    title = json['title'];
    day = json['day'];
    timezone = json['timezone'];
    teacherName = json['teacher_name'];
    rate = json['rate']?.toString();
    salePrice = double.parse(json['price']?.toString() ?? '0').toInt();
    discountPrice = json['discountPrice'];
    quantity = json['quantity'];
    time = json['time'] != null ? Time.fromJson(json['time']) : null;
    timeUser = json['time_user'] != null ? Time.fromJson(json['time_user']) : null;

    courseEnrollmentId = json['courseEnrollmentId'];
    originalPrice = json['originalPrice'];
    enrollmentType = json['enrollmentType'];
    courseId = json['courseId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['image'] = image;
    data['title'] = title;
    data['teacher_name'] = teacherName;
    data['rate'] = rate;
    data['price'] = salePrice;
    data['discount'] = discountPrice;
    data['quantity'] = quantity;
    data['time_user'] = timeUser;
    return data;
  }
}

class Amounts {
  var subTotal;
  var totalDiscount;
  String? tax;
  var taxPrice;
  var commission;
  var commissionPrice;
  var total;
  var productDeliveryFee;
  bool? taxIsDifferent;

  Amounts(
      {this.subTotal,
      this.totalDiscount,
      this.tax,
      this.taxPrice,
      this.commission,
      this.commissionPrice,
      this.total,
      this.productDeliveryFee,
      this.taxIsDifferent});

  Amounts.fromJson(Map<String, dynamic> json) {
    subTotal = json['sub_total'];
    totalDiscount = json['total_discount'];
    tax = json['tax'];
    taxPrice = json['tax_price'];
    commission = json['commission'];
    commissionPrice = json['commission_price'];
    total = json['total']?.toInt();
    productDeliveryFee = json['product_delivery_fee'];
    taxIsDifferent = json['tax_is_different'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sub_total'] = subTotal;
    data['total_discount'] = totalDiscount;
    data['tax'] = tax;
    data['tax_price'] = taxPrice;
    data['commission'] = commission;
    data['commission_price'] = commissionPrice;
    data['total'] = total;
    data['product_delivery_fee'] = productDeliveryFee;
    data['tax_is_different'] = taxIsDifferent;
    return data;
  }
}