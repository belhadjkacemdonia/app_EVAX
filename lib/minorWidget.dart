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
            controller: namepereController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Nom field must not be empty';
              }
              return null;
            },
            style: TextStyle(),
            decoration: InputDecoration(
                filled: true,
                hintText: "Le Nom du père",
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
                return 'Nom field must not be empty';
              }
              return null;
            },
            style: TextStyle(),
            decoration: InputDecoration(
                filled: true,
                hintText: "Le Nom de la mère",
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
