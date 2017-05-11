import 'package:shelf/shelf_io.dart';
import 'package:shelf_static/shelf_static.dart';

void main() {
  var staticHandler = createStaticHandler('build/web/', defaultDocument: 'index.html');
  serve(staticHandler, '2601:247:c303:d820:6ec2:17ff:fe61:aeb8', 8080);
}