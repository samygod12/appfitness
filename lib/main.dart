import 'package:appfitness/data/repositories/user/login_repository.dart';
import 'package:appfitness/data/repositories/user/login_repository_impl.dart';
import 'package:appfitness/my_app.dart';
import 'package:appfitness/presentation/bloc/login%20cubit/login_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final loginCubit = LoginCubit(LoginRepositoryImpl());
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => loginCubit..init(),
        ),
        
      ],
      child: MyApp.create(),
    ),
  );
}