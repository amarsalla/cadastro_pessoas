import 'package:flutter/material.dart';

void main() {
  runApp(const CadastroPessoasApp());
}

class CadastroPessoasApp extends StatelessWidget {
  const CadastroPessoasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro de Pessoas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CadastroPessoasPage(),
    );
  }
}

class CadastroPessoasPage extends StatefulWidget {
  const CadastroPessoasPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CadastroPessoasPageState createState() => _CadastroPessoasPageState();
}

class _CadastroPessoasPageState extends State<CadastroPessoasPage> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _cpfController = TextEditingController();

  @override
  void dispose() {
    _nomeController.dispose();
    _cpfController.dispose();
    super.dispose();
  }

  void _cadastrarPessoa() {
    if (_formKey.currentState!.validate()) {

      // Aqui você pode adicionar a lógica para salvar os dados, como enviar para uma API ou salvar localmente

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Acho qro realizado com sucesso!')),
      );

      // Limpa os campos do formulário
      _formKey.currentState!.reset();
    }
  }

  String? _validarNome(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira o nome';
    }
    return null;
  }

  String? _validarCPF(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira o CPF';
    }
    // Validação simples de CPF (apenas verifica se tem 11 dígitos)
    if (value.length != 11) {
      return 'CPF deve conter 11 dígitos';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Pessoas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nomeController,
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: _validarNome,
              ),
              TextFormField(
                controller: _cpfController,
                decoration: const InputDecoration(labelText: 'CPF'),
                keyboardType: TextInputType.number,
                validator: _validarCPF,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _cadastrarPessoa,
                child: const Text('Cadastrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}