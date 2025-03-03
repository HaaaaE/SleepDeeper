# SleepDeeper

A macOS utility script that automatically disables **Bluetooth** and **Wi-Fi** when your system goes to sleep and re-enables them upon waking up.  
一个 macOS 实用脚本，当系统进入睡眠模式时自动禁用 **蓝牙** 和 **Wi-Fi**，并在唤醒时重新启用它们。  
This helps conserve energy and ensures privacy during idle periods.  
这有助于节省能源，并在空闲期间确保隐私。


## Features / 功能
- Automatically turns off **Bluetooth** and **Wi-Fi** when the system enters sleep mode.  
  当系统进入睡眠模式时，自动关闭 **蓝牙** 和 **Wi-Fi**。
- Automatically restores **Bluetooth** and **Wi-Fi** functionality when the system wakes up.  
  当系统唤醒时，自动恢复 **蓝牙** 和 **Wi-Fi** 功能。
- Simple installation process with options for both Homebrew users and those who prefer a Homebrew-free setup.  
  提供简单的安装过程，支持使用 Homebrew 的用户以及不使用 Homebrew 的用户。
- Easy uninstallation. / 简单的卸载过程。


## Installation / 安装

### Option 1: Using Homebrew (Recommended for Most Users) / 选项 1：使用 Homebrew（推荐给大多数用户）
Homebrew simplifies package management on macOS, making the installation process safer and more reliable.  
Homebrew 简化了 macOS 上的包管理，使安装过程更安全、更可靠。

1. **Clone this repository**:  
   克隆此仓库：
   ```bash
   git clone https://github.com/HaaaaE/SleepDeeper.git
   cd SleepDeeper
   ```

2. **Install Homebrew** (if you haven't already):  
   安装 Homebrew（如果尚未安装）：  
   Follow the instructions at [Homebrew's official site](https://brew.sh/) or run:  
   按照 [Homebrew 官方网站](https://brew.sh/) 的说明操作，或者运行以下命令：
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

3. **Run the installation script**:  
   运行安装脚本：
   ```bash
   ./install.sh
   ```
   Follow the prompts to complete the installation.  
   按照提示完成安装。


### Option 2: Install Without Homebrew (Faster Setup) / 选项 2：不使用 Homebrew 安装（更快的设置）
If you prefer not to use Homebrew, you can install the script directly.  
如果你不想使用 Homebrew，可以直接安装脚本。

1. **Clone this repository**:  
   克隆此仓库：
   ```bash
   git clone https://github.com/dreamncn/SleepDeeper.git
   cd SleepDeeper
   ```

2. **Run the Homebrew-free installation script**:  
   运行不依赖 Homebrew 的安装脚本：
   ```bash
   ./install-without-brew.sh
   ```
   Follow the prompts to complete the installation.  
   按照提示完成安装。


## Uninstallation / 卸载
To remove the script and revert any changes made during installation:  
要删除脚本并撤销安装过程中所做的更改：

1. Navigate to the cloned repository directory:  
   导航到克隆的仓库目录：
   ```bash
   cd SleepDeeper
   ```

2. Run the uninstallation script:  
   运行卸载脚本：
   ```bash
   ./uninstall.sh
   ```
   Follow the prompts to complete the uninstallation.  
   按照提示完成卸载。


## License / 许可证
This project is licensed under the GPL License. See the [LICENSE](LICENSE) file for details.  
本项目基于 GPL 许可证发布。详情请参阅 [LICENSE](LICENSE) 文件。


## Copyright Notice / 版权声明
This project is based on [SleepWithoutBluetoothAndWifi](https://github.com/dreamncn/SleepWithoutBluetoothAndWifi), which is licensed under the GNU General Public License v3.0.  
本项目基于 [SleepWithoutBluetoothAndWifi](https://github.com/dreamncn/SleepWithoutBluetoothAndWifi)，该仓库基于 GNU 通用公共许可证 v3.0 发布。
