<div align="center">
  <img src="assets/icon.png" width="112" height="112" alt="olcOS" />
  <h1>olcOS</h1>
  <p><b>Your phone. Your server. Your connection.</b></p>
  <p>English · <a href="README.md">Русский</a></p>
  <p>
    <a href="https://github.com/olcOS/olcos-ios/actions/workflows/build.yml"><img src="assets/button-ios.svg" height="48" alt="Download for iPhone and iPad" /></a>
    &nbsp;
    <a href="https://github.com/olcOS/olcos-android/actions/workflows/build.yml"><img src="assets/button-android.svg" height="48" alt="Download for Android" /></a>
  </p>
  <p><sub>Beta. CI makes the builds: open the latest green run, "Artifacts".</sub></p>
</div>

<p align="center">
  <img src="assets/screen-whole-server.png" width="230" alt="Whole server" />
  <img src="assets/screen-speed.png" width="230" alt="Speed per protocol" />
  <img src="assets/screen-settings.png" width="230" alt="Settings" />
</p>

**olcOS** sends your phone's traffic through a server of your own. Between the phone and the server sits an ordinary
video-call room: Jitsi, SaluteJazz, VK Calls, MTS Link or Yandex Telemost. The service sees a normal WebRTC call; you
get a VPN or a local SOCKS5 proxy. A direct option exists too: VLESS + REALITY.

## What it does

- **Your own server, no fuss.** One command on a fresh VPS, and a QR code for the app appears.
- **Every protocol at once.** "Whole server" bonds several rooms into one channel. When one drops, the others carry on.
- **It does not give up.** A dead connection is noticed quickly and rejoined until you stop it. It stops only on errors a
  retry cannot cure: a wrong key, a room that was deleted.
- **Manage the server from the phone.** Rooms, keys, the core update and invites for family are set in the app.
- **VPN or proxy.** A VPN for the whole phone, or SOCKS5 for one app.
- **Languages and themes.** Russian and English, light and dark.

## Install the server

```bash
curl -fsSL https://raw.githubusercontent.com/olcOS/olcos/main/install.sh | sudo bash
```

Works on Debian, Ubuntu, Fedora and CentOS with root access. At the end the script prints a QR code: scan it with the
app and the phone becomes the server's owner.

<details>
<summary><b>Install the app</b></summary>

**iPhone and iPad (iOS 17+).** The build is unsigned; install it with Sideloadly, AltStore or SideStore. With a free
Apple ID the system will not let the app run a VPN, so only SOCKS5 mode is left. A full VPN needs a paid developer
account.

**Android (8.0+).** Download the `.apk`, allow installs from this source and open the file. For VPN the system asks
for permission once.

Both builds are under "Artifacts" of the latest green run in
[olcos-ios](https://github.com/olcOS/olcos-ios) and [olcos-android](https://github.com/olcOS/olcos-android).
Any GitHub user can download an artifact after signing in.
</details>

<details>
<summary><b>Speed and honest limits</b></summary>

Speed depends on the video room, not on your server. On the core's test bench: MTS Link about 15 Mbit/s, Jitsi about 5,
SaluteJazz 2–3. VK Calls has not been measured yet. Yours will differ with the network, the time of day and the
service's load.

- A call service can close a room, set a limit or turn guests away. That is why the app keeps several protocols and can
  change rooms.
- A large download goes over all rooms at once; small requests go over the one best room.
- This is a beta: the interface and compatibility change.
- The app is not meant for breaking the law. Use it on your own servers and within the rules of the services whose
  rooms you occupy.
</details>

<details>
<summary><b>What it is made of</b></summary>

Clients: SwiftUI (iOS) and Jetpack Compose (Android). The Go core is shared: a tunnel over WebRTC and the client that
bonds rooms into one channel. The sources CI builds the apps from are in
[olcos-ios](https://github.com/olcOS/olcos-ios) and [olcos-android](https://github.com/olcOS/olcos-android).
</details>
