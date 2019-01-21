

import "dart:async";


mixin Validator{
var emailValidator = StreamTransformer<String, String>.fromHandlers(
  handleData: (email, sink){
if( email.contains("@") && email.length > 10){
  sink.add(email);
}
else{
  sink.addError("email is not valid");
}
  }
);
var passwordValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink){
      if( password.contains("@") && password.length > 10){
        sink.add(password);
      }
      else{
        sink.addError("invalid passwrd");
      }
    }
);


}