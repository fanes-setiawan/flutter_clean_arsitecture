import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/core/input_validator.dart';
import 'package:testapp/presentation/blocs/register_bloc/register_bloc.dart';
import 'package:testapp/presentation/blocs/register_bloc/register_state.dart';
import 'package:testapp/presentation/widget/custom_text_form_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Form Register"), actions: const []),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: BlocConsumer<RegisterBloc, RegisterState>(
            listener: (context, state) {
              if (state is RegisterSuccess) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("Register Berhasil!!!")));
              } else if (state is RegisterFailure) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
              }
            },
            builder: (context, state) {
              return Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextFormFieldWidget(
                      controller: nameController,
                      label: "Name",
                      validator: (value) => InputValidator.validateName(value),
                    ),
                    const SizedBox(height: 12.0),
                    CustomTextFormFieldWidget(
                      controller: emailController,
                      label: "Email",
                      validator: (value) => InputValidator.validateEmail(value),
                    ),
                    const SizedBox(height: 12.0),
                    CustomTextFormFieldWidget(
                      controller: passController,
                      label: "Password",
                      validator:
                          (value) => InputValidator.validatePassword(value),
                    ),
                    const SizedBox(height: 12.0),
                    CustomTextFormFieldWidget(
                      controller: confirmPassController,
                      label: "Confirm Password",
                      validator:
                          (value) => InputValidator.validateConfirmPassword(
                            value,
                            passController.text,
                          ),
                    ),
                    const SizedBox(height: 20.0),
                    state is RegisterLoading
                        ? Center(child: CircularProgressIndicator())
                        : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(64.0),
                            ),
                          ),
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              context.read<RegisterBloc>().add(
                                RegisterSubmitted(
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passController.text,
                                ),
                              );
                            }
                          },
                
                          child: const Text("Register"),
                        ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
