import 'package:flutter/material.dart';

class PassportSignUp extends StatelessWidget {
  final TextEditingController? nameController;
  final TextEditingController? prenomController;
  final TextEditingController? passpotController;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;

  const PassportSignUp(
      {super.key,
      required this.nameController,
      required this.prenomController,
      required this.passpotController,
      required this.emailController,
      required this.passwordController});
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
                return 'Prenom field must not be empty';
              }
              return null;
            },
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              hintText: "Prénom",
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
                return 'Nom field must not be empty';
              }
              return null;
            },
            style: TextStyle(),
            obscureText: true,
            decoration: InputDecoration(
                filled: true,
                hintText: "Nom",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
          ),
          SizedBox(
            height: 30,
          ),
          TextFormField(
            controller: passpotController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Passport field must not be empty';
              }
              return null;
            },
            style: TextStyle(),
            obscureText: true,
            decoration: InputDecoration(
                filled: true,
                hintText: "Pasport",
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
            controller: passpotController,
            style: TextStyle(),
            obscureText: true,
            validator: (value) {
              if (value!.isEmpty) {
                return 'password field must not be empty';
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
