class ManyToMany {
  dynamic id;
  dynamic create_at;
  dynamic my_self;
  dynamic amigo;

  ManyToMany({
    this.id,
    this.my_self,
    this.amigo,
    this.create_at,
  });

  factory ManyToMany.fromMap(Map<String, dynamic> map) {
    return ManyToMany(
      id: map['id'],
      my_self: map['my_self'],
      amigo: map['amigo'],
      create_at: map['create_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'my_self': my_self,
      'amigo': amigo,
      'create_at': create_at,
    };
  }
}