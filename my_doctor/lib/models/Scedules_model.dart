
 class ScadulesModel{
  int? id;
  String? dateOnly;
  String? dayName;
  String? startTime;
  String? endTime;
  String? availability;


  ScadulesModel({
   required this.id,
   required this.dateOnly,
   required this.dayName,
   required this.startTime,
   required this.endTime,
   required this.availability,
  });


  factory ScadulesModel.fromjson(jsonData){
   return ScadulesModel(
    id: jsonData['id'],
    dateOnly: jsonData['dateOnly'],
    dayName: jsonData['dayName'],
    startTime: jsonData['startTime'],
    endTime: jsonData['endTime'],
    availability: jsonData['availability'],
   );
  }




  // ScadulesModel.fromJson(Map<String,dynamic>json)
  // {
  //  id = json['id'];
  //  dateOnly = json['dateOnly'];
  //  dayName = json['dayName'];
  //  startTime = json['startTime'];
  //  endTime = json['endTime'];
  //  availability = json['availability'];
  //
  // }
 }