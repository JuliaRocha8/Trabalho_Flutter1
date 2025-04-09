import 'package:flutter/material.dart';

// Tela de Recuperação de Senha (RF003)
class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

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
        title: const Text('Alerta', style: TextStyle(color: Color(0xFF2196F3))),
        content: Text(mensagem,
            style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK', style: TextStyle(color: Colors.blue)),
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

  // Função para recuperar a senha
  void _recuperarSenha() {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text;
      // Aqui você pode adicionar a lógica para enviar um e-mail de recuperação de senha
      // ou qualquer outra ação necessária para recuperar a senha do usuário.
      // Por enquanto, vamos apenas mostrar uma mensagem de sucesso.
      _mostrarSnackBar('E-mail de recuperação enviado para $email');
      _mostrarAlertDialog(
          'Um e-mail de recuperação foi enviado para $email. Por favor, siga as instruções para redefinir sua senha.');
      _emailController.clear(); // Limpa o campo de e-mail após o envio
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recuperar Senha'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        // Cor do AppBar
        foregroundColor: Colors.blue,
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Text(
                'Insira seu e-mail para recuperar sua senha.',
                style: TextStyle(fontSize: 16, color: Colors.blue),
                textAlign: TextAlign.center,
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
                  labelStyle: TextStyle(color: Colors.blue),
                  focusedBorder: OutlineInputBorder(
                    // Cor da borda quando focado
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    // Cor da borda quando habilitado
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
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
              const SizedBox(height: 24),
              // Botão de recuperar senha
              ElevatedButton(
                onPressed: _recuperarSenha,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  backgroundColor: Colors.blue,
                  // Cor do botão
                  foregroundColor: Colors.black,
                  // Cor do texto do botão
                ),
                child: const Text(
                  'Recuperar Senha',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}