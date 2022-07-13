import 'package:logger/logger.dart';

Logger logger = Logger();

void debugLogging(dynamic message) {
  logger.d(message.toString());
}
