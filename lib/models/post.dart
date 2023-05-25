class Post {
  dynamic id;
  dynamic imagen;
  dynamic contenido;
  dynamic my_self;

  Post({
    this.id,
    this.imagen,
    this.contenido,
    this.my_self,
  });

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id'],
      imagen: map['imagen'],
      contenido: map['contenido'],
      my_self: map['my_self'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'imagen': imagen,
      'contenido': contenido,
      'my_self': my_self
    };
  }
}