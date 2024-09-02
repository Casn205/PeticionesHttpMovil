class User {
  
  final int id;
  final String name;
  final String username;
  final String email;

  User({ //constructor
    required this.id,
    required this.name,
    required this.username,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) { // metodo para crear instancias
    return User(                                     // de User desde un json
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
    );
  }

  void MostrarDatos(){

  print("-----------$name-------------");
  print('ID: $id \nName: $name \nUsername: $username \nEmail: $email');
  print("-----------------------------");

}
}
