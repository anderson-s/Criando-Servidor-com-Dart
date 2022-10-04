import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';

import 'json.dart';
import 'pagina_html.dart';

//Utilizando o shelf para servidor web
void main(List<String> arguments) async {
  var app = Router(); //Componente do shelf para rotas
  // app.get('/', _handler);

  app.get("/", (request) {
    return Response(200, body: Json().codigoJson, headers: {
      'content-type': 'text/json',
    });
  });
  app.get("/html", (request) {
    return Response(200, body: PaginaHtml().pagina(), headers: {
      'content-type': 'text/html',
    });
  });

  //Função com request, endereço e porta
  final server = await io.serve(app, "0.0.0.0", 4466);

  print("Online. ${server.address.address}:${server.port}");
}

// FutureOr<Response> _handler(Request request) {
//   print(request);
//   if (request.url.path == "json") {
//     return Response(200, body: Json().retornarJson(), headers: {
//       'content-type': 'text/json',
//     });
//   } else if (request.url.path == "index.html") {
//     return Response(200, body: PaginaHtml().pagina(), headers: {
//       'content-type': 'text/html',
//     });
//   } else {
//     return Response(404);
//   }
// }
