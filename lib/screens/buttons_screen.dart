import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/screen_header.dart';

class ButtonsScreen extends StatefulWidget {
  const ButtonsScreen({Key? key}) : super(key: key);

  @override
  State<ButtonsScreen> createState() => _ButtonsScreenState();
}

class _ButtonsScreenState extends State<ButtonsScreen> {
  String _message = 'Presiona algún botón para ver el resultado';
  int _counter = 0;
  bool _isLoading = false;

  void _updateMessage(String message) {
    setState(() {
      _message = message;
    });
  }

  void _simulateLoading() async {
    setState(() {
      _isLoading = true;
      _message = 'Cargando...';
    });
    // Simula una operación de red de 2 segundos
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _isLoading = false;
      _message = '¡Carga completa!';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Botones ',
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ScreenHeader(
              title: 'Botones',
              description: 'Los botones son elementos interactivos que responden a toques del usuario. '
                  'Teniendo los ElevatedButton, TextButton e IconButton.',
              icon: Icons.smart_button,
              color: Colors.green,
            ),
            const SizedBox(height: 24),

            _buildMessageCard(),
            const SizedBox(height: 24),

            _buildButtonSection('ElevatedButton', [
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _updateMessage('¡ElevatedButton presionado!'),
                  child: const Text('ElevatedButton Normal'),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _isLoading ? null : _simulateLoading,
                  icon: _isLoading
                      ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                      : const Icon(Icons.cloud_upload),
                  label: Text(_isLoading ? 'Cargando...' : 'Con Ícono'),
                ),
              ),
            ]),

            _buildButtonSection('TextButton', [
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => _updateMessage('¡TextButton presionado!'),
                  child: const Text('TextButton'),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: TextButton.icon(
                  onPressed: () => _updateMessage('¡TextButton con ícono presionado!'),
                  icon: const Icon(Icons.favorite),
                  label: const Text('Con Ícono'),
                ),
              ),
            ]),

            _buildButtonSection('OutlinedButton', [
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => _updateMessage('¡OutlinedButton presionado!'),
                  child: const Text('OutlinedButton'),
                ),
              ),
            ]),

            _buildButtonSection('IconButton', [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildIconButtonWithLabel(
                    icon: Icons.add,
                    label: 'Incrementar',
                    onPressed: () {
                      setState(() {
                        _counter++;
                        _message = 'Contador: $_counter';
                      });
                    },
                  ),
                  _buildIconButtonWithLabel(
                    icon: Icons.remove,
                    label: 'Decrementar',
                    onPressed: () {
                      setState(() {
                        _counter--;
                        _message = 'Contador: $_counter';
                      });
                    },
                  ),
                  _buildIconButtonWithLabel(
                    icon: Icons.refresh,
                    label: 'Reiniciar',
                    onPressed: () {
                      setState(() {
                        _counter = 0;
                        _message = 'Contador reiniciado';
                      });
                    },
                  ),
                ],
              ),
            ]),

            _buildButtonSection('FloatingActionButton', [
              Center(
                child: FloatingActionButton.extended(
                  onPressed: () => _updateMessage('¡FloatingActionButton presionado!'),
                  icon: const Icon(Icons.add),
                  label: const Text('FAB Extendido'),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }

  // Métodos agregados para solucionar los errores
  Widget _buildMessageCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.green.shade200),
      ),
      child: Column(
        children: [
          Icon(Icons.message, color: Colors.green.shade700, size: 32),
          const SizedBox(height: 8),
          Text(
            _message,
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildButtonSection(String title, List<Widget> buttons) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 8),
        ...buttons,
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildIconButtonWithLabel({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon),
          onPressed: onPressed,
        ),
        const SizedBox(height: 4),
        Text(label),
      ],
    );
  }
}