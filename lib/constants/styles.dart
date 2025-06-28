import 'package:dietbuddy/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

class AppStyles {
  static final TextStyle titleStyle = GoogleFonts.lora(
    color: AppColors.titleColor,
    fontSize: 20,
  );
  static final TextStyle pageTitle = GoogleFonts.lora(
    color: AppColors.titleColor,
    fontSize: 32,
  );
  static final TextStyle textStyle = GoogleFonts.lora(
    color: AppColors.textColor,
    fontSize: 15,
  );
  static final TextStyle text = GoogleFonts.lora(
    color: AppColors.textColor,
    fontSize: 18,
  );
  static final TextStyle subtitleStyle = GoogleFonts.lora(
    color: const Color.fromARGB(255, 44, 50, 70),
    fontSize: 15,
  );
  static final TextStyle subtitleButtonStyle = GoogleFonts.lora(
    color: const Color.fromARGB(255, 44, 50, 70),
    fontSize: 20,
  );
  static final TextStyle primaryStyle = GoogleFonts.lora(
    color: const Color(0xFFFFFEFE),
    fontSize: 20,
  );
}

/// API adreslerini merkezi olarak yöneten config sınıfı
class AppConfig {
  static const bool isProduction = bool.fromEnvironment('dart.vm.product');

  static const String ollamaUrlKey = 'ollama_url';
  static const String defaultOllamaUrl = 'http://10.0.2.2:11434';

  /// Kaydedilmiş Ollama adresini getirir, yoksa varsayılanı döner
  static Future<String> getOllamaUrl() async {
    final prefs = await SharedPreferences.getInstance();
    final savedUrl = prefs.getString(ollamaUrlKey);
    
    if (savedUrl != null && savedUrl.isNotEmpty) {
      return savedUrl;
    }
    
    // Eğer kaydedilmiş URL yoksa, cihaz tipine göre varsayılan URL döndür
    return getDefaultOllamaUrl();
  }

  /// Cihaz tipine göre varsayılan Ollama URL'sini döndürür
  static String getDefaultOllamaUrl() {
    // Emülatör için
    if (Platform.isAndroid) {
      // Android emülatör kontrolü
      try {
        // Eğer emülatörde çalışıyorsa 10.0.2.2 kullan
        return 'http://10.0.2.2:11434';
      } catch (e) {
        // Gerçek cihazda çalışıyorsa, bilgisayarın IP adresini kullan
        return 'http://192.168.1.100:11434'; // Bu IP'yi bilgisayarınızın IP'si ile değiştirin
      }
    } else if (Platform.isIOS) {
      // iOS simülatör için
      return 'http://localhost:11434';
    }
    
    return 'http://10.0.2.2:11434';
  }

  /// Ollama adresini kaydeder
  static Future<void> setOllamaUrl(String url) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(ollamaUrlKey, url);
  }

  /// Bilgisayarın IP adresini otomatik tespit etmek için (opsiyonel)
  static Future<String?> detectComputerIP() async {
    try {
      // Bu fonksiyon bilgisayarınızın IP adresini tespit etmek için kullanılabilir
      // Şimdilik manuel olarak ayarlanması gerekiyor
      return null;
    } catch (e) {
      return null;
    }
  }

  // Geliştirici ortamı için (emülatör veya lokal sunucu)
  static const String ollamaDevUrl = 'http://10.0.2.2:11434';
  // Prod ortamı için (bulut sunucuya deploy edildiğinde burası değiştirilmeli)
  static const String ollamaProdUrl = 'https://your-cloud-ollama-server.com';

  static String get ollamaBaseUrl => isProduction ? ollamaProdUrl : ollamaDevUrl;
}