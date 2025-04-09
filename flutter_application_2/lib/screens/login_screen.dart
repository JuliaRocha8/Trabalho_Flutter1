import 'package:flutter/material.dart';
import 'cadastro_screen.dart';


// Tela de Login 
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  // Dados de login
  String _email = '';
  String _password = '';
  final String image = "Imagens/capa1.png";
  // Função para validar o formato do e-mail
  bool _isValidEmail(String email) {
    final emailRegex = RegExp(
        r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(email);
  }

  // Função para mostrar um AlertDialog
  void _mostrarAlertDialog(String mensagem) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Alerta', style: TextStyle(color: Color(0xFF2196F3))), // Cor do título
        content: Text(mensagem, style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255))), // Cor do texto da mensagem
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK', style: TextStyle(color: Colors.blue)), // Cor do botão OK
          ),
        ],
      ),
    );
  }

  // Função para mostrar um SnackBar
  void _mostrarSnackBar(String mensagem) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensagem, style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  // Função para realizar o login
  void _login() {
    if (_formKey.currentState!.validate()) {
      // Atualiza os dados de login
      _email = _emailController.text;
      _password = _passwordController.text;

  

      if (_email == CadastroScreen.ultimoEmail && _password == CadastroScreen.ultimaSenha) {
        _mostrarSnackBar('Login realizado com sucesso!');
        // Navega para a tela principal após o login
        Navigator.pushReplacementNamed(context, '/home');
      } else if (_email == 'teste@teste.com' && _password == 'senha123') {
        _mostrarSnackBar('Login realizado com sucesso!');
        // Navega para a tela principal após o login
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        _mostrarAlertDialog('E-mail ou senha inválidos.');
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0), // Cor de fundo preta
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Logo da aplicação
              Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect( // Adiciona o ClipRRect aqui
                    borderRadius: BorderRadius.circular(40), // Define o raio do arredondamento
                    child: Image.network(
                      image, // Substitua pelo caminho do seu logo
                      height: 340,
                      errorBuilder: (context, error, stackTrace) {
                        return const Text('Logo da Pizzaria',
                            style: TextStyle(fontSize: 24, color: Color.fromARGB(255, 255, 255, 255))); // Cor do texto para contraste
                      },
                    ),
                  ),
                  // Texto "Sabores da Itália" sobreposto à imagem
                  const Text(
                    "Sabores da Itália \n\n\n\n",
                    style: TextStyle(
                      fontSize: 40, // Ajuste o tamanho da fonte conforme necessário
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2196F3), // Cor do texto
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),
              // Campo de e-mail
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email, color: Colors.blue),
                  // Cor do ícone
                  labelStyle: TextStyle(color: Colors.blue),
                  // Cor do label
                  focusedBorder: OutlineInputBorder(
                    // Cor da borda quando focado
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    // Cor da borda quando habilitado
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
                // Cor do texto digitado
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu e-mail.';
                  }
                  if (!_isValidEmail(value)) {
                    return 'Por favor, insira um e-mail válido.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              // Campo de senha
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock, color: Colors.blue),
                  // Cor do ícone
                  labelStyle: TextStyle(color: Colors.blue),
                  // Cor do label
                  focusedBorder: OutlineInputBorder(
                    // Cor da borda quando focado
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    // Cor da borda quando habilitado
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
                // Cor do texto digitado
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira sua senha.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              // Botão de login
              ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  backgroundColor: Colors.blue,
                  // Cor do botão
                  foregroundColor: const Color(0xFF000000),
                  // Cor do texto do botão
                ),
                child: const Text(
                  'Entrar',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 16),
              // Link para a tela de cadastro
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Não tem uma conta? ',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  // Cor do texto
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/cadastro');
                    },
                    child: const Text(
                      'Cadastre-se',
                      style: TextStyle(color: Colors.blue, fontSize: 18),
                    ),
                  ),
                ],
              ),
              // Link para a tela de recuperação de senha
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/forgot_password');
                  },
                  child: const Text(
                    '\n Esqueceu a senha?',
                    style: TextStyle(color: Colors.blue, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}