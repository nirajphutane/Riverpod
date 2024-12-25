
class Log {
  static int _id = 0;
  static d({final String tag = 'App Test', required final message}) => print('${10000 + _id++}=> $tag: $message');
}