import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListaBrazo extends StatefulWidget {
  ListaBrazo({Key? key}) : super(key: key);

  @override
  _ListaBrazoState createState() => _ListaBrazoState();
}

class _ListaBrazoState extends State<ListaBrazo> {
  final Stream<QuerySnapshot> brazos =
      FirebaseFirestore.instance.collection('brazos').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: brazos,
        builder: (
          BuildContext context,
          AsyncSnapshot<QuerySnapshot> snapshot,
        ) {
          if (snapshot.hasError) {
            return const Text('Error');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator(),
                Text('Cargando'),
              ],
            ));
          }
          final data = snapshot.requireData;
          return Scaffold(
            appBar: AppBar(backgroundColor: Colors.brown),
            body: ListView.builder(
                itemCount: data.size,
                itemBuilder: (context, index) {
                  return Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('${data.docs[index]['nombre']}',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.pink)),
                          SizedBox(height: 10,),
                          Card(
                              child: Image.network(
                                  '${data.docs[index]['image']}')),
                          Container(
                            margin: const EdgeInsets.only(
                                left: 20, right: 20, top: 10),
                            child: Text(
                                'Ejercicio: ${data.docs[index]['descripcion']}',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.black)),
                          ),
                          const Divider(
                            height: 30,
                            color: Colors.black,
                          ),
                        ]),
                  );
                }),
          );
        });
  }
}