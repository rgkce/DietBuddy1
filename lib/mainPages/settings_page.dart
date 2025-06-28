import 'package:flutter/material.dart';
import 'package:dietbuddy/constants/styles.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final TextEditingController _controller = TextEditingController();
  String? _currentUrl;
  bool _saved = false;

  @override
  void initState() {
    super.initState();
    _loadCurrentUrl();
  }

  Future<void> _loadCurrentUrl() async {
    final url = await AppConfig.getOllamaUrl();
    setState(() {
      _currentUrl = url;
      _controller.text = url;
    });
  }

  Future<void> _saveUrl() async {
    await AppConfig.setOllamaUrl(_controller.text.trim());
    setState(() {
      _saved = true;
      _currentUrl = _controller.text.trim();
    });
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _saved = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ayarlar')), 
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Ollama Sunucu Adresi:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'http://192.168.x.x:11434 veya https://alanadiniz.com',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _saveUrl,
              child: const Text('Kaydet'),
            ),
            if (_saved)
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text('Kaydedildi!', style: TextStyle(color: Colors.green)),
              ),
            const SizedBox(height: 24),
            const Text('Mevcut Adres:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(_currentUrl ?? '', style: const TextStyle(color: Colors.blueGrey)),
          ],
        ),
      ),
    );
  }
} 