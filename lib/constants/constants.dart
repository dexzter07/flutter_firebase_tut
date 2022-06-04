import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

const primaryColor = Color(0xFF255ED6);
const textColor = Color(0xFF35364F);
const backgroundColor = Color(0xFFE6EFF9);
const redColor = Color(0xFFE85050);

const defaultPadding = 16.0;

OutlineInputBorder textFieldBorder = OutlineInputBorder(
    borderSide: BorderSide(color: primaryColor.withOpacity(0.1))
);

final emailValidator = MultiValidator(
    [
      RequiredValidator(errorText: "Email is required"),
      EmailValidator(errorText: "Invalid Email")

    ]
);

final passwordValidator = MultiValidator(
  [
  RequiredValidator(errorText: "Password is required"),
  MinLengthValidator(8, errorText: "Password must be at least 8 character long"),
  PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: "Password must have at least one special character")
  ]
);