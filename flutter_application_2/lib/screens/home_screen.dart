import 'package:flutter/material.dart';
import 'pizza_menu_screen.dart';
import 'bebidas_menu_screen.dart';


// Tela Principal (Home)
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  final String image = "Imagens/iconepizza.png";
  // Função para mostrar um AlertDialog de confirmação de logout
  void _mostrarDialogLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Deslogar', style: TextStyle(color: Color(0xFF2196F3))),
        content: const Text('Deseja realmente sair do aplicativo?',
            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            // Fecha o diálogo
            child: const Text('Cancelar',
                style: TextStyle(color: Color.fromARGB(255, 124, 127, 131))),
          ),
          TextButton(
            onPressed: () {
              // Coloque aqui a lógica para deslogar o usuário
              Navigator.of(context).pop(); // Fecha o diálogo
              Navigator.pushReplacementNamed(
                  context, '/login'); // Volta para a tela de login
            },
            child: const Text('Sair', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cardápio'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        foregroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline, color: Colors.blue),
            onPressed: () {
              Navigator.pushNamed(context, '/sobre');
            },
            tooltip: 'Sobre Nós',
          ),
          IconButton(
            icon: const Icon(Icons.exit_to_app, color: Colors.blue),
            onPressed: () {
              _mostrarDialogLogout(context);
            },
            tooltip: 'Deslogar',
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Bem-vindo à Pizzaria Sabores da Itália!',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Image.network(
              image,
              height: 250,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),
            const Text(
              'Confira nosso delicioso cardápio de pizzas:',
              style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PizzaMenuScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: Colors.blue,
                foregroundColor: const Color.fromARGB(255, 255, 255, 255),
              ),
              child: const Text(
                'Ver Cardápio de Pizzas',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BebidasMenuScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: const Color(0xFF2196F3),
                foregroundColor: const Color.fromARGB(255, 255, 255, 255),
              ),
              child: const Text(
                'Ver Cardápio de Bebidas',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}