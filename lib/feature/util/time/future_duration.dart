// The class that will be used to delay the execution of a function for a certain amount of time
class FutureDuration {
  // delay with milliseconds
  Future<void> delay(int milliseconds) async {
    await Future.delayed(Duration(milliseconds: milliseconds));
  }
}
