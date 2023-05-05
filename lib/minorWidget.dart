import 'package:flutter/material.dart';

class MinorSignUp extends StatelessWidget {
  final TextEditingController? nameController;
  final TextEditingController? prenomController;
  final TextEditingController? namepereController;
  final TextEditingController? namemereController;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;

  const MinorSignUp(
      {super.key,
      required this.nameController,
      required this.prenomController,
      required this.emailController,
      required this.passwordController,
      required this.namepereController,
      required this.namemereController});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 35, right: 35),
      child: Column(
        children: [
          TextFormField(
            controller: prenomController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'First Name field must not be empty';
              } else if (value.trim().length < 3) {
                return 'First Name must be at least 3 characters long';
              }
              return null;
            },
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              hintText: "First Name ",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          TextFormField(
            controller: nameController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Last Name field must not be empty';
              } else if (value.trim().length < 3) {
                return 'Last Name must be at least 3 characters long';
              }
              return null;
            },
            style: TextStyle(),
            decoration: InputDecoration(
                filled: true,
                hintText: "Last Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
          ),
          SizedBox(
            height: 30,
          ),
          TextFormField(
            controller: namepereController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Father"s name field must not be empty';
              } else if (value.trim().length < 3) {
                return 'Father"s name must be at least 3 characters long';
              }
              return null;
            },
            style: TextStyle(),
            decoration: InputDecoration(
                filled: true,
                hintText: "Father's name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
          ),
          SizedBox(
            height: 30,
          ),
          TextFormField(
            controller: namemereController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Mother"s name field must not be empty';
              } else if (value.trim().length < 3) {
                return 'Mother"s name must be at least 3 characters long';
              }
              return null;
            },
            style: TextStyle(),
            decoration: InputDecoration(
                filled: true,
                hintText: "Mother's name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
          ),
          SizedBox(
            height: 30,
          ),
          TextFormField(
            controller: emailController,
            style: TextStyle(color: Colors.black),
            validator: (value) {
              if (value!.isEmpty) {
                return 'email field must not be empty';
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: "Email",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          TextFormField(
            controller: passwordController,
            style: TextStyle(),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Password field must not be empty';
              } else if (value.length < 6) {
                return 'Password must be at least 6 characters long';
              } else if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])').hasMatch(value)) {
                return 'Password must contain at least one uppercase letter, one lowercase letter, and one number';
              }
              return null;
            },
            decoration: InputDecoration(
                filled: true,
                hintText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
          ),
        ],
      ),
    );
  }
}
