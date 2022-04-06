import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ichat_app/allProviders/auth_provider.dart';
import 'package:ichat_app/allScreens/home_page.dart';
import 'package:ichat_app/allWidgets/loading_view.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    switch(authProvider.status){
      case Status.authenticated:
        Fluttertoast.showToast(msg: "Sign in success");
        break;
      case Status.authenticateError:
        Fluttertoast.showToast(msg: "Sign in fail");
        break;
      case Status.authenticateCanceled:
        Fluttertoast.showToast(msg: "Sign in canceled");
        break;
      default:
        break;
    }
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.asset(
              "images/back.png",
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: GestureDetector(
              onTap: () async {
                bool isSuccess = await authProvider.handleSignIn();
                if(isSuccess){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
                }
              },
              child: Image.asset(
                "images/google_login.jpg"
              ),
            ),
          ),
          Positioned(child: authProvider.status == Status.authenticating ? LoadingView(): SizedBox.shrink())
        ],
      ),
    );
  }
}
