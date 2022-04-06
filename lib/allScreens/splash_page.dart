import 'package:flutter/material.dart';
import 'package:ichat_app/allConstants/color_constants.dart';
import 'package:ichat_app/allProviders/auth_provider.dart';
import 'package:ichat_app/allScreens/home_page.dart';
import 'package:ichat_app/allScreens/login_page.dart';
import 'package:provider/provider.dart';

class SpashScreen extends StatefulWidget {
  const SpashScreen({Key? key}) : super(key: key);

  @override
  State<SpashScreen> createState() => _SpashScreenState();
}

class _SpashScreenState extends State<SpashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      checkSignedIn();
    });
  }

  void checkSignedIn() async {
    AuthProvider authProvider = context.read<AuthProvider>();
    bool isLoggedIn = await authProvider.isLoggedIn();
    if(isLoggedIn) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
      return;
    }
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("images/splash.png",width: 300,height: 300,),
            SizedBox(height: 20,),
            Text("World's largest Private Chat App",style: TextStyle(color: ColorConstants.themeColor),),
            SizedBox(height: 20,),
            Container(
              width: 20, height: 20, child: CircularProgressIndicator(color: ColorConstants.themeColor,),
            )
          ],
        ),
      ),
    );
  }
}
