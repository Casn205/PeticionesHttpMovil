import '../lib/User.dart'; 
import 'Peticiones.dart';

void main() async {
  try {
    
    List<User> users = await fetchUsers(); // llama el metodo para hacer peticiones
                                           // que esta en Peticiones.dart
    
    List<User> usuariosFiltrados = FiltrarUsername(users); // obtiene una lista de usuarios
    print('Usuarios con username de mas de 6 caracteres: ${usuariosFiltrados.length}');
    for (var user in usuariosFiltrados) {
      user.MostrarDatos();
    }

    
    List<User> emailFiltrado = FiltrarDominio(users); // obtiene una lista de usuarios
    print("\n Cantidad de usuarios en dominio biz: ${emailFiltrado.length}");
    for (var user in emailFiltrado) {
      user.MostrarDatos();
    }

  } catch (e) {
    print('Error: $e'); // muestra el mensaje en caso de error del throw en Peticiones.dart
  }
}

// devuelve usuarios que tienen un username mayor de 6 caracteres
List<User> FiltrarUsername(List<User> users) {
  return users.where((user) => user.username.length > 6).toList();
}

// devuelve una lista de usuarios que tienen el dominio .biz en su email
List<User> FiltrarDominio(List<User> users) {
  return users.where((user) => user.email.endsWith('.biz')).toList();
}