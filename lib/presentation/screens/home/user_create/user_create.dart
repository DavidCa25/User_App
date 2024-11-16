import 'package:flutter/material.dart';
import 'package:userapp/presentation/widgets/user_textfield.dart';

class UserCreate extends StatefulWidget {
  const UserCreate({super.key});

  @override
  State<UserCreate> createState() => _UserCreateState();
}

class _UserCreateState extends State<UserCreate> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController occupationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear Perfil'),
        backgroundColor: Colors.purple[300],
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white, 
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.purpleAccent,
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  UserTextField(
                    controller: nameController,
                    labelText: 'Nombre',
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'El nombre no puede estar vacío';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  UserTextField(
                    controller: ageController,
                    labelText: 'Edad',
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'La edad no puede estar vacía';
                      }
                      if (int.tryParse(value) == null) {
                        return 'Ingresa una edad válida';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  UserTextField(
                    controller: occupationController,
                    labelText: 'Ocupación',
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'La ocupación no puede estar vacía';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      backgroundColor: Colors.purple[200],

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushNamed(
                          context,
                          '/Perfil',
                          arguments: {
                            'name': nameController.text.trim(),
                            'age': ageController.text.trim(),
                            'occupation': occupationController.text.trim(),
                          },
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Completa todos los campos correctamente')),
                        );
                      }
                    },
                    child: const Text(
                      
                      'Guardar y Ver Perfil',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      

                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
