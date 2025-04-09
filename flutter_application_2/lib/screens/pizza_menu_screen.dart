import 'package:flutter/material.dart';

// Tela do Cardápio de Pizzas (RF005 - Funcionalidade Específica 1)
class PizzaMenuScreen extends StatelessWidget {
  PizzaMenuScreen({super.key});
  // Lista de pizzas (dados estáticos para demonstração)
  final List<Map<String, String>> _pizzas = [
    {
      'nome': 'Margherita',
      'descricao': 'Molho de tomate, mussarela, manjericão',
      'preco': 'R\$ 25,00',
      'imagem': 'Imagens/marguerita.png',
    },
    {
      'nome': 'Calabresa',
      'descricao': 'Molho de tomate, mussarela, calabresa, cebola',
      'preco': 'R\$ 28,00',
      'imagem': 'Imagens/calabresa.png',
    },
    {
      'nome': 'Portuguesa',
      'descricao':
          'Molho de tomate, mussarela, presunto, ovo, cebola, azeitona',
      'preco': 'R\$ 32,00',
      'imagem': 'Imagens/portuguesa.png',
    },
    {
      'nome': 'Frango com Catupiry',
      'descricao': 'Molho de tomate, mussarela, frango desfiado, catupiry',
      'preco': 'R\$ 35,00',
      'imagem': 'Imagens/franfocat.png',
    },
    {
      'nome': 'Mussarela',
      'descricao': 'Molho de tomate, mussarela',
      'preco': 'R\$ 22,00',
      'imagem': 'Imagens/4queijos.png',
    },
    {
      'nome': 'Pepperoni',
      'descricao': 'Molho de tomate, mussarela, pepperoni',
      'preco': 'R\$ 30,00',
      'imagem': 'Imagens/peperoni.png',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cardápio de Pizzas'),
        centerTitle: true,
        backgroundColor: const Color(0xFF2196F3),
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      backgroundColor: const Color.fromARGB(255, 242, 242, 242),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: _pizzas.length,
          itemBuilder: (context, index) {
            final pizza = _pizzas[index];
            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.asset(
                      pizza['imagem']!,
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            pizza['nome']!,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            pizza['descricao']!,
                            style: const TextStyle(fontSize: 14),
                          ),
                          Text(
                            pizza['preco']!,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}