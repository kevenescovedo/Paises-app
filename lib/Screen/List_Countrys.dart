import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Classes/Paises.dart';
import 'package:http/http.dart';

class Listcountrys extends StatefulWidget {
  @override
  _ListcountrysState createState() => _ListcountrysState();

}

class _ListcountrysState extends State<Listcountrys> {
  String url = "https://restcountries.eu/rest/v2";
  Future<List<Country>> listar_paises() async {
    Response response = await get(url);

    var jsondata = json.decode(response.body);
    print(jsondata.runtimeType);

    List<Country> countrys = [];

    for (var c in jsondata ) {
   print(c["name"]);
   String flag = "https://flagcdn.com/32x24/"+ c["alpha2Code"].toLowerCase() +".png";
    Country country = new Country(
        c["name"],
        c["capital"],
        null,
        null,
       null,
      null,
      null,
      flag,
      null,
    );
    countrys.add(country);
    }
 return countrys;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Paises", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.deepPurple,

      ),
      body: Container(
        child: FutureBuilder<List<Country>>(
       future: listar_paises(),
          builder: (context,snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.done:
                if(snapshot.hasError) {
                  return Center(
                    child: Text("erro ao recuperar dados"),
                  );
                }
                else {
                  List<Country> paises = snapshot.data;
                  return ListView.builder(
                    itemCount: paises.length,
                    itemBuilder: (context,indice){
                      return ListTile(
                        leading: Image.network(paises[indice].flag),


                        title: Text(paises[indice].name) ,
                        subtitle: Text("Capital: ${paises[indice].capital}"),
                      );
                    },
                  );
                }
            }
          }
        ),
      ),
    );
  }
}
