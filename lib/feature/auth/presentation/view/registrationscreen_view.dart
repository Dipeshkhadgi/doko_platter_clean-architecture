import 'package:doko_platter_clean_architecture/feature/auth/presentation/view_model/registration/bloc/registration_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationscreenView extends StatefulWidget {
  const RegistrationscreenView({super.key});

  @override
  State<RegistrationscreenView> createState() => _RegistrationScreenViewState();
}

class _RegistrationScreenViewState extends State<RegistrationscreenView> {
  final _formKey = GlobalKey<FormState>();
  final _fnameController = TextEditingController(text: "Dipesh");
  final _lnameController = TextEditingController(text: "Khadgi");
  final _phoneController = TextEditingController(text: "1234");
  final _usernameController = TextEditingController(text: "Dipesh");
  final _passwordController = TextEditingController(text: "1234");

  final _gap = const SizedBox(height: 15);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Customer'),
        centerTitle: true,
      ),
      body: BlocListener<RegistrationBloc, RegistrationState>(
        listener: (context, state) {
          if (state.isSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Registration Successful')),
            );
          } else if (!state.isLoading && !state.isSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Registration Failed')),
            );
          }
        },
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/dp_logo.jpg'),
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                    controller: _fnameController,
                    decoration: const InputDecoration(labelText: 'First Name'),
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter first name' : null,
                  ),
                  _gap,
                  TextFormField(
                    controller: _lnameController,
                    decoration: const InputDecoration(labelText: 'Last Name'),
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter last name' : null,
                  ),
                  _gap,
                  TextFormField(
                    controller: _phoneController,
                    decoration:
                        const InputDecoration(labelText: 'Phone Number'),
                    keyboardType: TextInputType.phone,
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter phone number' : null,
                  ),
                  _gap,
                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(labelText: 'Username'),
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter username' : null,
                  ),
                  _gap,
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(labelText: 'Password'),
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter password' : null,
                  ),
                  _gap,
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<RegistrationBloc>().add(
                                RegisterCustomer(
                                  fName: _fnameController.text,
                                  lName: _lnameController.text,
                                  phoneNo: _phoneController.text,
                                  username: _usernameController.text,
                                  password: _passwordController.text,
                                  context: context,
                                ),
                              );
                        }
                      },
                      child: const Text('Register'),
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
