import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/screen_header.dart';

class SelectionScreen extends StatefulWidget {
  const SelectionScreen({Key? key}) : super(key: key);

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  bool _checkboxValue = false;
  String _radioValue = 'azul';
  bool _switchValue = false;
  bool _notificationsEnabled = true;
  bool _darkMode = false;

  final List<String> _selectedHobbies = [];
  final Map<String, bool> _permissions = {
    'Cámara': false,
    'Micrófono': false,
    'Ubicación': false,
    'Contactos': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Elementos de Seleccion',
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ScreenHeader(
              title: 'Elementos de Seleccion ',
              description: 'Los widgets de selección permiten a los usuarios elegir opciones. '
                  'Incluyen Checkbox para múltiples selecciones, Radio para una sola opción y Switch para estados.',
              icon: Icons.check_circle,
              color: Colors.orange,
            ),
            const SizedBox(height: 24),

            _buildCheckboxSection(),
            const SizedBox(height: 16),

            _buildRadioSection(),
            const SizedBox(height: 16),

            _buildSwitchSection(),
            const SizedBox(height: 16),

            _buildMultipleSelectionSection(),
            const SizedBox(height: 16),

            _buildPermissionsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckboxSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Checkbox:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 8),
            CheckboxListTile(
              title: const Text('Acepto los términos y condiciones'),
              subtitle: const Text('Obligatorio para continuar'),
              value: _checkboxValue,
              onChanged: (value) {
                setState(() {
                  _checkboxValue = value!;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),
            if (_checkboxValue)
              Container(
                margin: const EdgeInsets.only(top: 8),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.check_circle, color: Colors.green),
                    SizedBox(width: 8),
                    Text('✓ Términos aceptados', style: TextStyle(color: Colors.green)),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildRadioSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Radio Buttons:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 8),
            const Text('Selecciona tu color favorito:'),
            ...['azul', 'rojo', 'verde', 'morado'].map((color) => RadioListTile<String>(
              title: Text(color.substring(0, 1).toUpperCase() + color.substring(1)),
              value: color,
              groupValue: _radioValue,
              onChanged: (value) {
                setState(() {
                  _radioValue = value!;
                });
              },
              secondary: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: _getColorFromString(color),
                  shape: BoxShape.circle,
                ),
              ),
            )),
            Container(
              margin: const EdgeInsets.only(top: 8),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: _getColorFromString(_radioValue).withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: _getColorFromString(_radioValue),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text('Color seleccionado: ${_radioValue.toUpperCase()}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSwitchSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Switch:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 8),
            SwitchListTile(
              title: const Text('Notificaciones Push'),
              subtitle: Text(_notificationsEnabled ? 'Recibirás notificaciones' : 'No recibirás notificaciones'),
              value: _notificationsEnabled,
              onChanged: (value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
              secondary: const Icon(Icons.notifications),
            ),
            SwitchListTile(
              title: const Text('Modo Oscuro'),
              subtitle: Text(_darkMode ? 'Tema oscuro activado' : 'Tema claro activado'),
              value: _darkMode,
              onChanged: (value) {
                setState(() {
                  _darkMode = value;
                });
              },
              secondary: Icon(_darkMode ? Icons.dark_mode : Icons.light_mode),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMultipleSelectionSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Selección múltiple:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 8),
            const Text('Selecciona tus hobbies favoritos:'),
            ...['Leer', 'Deportes', 'Música', 'Viajar', 'Cocinar', 'Gaming'].map((hobby) => CheckboxListTile(
              title: Text(hobby),
              value: _selectedHobbies.contains(hobby),
              onChanged: (value) {
                setState(() {
                  if (value!) {
                    _selectedHobbies.add(hobby);
                  } else {
                    _selectedHobbies.remove(hobby);
                  }
                });
              },
              secondary: Icon(_getHobbyIcon(hobby)),
            )),
            if (_selectedHobbies.isNotEmpty) ...[
              const Divider(),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.orange.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hobbies seleccionados (${_selectedHobbies.length}):',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(_selectedHobbies.join(', ')),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildPermissionsSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Permisos de la app:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 8),
            ..._permissions.entries.map((entry) => SwitchListTile(
              title: Text(entry.key),
              subtitle: Text(entry.value ? 'Permitido' : 'Denegado'),
              value: entry.value,
              onChanged: (value) {
                setState(() {
                  _permissions[entry.key] = value;
                });
              },
              secondary: Icon(_getPermissionIcon(entry.key)),
            )),
          ],
        ),
      ),
    );
  }

  Color _getColorFromString(String color) {
    switch (color) {
      case 'azul': return Colors.blue;
      case 'rojo': return Colors.red;
      case 'verde': return Colors.green;
      case 'morado': return Colors.purple;
      default: return Colors.grey;
    }
  }

  IconData _getHobbyIcon(String hobby) {
    switch (hobby) {
      case 'Leer': return Icons.book;
      case 'Deportes': return Icons.sports_soccer;
      case 'Música': return Icons.music_note;
      case 'Viajar': return Icons.airplanemode_active;
      case 'Cocinar': return Icons.restaurant;
      case 'Gaming': return Icons.sports_esports;
      default: return Icons.favorite;
    }
  }

  IconData _getPermissionIcon(String permission) {
    switch (permission) {
      case 'Cámara': return Icons.camera_alt;
      case 'Micrófono': return Icons.mic;
      case 'Ubicación': return Icons.location_on;
      case 'Contactos': return Icons.contacts;
      default: return Icons.security;
    }
  }
}