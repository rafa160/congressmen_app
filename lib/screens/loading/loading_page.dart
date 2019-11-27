
import 'package:flutter/material.dart';



class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  bool isLoading = false;


  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(seconds: 3)
    );

    _animationController.addStatusListener((status){
      if(status == AnimationStatus.completed){

      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(image: AssetImage('assets/logo.png'),
            fit: BoxFit.contain),
      ),
    );
  }
}

