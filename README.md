<p align="center">
  <a href="https://olcos.github.io"><img src="assets/icon.png" width="96" height="96" alt="olcOS"></a>
</p>

<h1 align="center">olcOS</h1>

<p align="center">
  Свой VPN через видеозвонки. Приложения для iPhone, iPad и Android и установщик сервера.
</p>

<p align="center">
  <a href="https://github.com/olcOS/olcos/releases/latest"><img src="https://img.shields.io/github/v/release/olcOS/olcos?include_prereleases&label=%D1%80%D0%B5%D0%BB%D0%B8%D0%B7&color=3A57D9" alt="Последний релиз"></a>
  <img src="https://img.shields.io/badge/iOS-17%2B-3A57D9" alt="iOS 17+">
  <img src="https://img.shields.io/badge/Android-8%2B-3A57D9" alt="Android 8+">
  <a href="LICENSE"><img src="https://img.shields.io/badge/%D0%BB%D0%B8%D1%86%D0%B5%D0%BD%D0%B7%D0%B8%D1%8F-MIT-3A57D9" alt="Лицензия MIT"></a>
</p>

<p align="center">
  <a href="https://olcos.github.io">Сайт</a> ·
  <a href="https://github.com/olcOS/olcos/releases/latest">Скачать</a> ·
  <a href="https://github.com/olcOS/olcos-ios">iOS</a> ·
  <a href="https://github.com/olcOS/olcos-android">Android</a> ·
  <a href="README.en.md">English</a>
</p>

<p align="center">
  <img src="assets/screens.png" width="760" alt="olcOS на iPhone: главный экран, подключение «Весь сервер» и проверка скорости комнат">
</p>

olcOS ведёт трафик телефона через ваш собственный сервер. Между телефоном и сервером данные идут внутри обычного
видеозвонка: в Яндекс Телемосте, VK Звонках, SaluteJazz, Jitsi или МТС Link. Если звонок не нужен, к серверу можно
подключиться напрямую по VLESS + REALITY.

Общих серверов и аккаунтов нет. Сервер ставите вы, а управляете им с телефона.

## Скачать

Файлы лежат в [последнем релизе](https://github.com/olcOS/olcos/releases/latest), там же их контрольные суммы SHA-256.

| Платформа | Файл | Требования |
|---|---|---|
| iPhone и iPad | `.ipa` | iOS 17 или новее, установка через Sideloadly, AltStore или SideStore |
| Android | `.apk` | Android 8.0 или новее |

С бесплатным Apple ID iOS не разрешает сторонним приложениям включать VPN, поэтому на iPhone olcOS работает как
SOCKS5-прокси, например для Telegram. VPN на весь телефон доступен, если подписать приложение платным аккаунтом
разработчика Apple. На Android ограничения нет: при первом подключении система один раз спросит разрешение на VPN. Обновления
для Android можно получать автоматически через [Obtainium](https://apps.obtainium.imranr.dev/redirect?r=obtainium://app/%7B%22id%22%3A%22io.olcos.app%22%2C%22url%22%3A%22https%3A%2F%2Fgithub.com%2FolcOS%2Folcos%22%2C%22author%22%3A%22olcOS%22%2C%22name%22%3A%22olcOS%22%7D).

Приложение для iPhone переведено на русский, английский и французский, для Android на русский и английский.

## Сервер

Нужен VPS на Linux (Debian, Ubuntu, Fedora или CentOS) с root-доступом. Сервер можно поставить прямо из приложения
по SSH или одной командой на самом сервере:

```bash
curl -fsSL https://raw.githubusercontent.com/olcOS/olcos/main/install.sh | sudo bash
```

Скрипт поднимает комнату Jitsi и агент управления, а в конце показывает QR-код. Отсканируйте его в olcOS, и телефон
станет владельцем сервера. Остальные комнаты, протоколы, обновления и приглашения для других устройств
настраиваются уже в приложении.

## Как это работает

Телефон и сервер заходят в одну видеокомнату как два участника звонка и обмениваются данными через WebRTC. Комнат
может быть несколько, на разных сервисах. olcOS склеивает их в один канал: нагрузка делится между комнатами, а если
одна отвалится, соединение продолжит работать через остальные.

Скорость в основном зависит от сервиса звонков. На релизных замерах ядра olcrtc VK Звонки дали 13–19 Мбит/с,
МТС Link около 15 Мбит/с, SaluteJazz около 3 Мбит/с
([settings.ru.md](https://github.com/ghostlane-project/olcrtc/blob/0955ba7f2041d1480524292c4af4135a192fe267/docs/settings.ru.md),
[gate.ru.md](https://github.com/ghostlane-project/olcrtc/blob/0955ba7f2041d1480524292c4af4135a192fe267/docs/gate.ru.md)).
На вашей сети цифры будут другими.

Что стоит знать заранее:

- через VPN идёт TCP поверх IPv4, приложениям, которым нужен UDP или IPv6, туннель может не подойти;
- сервис звонков может закрыть комнату или ограничить гостей, поэтому лучше держать несколько протоколов;
- это бета, поведение и совместимость ещё меняются.

## Репозитории

- [olcos-ios](https://github.com/olcOS/olcos-ios): приложение для iPhone и iPad (SwiftUI) и общее ядро на Go.
- [olcos-android](https://github.com/olcOS/olcos-android): приложение для Android (Kotlin, Jetpack Compose).
- [olcos.github.io](https://github.com/olcOS/olcos.github.io): сайт.
- Этот репозиторий: релизы и установщик сервера.

## Ошибки и вопросы

Пишите в [Issues](https://github.com/olcOS/olcos/issues). Не публикуйте ссылки подключения, ключи и адреса своих
серверов. Об уязвимостях сообщайте приватно, как описано в
[SECURITY.md](https://github.com/olcOS/olcos-ios/blob/main/SECURITY.md).

Пользуйтесь olcOS в рамках закона своей страны и правил сервисов, через которые идёт трафик.

## Лицензия

Код olcOS распространяется под лицензией [MIT](LICENSE). Туннель построен на
[olcrtc](https://github.com/ghostlane-project/olcrtc) (Apache-2.0), прямой режим использует
[Xray-core](https://github.com/XTLS/Xray-core) (MPL-2.0).
