import 'package:flutter/material.dart';

// Tela do Cardápio de Bebidas (RF005 - Funcionalidade Específica 2)
class BebidasMenuScreen extends StatelessWidget {
  BebidasMenuScreen({super.key});
  // Lista de bebidas (dados estáticos para demonstração)
  final List<Map<String, String>> _bebidas = [
    {
      'nome': 'Coca-Cola',
      'descricao': 'Refrigerante sabor cola',
      'preco': 'R\$ 6,00',
      'imagem': 'Imagens/coca.png',
    },
    {
      'nome': 'Pepsi',
      'descricao': 'Refrigerante sabor cola',
      'preco': 'R\$ 5,50',
      'imagem': 'Imagens/pepsi.png',
    },
    {
      'nome': 'Suco de Laranja',
      'descricao': 'Suco natural de laranja',
      'preco': 'R\$ 8,00',
      'imagem': 'Imagens/sucolaranja.png',
    },
    {
      'nome': 'Água Mineral',
      'descricao': 'Água sem gás 500ml',
      'preco': 'R\$ 4,00',
      'imagem': 'Imagens/agua.png',
    },
    {
      'nome': 'Suco de Uva',
      'descricao': 'Suco natural de uva',
      'preco': 'R\$ 8,50',
      'imagem': 'Imagens/sucouva.png',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cardápio de Bebidas'),
        centerTitle: true,
        backgroundColor: const Color(0xFF2196F3),
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      backgroundColor: const Color.fromARGB(255, 242, 242, 242),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: _bebidas.length,
          itemBuilder: (context, index) {
            final bebida = _bebidas[index];
            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.asset(
                      bebida['imagem']!,
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
                            bebida['nome']!,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            bebida['descricao']!,
                            style: const TextStyle(fontSize: 14),
                          ),
                          Text(
                            bebida['preco']!,
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