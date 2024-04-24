class SExceptions implements Exception{
  final String message; 

  const  SExceptions([this.message = 'An unknown exception occured. ']); 

  // Create an authen. message from a firebase auth exception code. 

  factory SExceptions.fromCode(String code){
    switch (code) {
      case 'email-already-in-use': 
      return const SExceptions('Email already exists'); 
      case 'invalid-email': 
      return const SExceptions('Email is not valid or badly formatted. '); 
      case 'weak-password': 
      return const SExceptions('Please enter a stronger password');
     
         case 'operation-not-allowed':
          return const SExceptions('Operation is not allowed. Please contact support.');

          case 'user-disabled': 
          return const SExceptions('This user has been disabled. Please contact support.');


      default : return const SExceptions();
    }
  } 
    }
  