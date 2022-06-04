import 'package:flutter/material.dart';
import 'package:flutter_firebase/services/authentication_services.dart';
import 'package:flutter_firebase/views/auth/sign_in.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';


import '../../components/sign_up_form_component.dart';
import '../../constants/constants.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();

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
          Center(
            child: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Create Account",
                    style: Theme.of(context).textTheme.headline5!.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        const Text("Already have an account?"),
                        TextButton(onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignInPage()));
                        },
                            child: const Text("Sign In!",
                            style: TextStyle(fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                    const SizedBox(height: defaultPadding * 2,),
                Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: defaultPadding,),
                        const TextFieldName(text: "Name",),
                        TextFormField(
                          controller: _nameController,
                          keyboardType: TextInputType.text,
                        ),
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
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          validator: passwordValidator,
                        ),
                        const SizedBox(height: defaultPadding,),
                        const TextFieldName(text: "Confirm password",),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                        ),
                      ],
                    )),
                    const SizedBox(height: defaultPadding * 2,),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(onPressed: (){
                        if(_formKey.currentState!.validate()){
                          createUser();
                          _formKey.currentState!.save();
                        }
                      },
                          child: const Text("Sign Up")),
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

  void createUser()async{
    dynamic result = await _auth.createNewUser(_emailController.text, _passwordController.text);
    if(result == null){
      print("Email is not valid");
    }
    else{
      print(result.toString());
      _emailController.clear();
      _passwordController.clear();
      _nameController.clear();
      Navigator.pop(context);
    }
  }
}

