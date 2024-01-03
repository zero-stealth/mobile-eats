class Validation{

  static String? errorEmail(controller){
    final email = controller.value.text;

    if(email.isEmpty){
      return 'Can\'t be empty';
    }
    if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)){
      return 'Email is not valid';
    }
    return null;
  }
  static String?  errorText (controller){
    // at any time, we can get the text from _controller.value.text
    final text = controller.value.text;
    // Note: you can do your own custom validation here
    // Move this logic this outside the widget for more testable code
    if (text.isEmpty) {
      return 'Can\'t be empty';
    }
    if (text.length < 4) {
      return 'Too short';
    }
    // return null if the text is valid
    return null;
  }
  static String? errorPhoneNumber (controller){
    final text = controller.value.text;
    if(text.isEmpty){
      return 'Phone number cant be empty';
    }
    if(text.length < 10){
      return 'Phone number not valid';
    }
    return null;
  }
  static String?  errorPassword (controller){
    // at any time, we can get the text from _controller.value.text
    final text = controller.value.text;
    // Note: you can do your own custom validation here
    // Move this logic this outside the widget for more testable code
    if (text.isEmpty) {
      return 'Can\'t be empty';
    }
    if (text.length < 6) {
      return 'Too short';
    }

    // return null if the text is valid
    return null;
  }
}