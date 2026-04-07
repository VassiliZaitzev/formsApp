import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/register/register_cubit.dart';
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
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: const _RegisterView(),
      )
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



class _RegisterForm extends StatelessWidget {
  const _RegisterForm(

  );

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();
    final username = registerCubit.state.username;
    final password = registerCubit.state.password;
    final email = registerCubit.state.email;
    //final username = registerCubit.state.username;

    return Form(
      child: Column(
        children: [
          CustomTextFormField(
            label: "Nombre de usuario",
            onChanged: registerCubit.usernameChanged,
            errorMessage: username.errorMessage
          ),
          SizedBox(height: 20),
          CustomTextFormField(
            label: "Correo electrónico",
            onChanged: registerCubit.emailChanged,
            errorMessage: email.errorMessage,
          ),
          SizedBox(height: 20),

          CustomTextFormField(
            label: "Contraseña",
            obscureText: true,
            onChanged: registerCubit.passwordChanged,
            errorMessage: password.errorMessage,
          ),
          SizedBox(height: 20),

          FilledButton.tonalIcon(
            onPressed: (){

              registerCubit.onSubmit();
            }, 
            icon: Icon(Icons.save),
            label: Text("Crear Usuario"),
          ),
        ],
      )
    );
  }
}