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
                return 'Le champ Prénom ne doit pas être vide';
              } else if (value.trim().length < 3) {
                return 'Le prénom doit comporter au moins 3 caractère';
              }
              return null;
            },
            style: TextStyle(),
            decoration: InputDecoration(
              filled: true,
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
                return 'Le champ Nom ne doit pas être vide';
              } else if (value.trim().length < 3) {
                return 'Le nom doit comporter au moins 3 caractères';
              }
              return null;
            },
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
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
                return 'Le champ du nom du père ne doit pas être vide';
              } else if (value.trim().length < 3) {
                return 'Le nom du père doit comporter au moins 3 caractères';
              }
              return null;
            },
            style: TextStyle(),
            decoration: InputDecoration(
                filled: true,
                hintText: "Le nom du père",
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
                return 'Le champ du nom de la mère ne doit pas être vide';
              } else if (value.trim().length < 3) {
                return 'Le nom de la mère doit comporter au moins 3 caractères';
              }
              return null;
            },
            style: TextStyle(),
            decoration: InputDecoration(
                filled: true,
                hintText: "Le nom de la mère",
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
                return 'Le champ Email ne doit pas être vide';
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
                return 'Le champ du mot de passe ne doit pas être vide';
              } else if (value.length < 6) {
                return 'Le mot de passe doit contenir au moins 6 caractères';
              } else if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])').hasMatch(value)) {
                return 'Le mot de passe doit contenir au moins une lettre majuscule, une lettre minuscule et un chiffre';
              }
              return null;
            },
            decoration: InputDecoration(
                filled: true,
                hintText: 'Mot de passe',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
          ),
        ],
      ),
    );
  }
}
