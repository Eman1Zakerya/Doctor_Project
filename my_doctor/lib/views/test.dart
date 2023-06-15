import 'package:flutter/material.dart';
import 'package:my_doctor/core/constants.dart';
class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: const BoxDecoration(
            color:mainColor,
                borderRadius: BorderRadius.only(
                    bottomRight:Radius.circular(50),
                    bottomLeft:Radius.circular(50) )
            ),
          ),
          Positioned(
            bottom: -60,
            child: Container(
              margin: const EdgeInsets.all(5),
              width: 150,
              height: 150,
              decoration:  BoxDecoration(
                image:const DecorationImage(
                    image:AssetImage('assets/images/360_F_320523164_tx7Rdd7I2XDTvvKfz2oRuRpKOPE5z0ni.jpg',),
                    fit: BoxFit.cover
                ),
                color: Color(0xff19A7CE),
                borderRadius: BorderRadius.circular(20)



              ),

            ),
          ),
        ],
      ),
    );
  }
}
