import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
part 'details_model.g.dart';


@HiveType(typeId: 0)
class DetailsModel extends HiveObject{
  @HiveField(0)
  String price;
  @HiveField(1)
  String onNetMints;
  @HiveField(2)
  String ofNetMints;
  @HiveField(3)
  String mb;
  @HiveField(4)
  String socialMB;
  @HiveField(5)
  String sMS;
  @HiveField(6)
  String activationCode;
  @HiveField(7)
  String deactivationCode;

  //Images

  @HiveField(8)
  String shareImage;
  @HiveField(9)
  String sipCallImage;
  @HiveField(10)
  String copyImage;

  DetailsModel({
    required this.price,
    required this.onNetMints,
    required this.ofNetMints,
    required this.mb,
    required this.socialMB,
    required this.sMS,
    required this.activationCode,
    required this.deactivationCode,
    required this.shareImage,
    required this.sipCallImage,
    required this.copyImage,});
}
