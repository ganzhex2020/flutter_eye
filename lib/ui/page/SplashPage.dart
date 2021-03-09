import 'package:flutter/material.dart';
import 'package:flutter_eye/common/Constant.dart';
import 'package:flutter_eye/utils/TimerUtil.dart';

class SplashPage extends StatefulWidget{


  @override
  State<StatefulWidget> createState() => _SplahPageState();

}

class _SplahPageState extends State<SplashPage>{
  TimerUtil _timerUtil;
  int _status = 0;
  int _count = 3;


  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500),(){
      setState(() {
        _status = 1;
      });
      _timerUtil = new TimerUtil(mTotalTime: 3 * 1000);
      _timerUtil.setOnTimerTickCallback((int tick) {
        double _tick = tick / 1000;
        setState(() {
          _count = _tick.toInt();
        });
        if (_tick == 0) {
          Navigator.of(context).pushReplacementNamed(Constant.routeMain);
        }
      });
      _timerUtil.startCountDown();
    });
  }

  @override
  Widget build(BuildContext context) {
      return new Material(
          child: _buildSplashBg()
      );
  }

  Widget _buildSplashBg() {
    return new Image.asset(
      'images/ic_splash.png',
      width: double.infinity,
      fit: BoxFit.fill,
      height: double.infinity,
    );
  }

  @override
  void dispose() {
    super.dispose();
    if (_timerUtil != null) _timerUtil.cancel(); //记得在dispose里面把timer cancel。
  }
}