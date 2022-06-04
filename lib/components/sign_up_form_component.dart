import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../constants/constants.dart';

class SignUpForm extends StatelessWidget {
  final GlobalKey formKey;
  late String _username, _email, _password, _phoneNumber;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  SignUpForm({Key? key,required this.formKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: defaultPadding,),
            const TextFieldName(text: "Name",),
            TextFormField(
              controller: _nameController,
              keyboardType: TextInputType.emailAddress,
              validator: emailValidator,
              onSaved: (email) => _email = email!,
            ),
            const SizedBox(height: defaultPadding,),
            const TextFieldName(text: "Email",),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              validator: emailValidator,
              onSaved: (email) => _email = email!,
            ),
            const SizedBox(height: defaultPadding,),
            const TextFieldName(text: "Password",),
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              validator: passwordValidator,
              onSaved: (password) => _password = password!,
            //  we also need to validate our password
            //  now if we type anything it adds that to our password
              onChanged: (pass) => _password = pass,
            ),
            const SizedBox(height: defaultPadding,),
            const TextFieldName(text: "Confirm password",),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              validator: (pass) => MatchValidator(errorText: "Password does not match").validateMatch(pass!, _password),
            ),
          ],
        ));
  }
}

class TextFieldName extends StatelessWidget {
  final String text;
  const TextFieldName({Key? key,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding / 3),
      child: Text(text,
        style: const TextStyle(fontWeight: FontWeight.w600,color: Colors.black54),
      ),
    );
  }
}
