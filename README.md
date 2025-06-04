
# SIESTA 5.2.2 - Build & Installation Script

This repository provides a complete Bash script to automate the installation and compilation of **SIESTA 5.2.2** with support for MPI, SCALAPACK, NetCDF, LibXC, ELSI, and more on Debian/Ubuntu-based systems.
> 🇮🇷 [برای مشاهده نسخه فارسی کلیک کنید](./README.fa.md)
## 📦 Prerequisites

Make sure your system is up-to-date and you are using a Debian/Ubuntu-based Linux distribution.

## 📁 Contents

- `install_siesta.sh` – Bash script to:
  - Update your system
  - Install all required dependencies
  - Download and extract SIESTA source code
  - Configure build using CMake with necessary options
  - Build and install the program

---

## ⚙️ How to Use

### 1. Clone the Repository

```bash
git clone https://github.com/alikhorrami1998/Siesta-5.4.0.git
cd Siesta-5.4.0
```

### 2. Make Script Executable

```bash
chmod +x install_siesta.sh
```

### 3. Run the Installation

```bash
./install_siesta.sh
```

This will automatically:




- Install required packages  
- Download SIESTA 5.4.0
- Configure the build using MPI and other optional components  
- Compile with all available cores  
- Install SIESTA system-wide



📥 Download
To install WSL and the Ubuntu 24.04 LTS distribution, please download the required files from the Releases section of this repository.


📁 Files included in the Release:
wsl.2.5.6.0.x64.msi – Installer for installing or updating Windows Subsystem for Linux (WSL)

CanonicalGroupLimited.Ubuntu_2404.1.68.0_neutral_._79rhkp1fndgsc.AppxBundle – Installation package for Ubuntu 24.04 (manual installation on Windows)

