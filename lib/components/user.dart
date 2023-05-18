class User {
  String userId;
  String firstName;
  String lastName;
  String email;
  String password;
  String encryptedPassword;
  String emailVerificationToken;
  String description;
  bool emailVerificationStatus;


  User({required this.userId ,required this.firstName, 
  required this.lastName ,required this.email ,required this.password,
  required this.encryptedPassword,required this.emailVerificationToken,
  required this.description,this.emailVerificationStatus=true,
  });
}