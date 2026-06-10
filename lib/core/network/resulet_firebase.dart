sealed class ResultFirebase<T> {}

class Success<T> extends ResultFirebase<T> {
  T data;
  Success(this.data);
}

class Error<T> extends ResultFirebase<T> {
  String error;
  Error(this.error);
}
