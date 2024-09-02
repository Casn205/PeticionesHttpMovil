import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:actividadhttpdart/User.dart'; 

Future<List<User>> fetchUsers() async {

  final url = Uri.parse('https://jsonplaceholder.typicode.com/users');
  final response = await http.get(url); //Realiza la peticion

  if (response.statusCode == 200) { //se verifica si la peticion es exitosa

    List<dynamic> usersJson = json.decode(response.body); // convierte el json a una lista
    return usersJson.map((json) => User.fromJson(json)).toList(); // se mapea la lista y la convierte en instancias de user

  } else { // La peticion no fue exitosa
    throw ('Se produjo un error al cargar los usuarios \nCodigo Error : ${response.statusCode}');
  }
}