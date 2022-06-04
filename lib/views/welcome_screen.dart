import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/constants.dart';
import 'auth/sign_in.dart';
import 'auth/sign_up.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset("assets/icons/splash_bg.svg",
          fit: BoxFit.cover,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                children: [
                  const Spacer(),
                  Image.network("https://www.gstatic.com/mobilesdk/160503_mobilesdk/logo/2x/firebase_28dp.png",fit: BoxFit.cover,),
                  const SizedBox(height: 20,),
                  Text("Flutter Firebase Tutorial",
                    style: Theme.of(context).textTheme.headline3!.copyWith(fontWeight: FontWeight.bold,color:  Colors.amberAccent),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: TextButton.styleFrom(backgroundColor: const Color(0xFF6CD8D1),
                      ),
                        onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpPage()));
                        },
                        child: const Text("Register New Account")
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          style: TextButton.styleFrom(
                              elevation: 0,
                            backgroundColor: Colors.transparent,
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(color: Color(0xFF6CD8D1))
                            )
                          ),
                          onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignInPage()));
                          },
                          child: const Text("Log In")
                      ),
                    ),
                  ),
                  const SizedBox(height: defaultPadding,),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
