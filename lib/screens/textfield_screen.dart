import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/screen_header.dart';

class TextFieldScreen extends StatefulWidget {
  const TextFieldScreen({Key? key}) : super(key: key);

  @override
  State<TextFieldScreen> createState() => _TextFieldScreenState();
}

class _TextFieldScreenState extends State<TextFieldScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  String _displayText = '';

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'TextField',
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ScreenHeader(
              title: 'TextFields',
              description: 'Los TextFields permiten a los usuarios ingresar texto. Son fundamentales para formularios, '
                  'búsquedas y cualquier entrada de datos.',
              icon: Icons.text_fields,
              color: Colors.blue,
            ),
            const SizedBox(height: 24),

            _buildTextField(
              controller: _nameController,
              label: 'Nombre completo',
              icon: Icons.person,
              hint: 'Ingresa tu nombre',
            ),
            const SizedBox(height: 16),

            _buildTextField(
              controller: _emailController,
              label: 'Correo electrónico',
              icon: Icons.email,
              hint: 'ejemplo@correo.com',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),

            _buildTextField(
              controller: _phoneController,
              label: 'Teléfono',
              icon: Icons.phone,
              hint: '+52 555 123 4567',
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 16),

            _buildTextField(
              controller: _passwordController,
              label: 'Contraseña',
              icon: Icons.lock,
              hint: 'Mínimo 8 caracteres',
              obscureText: true,
              suffixIcon: Icons.visibility_off,
            ),
            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _showInformation,
                icon: const Icon(Icons.preview),
                label: const Text('Mostrar Información'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                ),
              ),
            ),

            if (_displayText.isNotEmpty) ...[
              const SizedBox(height: 16),
              _buildResultCard(),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    String? hint,
    TextInputType? keyboardType,
    bool obscureText = false,
    IconData? suffixIcon,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon),
        suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
        border: const OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue.shade700, width: 2),
        ),
      ),
    );
  }

  Widget _buildResultCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.info, color: Colors.blue.shade700),
              const SizedBox(width: 8),
              Text(
                'Información ingresada:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            _displayText,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }

  void _showInformation() {
    setState(() {
      _displayText = '''Nombre: ${_nameController.text.isEmpty ? 'No especificado' : _nameController.text}
Email: ${_emailController.text.isEmpty ? 'No especificado' : _emailController.text}
Teléfono: ${_phoneController.text.isEmpty ? 'No especificado' : _phoneController.text}
Contraseña: ${_passwordController.text.isEmpty ? 'No especificado' : '*' * _passwordController.text.length}''';
    });
  }
}
