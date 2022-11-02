class RegisterUserModel {
  String? name;
  String? email;
  String? password;
  String? confirmedPassword;

  RegisterUserModel(
      {this.email, this.confirmedPassword, this.name, this.password});

  String validData(RegisterUserModel register) {
    if (register.confirmedPassword != register.password) {
      return 'Senhas não coincidem';
    } else if (!register.email!.contains('.') ||
        !register.email!.contains('@')) {
      return 'E-mail inválido';
    } else if (register.confirmedPassword!.isEmpty ||
        register.password!.isEmpty ||
        register.name!.isEmpty ||
        register.email!.isEmpty) {
      return 'Nenhum campo pode ser nulo';
    } else {
      return '';
    }
  }
}
