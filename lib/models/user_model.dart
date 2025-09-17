import 'package:flutter/material.dart';

class UserModel {
  final String name;
  final String email;
  final String phone;
  final String status;
  final IconData avatar;

  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.status,
    required this.avatar,
  });
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  String _message = 'Initial message.';
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateful Widget Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_isLoading)
              const CircularProgressIndicator()
            else
              Text(
                _message,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildIconButtonWithLabel(
                  icon: Icons.refresh,
                  label: 'Reload',
                  onPressed: _simulateLoading,
                ),
                _buildIconButtonWithLabel(
                  icon: Icons.edit,
                  label: 'Update',
                  onPressed: () => _updateMessage('Message updated!'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Method to build an icon button with a label.
  Widget _buildIconButtonWithLabel({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(icon),
          iconSize: 32,
          style: IconButton.styleFrom(
            backgroundColor: Colors.green.shade100,
            foregroundColor: Colors.green.shade700,
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  // Method to update the message and trigger a rebuild.
  void _updateMessage(String newMessage) {
    setState(() {
      _message = newMessage;
    });
  }

  // Method to simulate an asynchronous loading process.
  Future<void> _simulateLoading() async {
    setState(() {
      _isLoading = true;
      _message = 'Loading...';
    });

    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isLoading = false;
      _message = '¡Carga completada!';
    });
  }
}