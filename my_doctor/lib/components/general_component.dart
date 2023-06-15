import 'package:flutter/material.dart';
import 'package:toast/toast.dart'hide Toast;
import '../core/constants.dart';
import 'package:fluttertoast/fluttertoast.dart' ;


Widget defaultButton({
  required double  width,
  required VoidCallback? function,
  //Color background =defaultColor,
  bool isUpperCase =true,
  double radius =3.0,
  required String text,
   String? icon,


})=>Container(
  decoration: BoxDecoration(
 color: mainColor,
    borderRadius: BorderRadius.circular(16)
  ),
  width: width,
  height:50,

  child: MaterialButton(
    elevation: 3,
    onPressed: function,
    child:
        Text(
          isUpperCase ? text.toUpperCase() :text,

          style: TextStyle(
            color: Colors.white,
          ),
        ),

    ),

);

class CustomTextField extends StatelessWidget {

  CustomTextField({ required this.hintText, this.onChanged ,
    this.obscureText =false,this.inputType,
    required this.prefix, required this.controller,this.onTap,  this.suffix,this.suffixpressed,});

  Function(String)? onChanged;
  TextEditingController? controller;
  String? hintText;
  TextInputType? inputType;
  bool? obscureText;
   IconData? prefix;
  IconData? suffix;
 VoidCallback? onTap;
  VoidCallback? suffixpressed;
  bool isClicable = true;
  bool isPassword = false;
  void Function(String)?onSubmit;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360,

      child: TextFormField(
        onFieldSubmitted:onSubmit,
        obscureText: isPassword,
        enabled: isClicable,
        onTap: onTap,
        controller:controller ,
        //obscureText:obscureText!,
        keyboardType: inputType,
        onChanged: onChanged,
        validator: (data) {
          if (data!.isEmpty) {
            return 'field is required';
          }
        },
        decoration: InputDecoration(
          prefixIcon:Icon(prefix,color: mainColor,
          ),
          suffixIcon:Icon(suffix) ,
          hintText: hintText,
          hintStyle:const TextStyle(color: mainColor) ,
          enabledBorder: OutlineInputBorder(
              borderSide:  const BorderSide(
                  color: mainColor,
                      width: 3
              ),
              borderRadius: BorderRadius.circular(17)
          ),
          border: OutlineInputBorder(
              borderSide:  const BorderSide(
                //color: splash
              ),
              borderRadius: BorderRadius.circular(15)

          ),
        ),
      ),
    );
  }
}

void navigateTo(BuildContext context, Widget widget)=> Navigator.push(context,
  MaterialPageRoute(builder: (context)=>widget),
);


class InformationItem extends StatelessWidget {
  const InformationItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 280,
        decoration: BoxDecoration(
            color:Colors.white,
            borderRadius: BorderRadius.circular(30)
        ),
        child: Column(
          children:  [
            Image.asset('assets/images/360_F_320523164_tx7Rdd7I2XDTvvKfz2oRuRpKOPE5z0ni.jpg',
              width: 300,height: 200,),
            const SizedBox(height: 15,),
            const Text('medical information',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black
              ),)
          ],
        ),
      ),
    );
  }
}
void showToast({
  required String text,
  required ToastState state,
}) => Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: chooseToastColor(state),
    textColor: Colors.white,
    fontSize: 16.0
);
enum ToastState{SUCCESS,ERROR,WARNING}

Color chooseToastColor(ToastState state)
{
  Color color;
  switch(state)
  {

    case ToastState.SUCCESS:
      color = Colors.green;
      break;
    case ToastState.ERROR:
      color = Colors.red;
      break;
    case ToastState.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}