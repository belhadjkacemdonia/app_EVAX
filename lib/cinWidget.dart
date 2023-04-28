import 'package:flutter/material.dart';

class CinSignUp extends StatelessWidget {
  final TextEditingController? nameController;
  final TextEditingController? prenomController;
  final TextEditingController? cinController;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;

  const CinSignUp(
      {super.key,
      required this.nameController,
      required this.prenomController,
      required this.cinController,
      required this.emailController,
      required this.passwordController});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 35, right: 35),
      child: Column(
        children: [
          TextFormField(
            controller: nameController,
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
            controller: prenomController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Nom field must not be empty';
              }
              return null;
            },
            style: TextStyle(),
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
            controller: cinController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'CIN field must not be empty';
              }
              return null;
            },
            style: TextStyle(),
            decoration: InputDecoration(
                filled: true,
                hintText: "Cin",
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
