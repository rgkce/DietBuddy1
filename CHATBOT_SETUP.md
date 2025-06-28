# Chatbot Telefon Kurulum Rehberi

Bu rehber, DietBuddy uygulamasındaki chatbot'un telefonda çalışması için gerekli adımları açıklar.

## Gereksinimler

1. **Bilgisayarınızda Ollama kurulu olmalı**
2. **Telefon ve bilgisayar aynı WiFi ağında olmalı**
3. **Bilgisayarınızın IP adresini bilmelisiniz**

## Adım 1: Bilgisayarınızda Ollama'yı Başlatın

```bash
# Ollama'yı başlatın
ollama serve

# Gerekli modeli yükleyin (eğer yüklü değilse)
ollama pull phi3:mini
```

## Adım 2: Bilgisayarınızın IP Adresini Bulun

### Windows:
```cmd
ipconfig
```
IPv4 Address kısmındaki IP adresini not edin (genellikle 192.168.1.xxx formatında)

### macOS/Linux:
```bash
ifconfig
# veya
ip addr show
```

## Adım 3: Güvenlik Duvarı Ayarları

### Windows:
1. Windows Defender Güvenlik Duvarı'nı açın
2. "Gelişmiş ayarlar" > "Gelen Kurallar"
3. "Yeni Kural" > "Port" seçin
4. TCP ve 11434 portunu belirtin
5. "İzin Ver" seçin
6. Tüm profilleri seçin
7. İsim olarak "Ollama" yazın

### macOS:
```bash
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --add /usr/local/bin/ollama
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --unblock /usr/local/bin/ollama
```

## Adım 4: Uygulamayı Telefonda Çalıştırın

1. Uygulamayı telefonda açın
2. Chatbot sayfasına gidin
3. Sağ üstteki ayarlar butonuna (⚙️) tıklayın
4. Bilgisayarınızın IP adresini girin (örn: 192.168.1.100)
5. "Kaydet" butonuna tıklayın
6. Bağlantı test edilecek ve sonuç gösterilecek

## Sorun Giderme

### "Bağlantı hatası" alıyorsanız:

1. **IP adresini kontrol edin**: Bilgisayarınızın IP adresinin doğru olduğundan emin olun
2. **Ollama çalışıyor mu?**: Bilgisayarınızda `ollama serve` komutunun çalıştığından emin olun
3. **Aynı ağda mısınız?**: Telefon ve bilgisayarın aynı WiFi ağında olduğundan emin olun
4. **Güvenlik duvarı**: Güvenlik duvarının 11434 portunu engellemediğinden emin olun
5. **Model yüklü mü?**: `ollama list` komutu ile modelin yüklü olduğunu kontrol edin

### "Model bulunamadı" hatası alıyorsanız:

```bash
# Modeli yükleyin
ollama pull phi3:mini

# Veya mevcut modelleri listeleyin
ollama list
```

### Performans sorunları:

- Daha küçük bir model kullanın: `ollama pull tinyllama`
- Bilgisayarınızın RAM'ini kontrol edin (en az 4GB önerilir)
- Diğer uygulamaları kapatın

## Test

Bağlantı kurulduktan sonra chatbot'a basit bir soru sorun:
- "Merhaba"
- "Nasılsın?"
- "Bugün hava nasıl?"

Eğer yanıt alıyorsanız, kurulum başarılı demektir!

## Güvenlik Notları

- Ollama sunucusu sadece güvenilir ağlarda çalıştırılmalıdır
- Üretim ortamında HTTPS kullanılmalıdır
- Güvenlik duvarı ayarları dikkatli yapılmalıdır 