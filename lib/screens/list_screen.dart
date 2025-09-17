import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/screen_header.dart';
import '../models/user_model.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final List<String> _simpleItems = List.generate(10, (index) => 'Item ${index + 1}');
  final List<UserModel> _users = [
    UserModel(name: 'Ana García', email: 'ana@email.com', avatar: Icons.person, status: 'Activo', phone: '+52 555 0101'),
    UserModel(name: 'Carlos López', email: 'carlos@email.com', avatar: Icons.person_outline, status: 'Inactivo', phone: '+52 555 0102'),
    UserModel(name: 'María Rodríguez', email: 'maria@email.com', avatar: Icons.person_2, status: 'Activo', phone: '+52 555 0103'),
    UserModel(name: 'Juan Pérez', email: 'juan@email.com', avatar: Icons.person_3, status: 'Ocupado', phone: '+52 555 0104'),
    UserModel(name: 'Laura Sánchez', email: 'laura@email.com', avatar: Icons.person_4, status: 'Activo', phone: '+52 555 0105'),
    UserModel(name: 'Roberto Silva', email: 'roberto@email.com', avatar: Icons.person, status: 'Inactivo', phone: '+52 555 0106'),
  ];

  final List<Map<String, dynamic>> _categories = [
    {'title': 'Tecnología', 'icon': Icons.computer, 'color': Colors.blue, 'count': 25},
    {'title': 'Deportes', 'icon': Icons.sports_soccer, 'color': Colors.green, 'count': 18},
    {'title': 'Música', 'icon': Icons.music_note, 'color': Colors.purple, 'count': 32},
    {'title': 'Viajes', 'icon': Icons.flight, 'color': Colors.orange, 'count': 15},
    {'title': 'Cocina', 'icon': Icons.restaurant, 'color': Colors.red, 'count': 22},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Listas',
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ScreenHeader(
              title: 'Listas',
              description: 'Las listas permiten mostrar elementos de manera eficiente y scrolleable. ',
              icon: Icons.list,
              color: Colors.purple,
            ),
            const SizedBox(height: 24),

            _buildSimpleListSection(),
            const SizedBox(height: 24),

            _buildUserListSection(),
            const SizedBox(height: 24),

            _buildCategoryListSection(),
            const SizedBox(height: 24),

            _buildSeparatedListSection(),
          ],
        ),
      ),
    );
  }

  // --- MÉTODOS DE CONSTRUCCIÓN DE WIDGETS ---

  Widget _buildSimpleListSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('ListView Simple:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        const SizedBox(height: 8),
        Container(
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: _simpleItems.map((item) => Card(
              margin: const EdgeInsets.symmetric(vertical: 2),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.purple.shade100,
                  child: Text(
                    item.split(' ')[1],
                    style: TextStyle(color: Colors.purple.shade700),
                  ),
                ),
                title: Text(item),
                subtitle: Text('Descripción del $item'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () => _showSnackBar('Tocaste $item'),
              ),
            )).toList(),
          ),
        ),
      ],
    );
  } // <-- Aquí faltaba la llave de cierre.

  Widget _buildUserListSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('ListView.builder (Usuarios):', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        const Text('Lista optimizada con muchas opciones interactivas'),
        const SizedBox(height: 8),
        Container(
          height: 300,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListView.builder(
            itemCount: _users.length,
            itemBuilder: (context, index) {
              final user = _users[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: _getStatusColor(user.status).withOpacity(0.2),
                    child: Icon(user.avatar, color: _getStatusColor(user.status)),
                  ),
                  title: Text(user.name),
                  subtitle: Text(user.email),
                  trailing: PopupMenuButton(
                    itemBuilder: (context) => [
                      const PopupMenuItem(value: 'call', child: Text('Llamar')),
                      const PopupMenuItem(value: 'message', child: Text('Mensaje')),
                      const PopupMenuItem(value: 'email', child: Text('Email')),
                    ],
                    onSelected: (value) => _showSnackBar('$value - ${user.name}'),
                  ),
                  onTap: () => _showUserDialog(user),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryListSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('ListView Horizontal:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        const Text('Categorías con scroll horizontal'),
        const SizedBox(height: 8),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _categories.length,
            itemBuilder: (context, index) {
              final category = _categories[index];
              return Container(
                width: 100,
                margin: const EdgeInsets.only(right: 8),
                child: Card(
                  child: InkWell(
                    onTap: () => _showSnackBar('Categoría: ${category['title']}'),
                    borderRadius: BorderRadius.circular(8),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(category['icon'], size: 32, color: category['color']),
                          const SizedBox(height: 8),
                          Text(category['title'], style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                          Text('${category['count']} items', style: TextStyle(fontSize: 10, color: Colors.grey.shade600)),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSeparatedListSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('ListView.separated:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        const Text('Lista con separadores personalizados'),
        const SizedBox(height: 8),
        Container(
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListView.separated(
            itemCount: 8,
            separatorBuilder: (context, index) => Divider(color: Colors.purple.shade200, thickness: 1, indent: 16, endIndent: 16),
            itemBuilder: (context, index) => ListTile(
              leading: const Icon(Icons.star, color: Colors.amber),
              title: Text('Elemento ${index + 1}'),
              subtitle: Text('Subtítulo del elemento ${index + 1}'),
              trailing: Chip(label: Text('#${index + 1}'), backgroundColor: Colors.purple.shade100),
              onTap: () => _showSnackBar('Elemento ${index + 1} seleccionado'),
            ),
          ),
        ),
      ],
    );
  }

  // --- MÉTODOS DE LÓGICA Y UTILIDADES ---

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Activo':
        return Colors.green;
      case 'Inactivo':
        return Colors.grey;
      case 'Ocupado':
        return Colors.orange;
      default:
        return Colors.blue;
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        action: SnackBarAction(label: 'OK', onPressed: () {}),
      ),
    );
  }

  void _showUserDialog(UserModel user) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(user.name),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.email, size: 16),
                const SizedBox(width: 8),
                Text(user.email),
              ],
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cerrar'),
          ),
        ],
      ),
    );
  }
}