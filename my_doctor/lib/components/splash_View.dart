import 'package:flutter/material.dart';

import '../core/utils/size_config.dart';



class SplashViewBody extends StatefulWidget {
  const SplashViewBody({ Key? key }) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? fadingAnimation;
  @override
  void initState(){
    super.initState();
    animationController= AnimationController(vsync: this,duration: const Duration(milliseconds: 600));
    fadingAnimation =Tween<double>(begin: 0.2,end: 1).animate(animationController!);


    animationController?.repeat(reverse: true);

    goToNextView();
  }
  @override
  void dispose(){
    animationController?.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
         // width: MediaQuery.of(context).size.width,
          height:MediaQuery.of(context).size.height,
          child: Image.asset('assets/images/splash.PNG',
            fit: BoxFit.cover,
          ),
        ),
        FadeTransition(
          opacity: fadingAnimation!,
          child: const Text('My Doctor',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ),

      ],
    );
  }
  void goToNextView(){

    Future.delayed(Duration(seconds: 3),() {
      // Get.to(()=>const Home(),transition: Transition.fade);

    });
  }
}

