import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/screen_header.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> with TickerProviderStateMixin {
  double _progressValue = 0.3;
  late AnimationController _animationController;
  late AnimationController _pulseController;
  late Animation<double> _animation;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    _pulseController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _animationController.repeat();
    _pulseController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Elementos de informacion',
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ScreenHeader(
              title: 'Elementos de informacion',
              description: 'Los widgets informativos muestran contenido al usuario como texto, imágenes y progreso. '
                  'Son fundamentales para comunicar información y estados en la aplicación.',
              icon: Icons.info,
              color: Colors.teal,
            ),
            const SizedBox(height: 24),

            _buildTextWidgetsSection(),
            const SizedBox(height: 16),

            _buildImageSection(),
            const SizedBox(height: 16),

            _buildProgressSection(),
            const SizedBox(height: 16),

            _buildRichTextSection(),
            const SizedBox(height: 16),

            _buildChipsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextWidgetsSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Text Widgets:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 12),
            _buildTextExample('Texto normal', TextStyle(fontSize: 16)),
            _buildTextExample('Texto en negrita', TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            _buildTextExample('Texto en cursiva', TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
            _buildTextExample('Texto de color', TextStyle(fontSize: 16, color: Colors.teal.shade600)),
            _buildTextExample('Texto subrayado', TextStyle(fontSize: 16, decoration: TextDecoration.underline)),
            _buildTextExample('Texto con sombra', TextStyle(
              fontSize: 16,
              shadows: [Shadow(color: Colors.grey.shade400, offset: Offset(1, 1), blurRadius: 2)],
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildTextExample(String text, TextStyle style) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(text, style: style),
    );
  }

  Widget _buildImageSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Images y Avatars:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 12),

            const Text('Íconos decorativos:', style: TextStyle(fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildIconContainer(Icons.favorite, Colors.red, 'Favorito'),
                _buildIconContainer(Icons.star, Colors.amber, 'Estrella'),
                _buildIconContainer(Icons.thumb_up, Colors.green, 'Like'),
                _buildIconContainer(Icons.share, Colors.blue, 'Compartir'),
              ],
            ),

            const SizedBox(height: 16),
            const Text('Avatares de usuario:', style: TextStyle(fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            Row(
              children: [
                _buildAnimatedAvatar(),
                const SizedBox(width: 16),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Usuario Demo', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      Text('usuario@demo.com', style: TextStyle(color: Colors.grey)),
                      Text('En línea ahora', style: TextStyle(color: Colors.green, fontSize: 12)),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconContainer(IconData icon, Color color, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, size: 32, color: color),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildAnimatedAvatar() {
    return AnimatedBuilder(
      animation: _pulseAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _pulseAnimation.value,
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.teal.shade100,
            child: const Icon(Icons.person, size: 40),
          ),
        );
      },
    );
  }

  Widget _buildProgressSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Progress Indicators:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 16),

            const Text('LinearProgressIndicator:', style: TextStyle(fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: _progressValue,
              backgroundColor: Colors.grey.shade300,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.teal.shade600),
            ),
            const SizedBox(height: 8),
            Text('Progreso: ${(_progressValue * 100).toInt()}%'),
            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        _progressValue = (_progressValue + 0.1).clamp(0.0, 1.0);
                      });
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Aumentar'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        _progressValue = (_progressValue - 0.1).clamp(0.0, 1.0);
                      });
                    },
                    icon: const Icon(Icons.remove),
                    label: const Text('Disminuir'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            const Text('CircularProgressIndicator:', style: TextStyle(fontWeight: FontWeight.w500)),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 80,
                      height: 80,
                      child: Stack(
                        children: [
                          CircularProgressIndicator(
                            value: _progressValue,
                            strokeWidth: 6,
                            backgroundColor: Colors.grey.shade300,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.teal.shade600),
                          ),
                          Center(
                            child: Text(
                              '${(_progressValue * 100).toInt()}%',
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text('Con valor', style: TextStyle(fontSize: 12)),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 80,
                      height: 80,
                      child: AnimatedBuilder(
                        animation: _animation,
                        builder: (context, child) {
                          return CircularProgressIndicator(
                            value: _animation.value,
                            strokeWidth: 4,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.orange.shade600),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text('Animado', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRichTextSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('RichText y contenido estilizado:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 12),

            RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: const [
                  TextSpan(text: 'Este es un texto '),
                  TextSpan(
                    text: 'mezclado',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
                  ),
                  TextSpan(text: ' con diferentes '),
                  TextSpan(
                    text: 'estilos',
                    style: TextStyle(fontStyle: FontStyle.italic, color: Colors.red),
                  ),
                  TextSpan(text: ' y '),
                  TextSpan(
                    text: 'colores',
                    style: TextStyle(decoration: TextDecoration.underline, color: Colors.purple),
                  ),
                  TextSpan(text: ' en una sola línea.'),
                ],
              ),
            ),

            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.teal.shade100, Colors.teal.shade50],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.teal.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Icon(Icons.lightbulb, size: 48, color: Colors.teal.shade700),
                  const SizedBox(height: 12),
                  Text(
                    'Información Destacada',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal.shade700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Este es un ejemplo de cómo combinar diferentes widgets '
                        'para crear interfaces atractivas e informativas con gradientes, sombras y animaciones.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.teal.shade600),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChipsSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Chips y etiquetas:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 12),

            const Text('Tecnologías:', style: TextStyle(fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildTechChip('Flutter', Icons.phone_android, Colors.blue),
                _buildTechChip('Dart', Icons.code, Colors.green),
                _buildTechChip('Firebase', Icons.cloud, Colors.orange),
                _buildTechChip('Material Design', Icons.design_services, Colors.purple),
              ],
            ),

            const SizedBox(height: 16),
            const Text('Acciones:', style: TextStyle(fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ActionChip(
                  label: const Text('Editar'),
                  avatar: const Icon(Icons.edit, size: 18),
                  onPressed: () => _showSnackBar('Función de editar'),
                  backgroundColor: Colors.blue.shade100,
                ),
                ActionChip(
                  label: const Text('Eliminar'),
                  avatar: const Icon(Icons.delete, size: 18),
                  onPressed: () => _showSnackBar('Función de eliminar'),
                  backgroundColor: Colors.red.shade100,
                ),
                ActionChip(
                  label: const Text('Compartir'),
                  avatar: const Icon(Icons.share, size: 18),
                  onPressed: () => _showSnackBar('Función de compartir'),
                  backgroundColor: Colors.green.shade100,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTechChip(String label, IconData icon, Color color) {
    return Chip(
      label: Text(label),
      avatar: Icon(icon, size: 18, color: color),
      backgroundColor: color.withOpacity(0.1),
      side: BorderSide(color: color.withOpacity(0.3)),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}