import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doko_platter/features/auth/presentation/view/register_view.dart';
import 'package:doko_platter/features/auth/presentation/view_model/login/login_bloc.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  final _gap = const SizedBox(height: 8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    // Logo
                    Image.asset(
                      'assets/images/dp-logo.jpg',
                      height: 100,
                    ),
                    const SizedBox(height: 8),

                    // App Name
                    const Text(
                      'Doko Platter',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Brand Bold',
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Username Field
                    TextFormField(
                      key: const ValueKey('username'),
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Username',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter username';
                        }
                        return null;
                      },
                    ),
                    _gap,

                    // Password Field
                    TextFormField(
                      key: const ValueKey('password'),
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      },
                    ),
                    _gap,

                    // Login Button (Light Orange)
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange.shade300,
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          context.read<LoginBloc>().add(
                                LoginStudentEvent(
                                  context: context,
                                  username: _usernameController.text,
                                  password: _passwordController.text,
                                ),
                              );
                        }
                      },
                      child: const SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Brand Bold',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    _gap,

                    // Register Button (Light Orange)
                    ElevatedButton(
                      key: const ValueKey('registerButton'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange.shade300,
                      ),
                      onPressed: () {
                        context.read<LoginBloc>().add(
                              NavigateRegisterScreenEvent(
                                destination: RegisterView(),
                                context: context,
                              ),
                            );
                      },
                      child: const SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            'Register',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Brand Bold',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
