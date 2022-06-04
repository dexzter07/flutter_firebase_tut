
import 'package:flutter/material.dart';
import 'package:flutter_firebase/views/auth/sign_up.dart';
import 'package:flutter_svg/svg.dart';
import '../../components/sign_in_form_component.dart';
import '../../constants/constants.dart';

class SignInPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset("assets/icons/Sign_Up_bg.svg",
            fit: BoxFit.cover,
          ),
          Padding(
            padding:  EdgeInsets.only(top: 10),
            child: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Sign In",
                      style: Theme.of(context).textTheme.headline5!.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        const Text("Don't have an account?"),
                        TextButton(onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpPage()));
                        },
                            child: const Text("Sign Up!",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                    const SizedBox(height: defaultPadding * 2,),
                    SignInForm(formKey: _formKey,),
                    const SizedBox(height: defaultPadding * 2,),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(onPressed: (){
                        if(_formKey.currentState!.validate()){//
                          _formKey.currentState!.save();
                        }
                      },
                          child: const Text("Sign In")),
                    ),
                    const SizedBox(height: defaultPadding,),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
