import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static final List<Map<String, String>> noticias = [
    {
      'titulo': 'Avanços na Inteligência Artificial em 2026',
      'resumo':
          'Novos modelos de linguagem prometem revolução no mercado de tecnologia e automação.',
      'categoria': 'Tecnologia',
      'data': '23/09/2026',
    },
    {
      'titulo': 'Seleção Brasileira vence amistoso preparatório',
      'resumo':
          'Com grande atuação do setor ofensivo, o time garante vitória convincente por 3 a 0.',
      'categoria': 'Esportes',
      'data': '22/09/2026',
    },
    {
      'titulo': 'Mercado financeiro reage positivamente aos novos dados',
      'resumo':
          'Ações de tecnologia e energia lideram os ganhos do dia na bolsa de valores.',
      'categoria': 'Economia',
      'data': '21/09/2026',
    },
    {
      'titulo': 'Novo festival de cinema independente anuncia programação',
      'resumo':
          'Evento contará com exibições gratuitas e oficinas com diretores premiados.',
      'categoria': 'Cultura',
      'data': '20/09/2026',
    },
  ];

  static final List<String> categorias = [
    "Todas",
    "Tecnologia",
    "Esportes",
    "Economia",
    "Cultura",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/img/logotipo.png',
          height: 22,
        ),
        centerTitle: true,
        actions: [
          const Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.search),
          ),
        ],
      ),
      drawer: const Drawer(),
      body: Column(
        children: [
          SizedBox(
            height: 45,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              children: categorias.map((categoria) {
                final selecionada = categoria == "todas";

                return Container(
                  margin: const EdgeInsets.only(right: 8),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: selecionada
                          ? Colors.black
                          : const Color(0xFFEDEDED),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    categoria,
                    style: const TextStyle(fontSize: 12),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
