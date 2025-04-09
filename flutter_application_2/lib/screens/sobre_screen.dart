import 'package:flutter/material.dart';

// Tela Sobre (RF004)
class SobreScreen extends StatelessWidget {
  const SobreScreen({super.key});
  final String image = "Imagens/flutter.png";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sobre Nós',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 19, 0, 80),
        // Cor do AppBar
        foregroundColor: const Color(0xFF3BAAFF),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Logo da pizzaria
            Image.network(
              image,
              height: 150,
              errorBuilder: (context, error, stackTrace) {
                return const Text('Logo',
                    style: TextStyle(fontSize: 24, color: Colors.white));
              },
            ),
            const SizedBox(height: 24),
            const Text(
              '',
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF3BAAFF)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            const Text(
              'Neste projeto, desenvolvi um aplicativo multiplataforma utilizando o Flutter SDK, seguindo as diretrizes do Material Design para garantir uma interface intuitiva e fácil de usar. Implementei funcionalidades essenciais como login, cadastro de usuário, recuperação de senha e uma tela sobre o projeto. . Para exibição de mensagens, utilizei caixas de diálogo como AlertDialog e SnackBar, enquanto a listagem de dados foi feita com ListView e GridView.',
              style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 0, 0, 0)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            const Text(
              'Aplicativo Desenvolvido por: ',
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF3BAAFF)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              ' - Júlia Rocha Carniel',
              // Substitua pelos nomes dos alunos
              style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 0, 0, 0)),
              textAlign: TextAlign.center,
            ),
            // Adicione mais informações conforme necessário
          ],
        ),
      ),
    );
  }
}