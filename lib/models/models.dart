class Usuario {
  dynamic id;
  dynamic imagen;
  dynamic nombre;
  dynamic apellido;
  dynamic user_name;
  dynamic email;
  dynamic password;
  dynamic is_active;
  dynamic create_at;

  Usuario({
    this.id,
    this.imagen,
    this.nombre,
    this.apellido,
    this.user_name,
    this.email,
    this.password,
    this.is_active,
    this.create_at,
  });

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      id: map['id'],
      imagen: map['imagen'],
      nombre: map['nombre'],
      apellido: map['apellido'],
      user_name: map['user_name'],
      email: map['email'],
      password: map['password'],
      is_active: map['is_active'],
      create_at: map['create_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'imagen': imagen,
      'nombre': nombre,
      'apellido': apellido,
      'user_name': user_name,
      'email': email,
      'password': password,
      'is_active': is_active,
      'create_at': create_at,
    };
  }
}