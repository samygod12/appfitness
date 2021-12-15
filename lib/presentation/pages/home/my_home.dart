import 'package:appfitness/presentation/bloc/login%20cubit/login_cubit.dart';
import 'package:appfitness/presentation/pages/home/listas/lista_abdomen.dart';
import 'package:appfitness/presentation/pages/home/listas/lista_brazo.dart';
import 'package:appfitness/presentation/pages/home/listas/lista_espalda.dart';
import 'package:appfitness/presentation/pages/home/listas/lista_hombros.dart';
import 'package:appfitness/presentation/pages/home/listas/lista_pecho.dart';
import 'package:appfitness/presentation/pages/home/listas/lista_pierna.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);
  static Widget create(BuildContext context) => MyHome();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Ejercicios para todos'),
        actions: [IconButton(
                    icon: const Icon(Icons.logout),
                    tooltip: 'Logout',
                    onPressed: () => context.read<LoginCubit>().signOut(),
                  )],),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            ElevatedButton(onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => ListaBrazo())), 
            child: Text('Rutinas de brazos'),),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => ListaPierna())),
            child: Text('Rutinas de piernas'),),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => ListaPecho())), 
            child: Text('Rutinas de pecho'),),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => ListaHombros())),
            child: Text('Rutinas de hombros'),),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => ListaEspalda())),
            child: Text('Rutinas de espalda'),),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => ListaAbdomen())),
            child: Text('Rutinas de abdomen'),),
            SizedBox(height: 20,),
          ],
        ), 
      ),
    );
  }
}