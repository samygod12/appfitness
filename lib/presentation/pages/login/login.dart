import 'package:appfitness/presentation/bloc/login%20cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);
  static Widget create(BuildContext context) => Login();

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LoginCubit, LoginState>(
        builder: (_,state){
              
              return Center(
                child: Column(
                  children: [
                    const SizedBox(height: 170,),
                    SizedBox(
                height: 300,
                child: Image.asset('assets/images/logon.jpeg',  fit: BoxFit.fill,),
              ),
                    IconButton(
                            onPressed: () =>
                                context.read<LoginCubit>().signInWithGoogle(),
                            icon: const Icon(
                              FontAwesomeIcons.google,
                              color: Colors.red,size: 40,
                            )),
                            const SizedBox(height: 20),
                            const Divider(color: Colors.black,),
                            Row(
                              children: [
                                const SizedBox(width: 185,),
                                IconButton(
                                                      onPressed: () =>
                                                    context.read<LoginCubit>().signInAnonymously(),
                                                    icon: const Icon(Icons.person, size: 67,),),
                              ],),
                ],),
              );
        },
      ),
    );
  }
}