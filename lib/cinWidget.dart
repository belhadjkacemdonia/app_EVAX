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

                )),
          ),
          SizedBox(
            height: 30,
          ),
          TextFormField(
            controller: cinController,
            validator: (value) {
              if (value!.isEmpty) {
                return ' Le champ CIN ne doit pas être vide';
              } else if (value.trim().length != 8 || int.tryParse(value.trim()) == null) {
                return 'CIN doit être exactement 8 chiffres';
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
