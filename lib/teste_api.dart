import 'package:app_noticias/model/noticia.dart';
import 'package:app_noticias/services/noticia_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TesteApi extends StatefulWidget {
  const TesteApi({super.key});

  @override
  State<TesteApi> createState() => _TesteApiState();
}

class _TesteApiState extends State<TesteApi> {
  String mensagem = 'Toque no botão para testar';

  final NoticiaService _noticiaService = NoticiaService();

  late Future<List<Noticia>> _listaNoticias;

  Future<void> carregarNoticias() async {
    _listaNoticias = _noticiaService.getNoticias();

    List<Noticia> noticias = await _listaNoticias;

    print('--- Teste no console ---');
    print('Quantidade de noticias: ${noticias.length}');
  }

  Future<void> testar() async {
    try {
      final resposta = await http.get(
        Uri.parse('http://10.0.2.2:8000/api/noticias'),
      );

      if (resposta.statusCode == 200) {
        mensagem = 'Conectado com sucesso';
      } else {
        mensagem = 'API respondeu com erro ${resposta.statusCode}';
      }
    } catch (erro) {
      mensagem = 'Não conectou erro: $erro';
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(onPressed: testar, child: const Text('Testar API')),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: carregarNoticias,
              child: const Text("Carregar Notícias"),
            ),
            Text(mensagem),
          ],
        ),
      ),
    );
  }
}
