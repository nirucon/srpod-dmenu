# srpod-dmenu

`srpod-dmenu` is a script for searching and playing podcasts from Sveriges Radio using `dmenu` and `mpv`. It provides an intuitive interface for finding and listening to podcasts, with the added capability to control the playback and optionally switch to live radio streaming.

Note: I have only tested it on Arch Linux so far.

## Features

- Search for podcast episodes by keyword.
- Play selected podcast episodes in the background using `mpv`.
- Control the playback (stop streaming).
- Optionally switch to live radio streaming with `sverigesradio-dmenu`.

## Dependencies

To use `srpod-dmenu`, you'll need the following dependencies:

- **`jq`**: Command-line JSON processor.
- **`curl`**: Command-line tool for transferring data with URLs.
- **`mpv`**: Media player for playing audio and video.
- **`dmenu`**: Dynamic menu for X.
- **`notify-send`**: Sends desktop notifications.
- **`pkill`**: Utility to send signals to processes by name.

Optionally, you can also install `sverigesradio-dmenu` for live radio streaming functionality:

- **`sverigesradio-dmenu`**: [GitHub Repository](https://github.com/nirucon/sverigesradio-dmenu)

## Installation

### For Debian-based Systems

1. **Ensure Dependencies are Installed**

   Make sure you have all required dependencies installed on your system. For Debian-based systems, you can install them using:

   ```bash
   sudo apt-get install jq curl mpv dmenu libnotify-bin
   ```

2. **Download the Script**

   Download the `srpod-dmenu` script:

   ```bash
   wget https://example.com/path/to/srpod-dmenu -O srpod-dmenu
   ```

   Replace `https://example.com/path/to/srpod-dmenu` with the actual URL where the script is hosted.

3. **Make the Script Executable**

   Change the permissions of the script to make it executable:

   ```bash
   chmod +x srpod-dmenu
   ```

### For Arch Linux

1. **Ensure Dependencies are Installed**

   You can install the required dependencies on Arch Linux using the package manager `pacman`:

   ```bash
   sudo pacman -S jq curl mpv dmenu libnotify
   ```

2. **Download the Script**

   Download the `srpod-dmenu` script:

   ```bash
   wget https://example.com/path/to/srpod-dmenu -O srpod-dmenu
   ```

   Replace `https://example.com/path/to/srpod-dmenu` with the actual URL where the script is hosted.

3. **Make the Script Executable**

   Change the permissions of the script to make it executable:

   ```bash
   chmod +x srpod-dmenu
   ```

## Usage

1. **Run the Script**

   To start the script, simply run:

   ```bash
   ./srpod-dmenu
   ```

2. **Navigating the Menu**

   - **Search**: Type your search term to find podcast episodes. You can view details and select an episode to play.
   - **Turn off current pod**: Stop the currently playing podcast if `mpv` is active.
   - **SR Live radio**: Exit the current script and run `sverigesradio-dmenu` if it is installed. Shows an error notification if `sverigesradio-dmenu` is not found.
   - **Exit**: Exit the script. If `mpv` is playing a podcast, it will be stopped before exiting.

3. **Handling Notifications**

   The script uses `notify-send` to display notifications when a podcast starts playing.

## Optional Live Radio Streaming

To enable the live radio streaming feature, you need to have the `sverigesradio-dmenu` script installed. This script is available at [https://github.com/nirucon/sverigesradio-dmenu](https://github.com/nirucon/sverigesradio-dmenu). If installed, the "SR Live radio" option in the menu will allow you to switch to live radio streaming.

## Troubleshooting

- **"sverigesradio-dmenu script not installed!"**: This error indicates that the `sverigesradio-dmenu` script is not found on your system. Make sure it is correctly installed and available in your PATH.

- **"No valid URL found for episode ID"**: This error occurs if the podcast episode's URL cannot be retrieved. Ensure that the episode ID is correct and try again.

## License

Do what you want!
