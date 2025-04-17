# SIESTA 5.2.2 - Build & Installation Script

This repository provides a complete Bash script to automate the installation and compilation of **SIESTA 5.2.2** with support for MPI, SCALAPACK, NetCDF, LibXC, ELSI, and more on Debian/Ubuntu-based systems.

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
git clone https://github.com/alikhorrami1998/siesta-installer.git
cd siesta-installer
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
- Download SIESTA 5.2.2  
- Configure the build using MPI and other optional components  
- Compile with all available cores  
- Install SIESTA system-wide

