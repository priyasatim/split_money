class UserData{
  String name;
  String email;

  UserData({required this.name,required this.email});


  // store data to firestore because firebase map data in toJson format
  toJson(){
    return {
      "name" : name,
      "Email" : email
    };
  }
}