# SleepDeeper

A macOS utility script that automatically disables Bluetooth and Wi-Fi when your system goes to sleep and re-enables them upon waking up. This helps conserve energy and ensures privacy during idle periods.

## Features
- Automatically turns off **Bluetooth** and **Wi-Fi** when the system enters sleep mode.
- Automatically restores **Bluetooth** and **Wi-Fi** functionality when the system wakes up.
- Simple installation process with options for both Homebrew users and those who prefer a Homebrew-free setup.
- Easy uninstallation.

## Installation

### Option 1: Using Homebrew (Recommended for Most Users)
Homebrew simplifies package management on macOS, making the installation process safer and more reliable.

1. **Clone this repository**:
   ```bash
   git clone https://github.com/HaaaaE/SleepDeeper.git
   cd SleepDeeper
   ```

2. **Install Homebrew** (if you haven't already):
   Follow the instructions at [Homebrew's official site](https://brew.sh/) or run:
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

3. **Run the installation script**:
   ```bash
   ./install.sh
   ```
   Follow the prompts to complete the installation.

### Option 2: Install Without Homebrew (Faster Setup)
If you prefer not to use Homebrew, you can install the script directly.

1. **Clone this repository**:
   ```bash
   git clone https://github.com/dreamncn/SleepDeeper.git
   cd SleepDeeper
   ```

2. **Run the Homebrew-free installation script**:
   ```bash
   ./install-without-brew.sh
   ```
   Follow the prompts to complete the installation.

## Uninstallation
To remove the script and revert any changes made during installation:

1. Navigate to the cloned repository directory:
   ```bash
   cd SleepDeeper
   ```

2. Run the uninstallation script:
   ```bash
   ./uninstall.sh
   ```
   Follow the prompts to complete the uninstallation.

## License
This project is licensed under the GPL License. See the [LICENSE](LICENSE) file for details.

## Copyright Notice

This project is based on [SleepWithoutBluetoothAndWifi](https://github.com/dreamncn/SleepWithoutBluetoothAndWifi), which is licensed under the GNU General Public License v3.0.
