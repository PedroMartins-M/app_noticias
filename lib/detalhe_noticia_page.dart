import 'package:app_noticias/model/noticia.dart';
import 'package:flutter/material.dart';

class DetalheNoticiaPage extends StatelessWidget {
  final Noticia noticia;

  const DetalheNoticiaPage({super.key, required this.noticia});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Noticia'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 120,
              color: const Color(0xFFE4E9EF),
              child: noticia.imagem == null || noticia.imagem!.isEmpty
                  ? const Center(
                      child: Icon(
                        Icons.image_not_supported_outlined,
                        size: 35,
                        color: Colors.grey,
                      ),
                    )
                  : Image.network(
                      noticia.imagem!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      errorBuilder: (context, error, stack) {
                        debugPrint(
                          'URL da imagem: ${noticia.imagem}',
                        );
                        debugPrint(
                          'Erro ao carregar imagem: $error',
                        );
        
                        return const Center(
                          child: Icon(
                            Icons.broken_image_outlined,
                            size: 35,
                            color: Colors.grey,
                          ),
                        );
                      },
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFEFF4F8),
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                          border: Border.all(
                            color: Colors.deepPurple,
                          ),
                        ),
                        child: Text(
                          noticia.categoriaNome,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Text(
                        ' ${noticia.dataFormatada}',
                        style: const TextStyle(
                          color: Color(0xFF858D96),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    ' ${noticia.titulo}',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    ' ${noticia.resumo}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF586879),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
