import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
part 'details_model.g.dart';


@HiveType(typeId: 0)
class DetailsModel extends HiveObject{

  @HiveField(0)
  String packageName;
  @HiveField(1)
  String price;

  @HiveField(2)
  String onNetMints;
  @HiveField(3)
  String ofNetMints;
  @HiveField(4)
  String mb;
  @HiveField(5)
  String socialMB;
  @HiveField(6)
  String sMS;
  @HiveField(7)
  String activationCode;
  @HiveField(8)
  String deactivationCode;

  //Images

  @HiveField(9)
  String companyImage;


  DetailsModel({
    required this.packageName,
    required this.price,
    required this.onNetMints,
    required this.ofNetMints,
    required this.mb,
    required this.socialMB,
    required this.sMS,
    required this.activationCode,
    required this.deactivationCode,
    required this.companyImage,
    });
}
