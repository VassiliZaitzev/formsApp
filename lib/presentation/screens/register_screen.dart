import 'package:flutter/material.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.primary,
        title: const Text("Nuevo Usuario", style: TextStyle(color: Colors.white),),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: _RegisterView(),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 60),
              FlutterLogo(size: 100),
              SizedBox(height: 20),
              _RegisterForm(),
              
              SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }
}



class _RegisterForm extends StatefulWidget {
  const _RegisterForm(

  );

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? username;
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            label: "Nombre de usuario",
            onChanged: (value) => username = value,
            validator: (value) {
              if(value == null || value.isEmpty) return "Campo requerido";
              if(value.trim().isEmpty) return "Campo requerido";
              if(value.length <6 ) return "El nombre debe contener más de 6 letras";
              return null;
            },
          ),
          SizedBox(height: 20),
          CustomTextFormField(
            label: "Correo electrónico",
            onChanged: (value) => email = value,

            validator: (value) {
              if(value == null || value.isEmpty) return "Campo requerido";
              if(value.trim().isEmpty) return "Campo requerido";
              final emailRegExp = RegExp(
                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
              );

              if(!emailRegExp.hasMatch(value)) return "No tiene formato de correo";

              return null;
            },
          ),
          SizedBox(height: 20),

          CustomTextFormField(
            label: "Contraseña",
            obscureText: true,
            onChanged: (value) => password = value,
            validator: (value) {
              if(value == null || value.isEmpty) return "Campo requerido";
              if(value.trim().isEmpty) return "Campo requerido";
              if(value.length <6 ) return "La contraseña debe contener más de 6 letras";
              return null;
            },
          ),
          SizedBox(height: 20),

          FilledButton.tonalIcon(
            onPressed: (){
              final isValid = _formKey.currentState!.validate();
              if(!isValid) return;
              //print("$username, $email, $password");
            }, 
            icon: Icon(Icons.save),
            label: Text("Crear Usuario"),
          ),
        ],
      )
    );
  }
}