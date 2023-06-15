 import 'Auth_model.dart';
import 'Scedules_model.dart';

class BookingModel{
     int? id;
     String? patId;
     int? scdId;
     String? shakwa;
     String? comment;
     String? state;
     bool? status;
     ScadulesModel? scedules;

     BookingModel.fromJson(Map<String,dynamic>json)
     {
      id = json['id'];
      patId = json['patId'];
      scdId = json['scdId'];
      shakwa = json['shakwa'];
      comment = json['comment'];
      state = json['state'];
      status = json['status'];
      scedules = json['scedules'] != null ? ScadulesModel.fromjson(json['data'] ):null;


     }




 }

 // "id": 2,
 // "dateOnly": "2023-06-12T11:33:15.751",
 // "startTime": "2023-06-12T11:33:15.751",
 // "endTime": "2023-06-12T11:33:15.751",
 // "dayName": "Monday"