import 'package:flutter/material.dart';
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Load Json"),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder(
          future: DefaultAssetBundle.of(context).loadString("load_json/persons.json"),
          builder: (context,snapshot){
            var personsList = json.decode(snapshot.data.toString());
            if(snapshot.connectionState == ConnectionState.waiting){
              return CircularProgressIndicator();
            }
            else if(snapshot.hasError){
              return Center(child: Text("Found Error"));
            }
            else{
              return ListView.builder(
                itemCount: personsList.length,
                itemBuilder: (context,index){
                  return Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text(personsList[index]['name']),
                       SizedBox(
                         height: 6,
                       ),
                       Text(personsList[index]['age'].toString()),
                       SizedBox(
                         height: 6,
                       ),
                       Text(personsList[index]['hair-color']),
                       SizedBox(
                         height: 6,
                       ),
                       Text(personsList[index]['occupation']),
                       SizedBox(
                         height: 6,
                       ),Text(personsList[index]['gender']),
                       SizedBox(
                         height: 6,
                       ),

                     ],
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
