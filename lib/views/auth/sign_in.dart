
import 'package:flutter/material.dart';
import 'package:flutter_firebase/views/auth/sign_up.dart';
import 'package:flutter_svg/svg.dart';
import '../../components/sign_in_form_component.dart';
import '../../components/sign_up_form_component.dart';
import '../../constants/constants.dart';
import '../../services/authentication_services.dart';

class SignInPage extends StatefulWidget {
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final AuthenticationServices _auth = AuthenticationServices();

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
            padding:  const EdgeInsets.only(top: 10),
            child: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Form(
                  key: _formKey,
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
                      const SizedBox(height: defaultPadding,),
                      const TextFieldName(text: "Email",),
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: emailValidator,
                      ),
                      const SizedBox(height: defaultPadding,),
                      const TextFieldName(text: "Password",),
                      TextFormField(
                        controller: _passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        validator: passwordValidator,
                      ),
                      const SizedBox(height: defaultPadding,),
                      const SizedBox(height: defaultPadding * 2,),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(onPressed: (){
                          if(_formKey.currentState!.validate()){
                            signInUser();

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
          ),
        ],
      ),
    );
  }

  void signInUser()async{
    dynamic authResult = await _auth.loginUser(_emailController.text, _passwordController.text);
    if(authResult == null){
      print("Invalid Login Crediantials");
    }
    else{
      _emailController.clear();
      _passwordController.clear();
      print("Login Successful");
      Navigator.pushNamed(context, '/dashboard');
    }
  }
}
