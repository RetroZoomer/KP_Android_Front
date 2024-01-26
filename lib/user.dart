class User {
  String username;
  String password;
  String roles;

  User(this.password, this.username, this.roles);
}

class Role {
  String name;

  Role(this.name);
}