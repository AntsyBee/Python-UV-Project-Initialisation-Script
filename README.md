# Python Project Initialization Script

This script automates the process of creating and setting up a Python project folder using a batch file. Pythons UV package manager must be installed and available in order for the script to work. The script sets up the environment for a Python project, including necessary directories, configuration files, allows for the installation of desired packages, handles package dependancies and creates all required project files.

## Features

- **Directory Setup:** The script automatically identifies the folder where it is executed and sets it as the project folder.
- **Confirmation Prompt:** Before proceeding, the script asks the user for confirmation to continue, ensuring no accidental folder creation.
- **Project Folder Initialization:** Initializes a new Python project folder with the required structure.
- **VSCode Setup:** Creates and populates the `.vscode` directory with a custom `settings.json` configuration.
- **Package Installation:** The script allows the user to specify any desired Python packages to be installed, or skips the installation if no packages are provided.
- **Pre-defined Python Files:** A basic Python file (`hello.py`) is moved into the `src` folder and renamed to `main.py`.
- **VSCode Launch:** After project setup, the script opens the project folder directly in Visual Studio Code.

## Usage

1. **Run the Script:**
   - Save the script as a `.bat` file and run it in the desired folder.
2. **Confirmation:**
   - You will be prompted to confirm whether you want to proceed with initializing the project. Enter `Y` to proceed or `N` to abort.
3. **Package Installation:**
   - After confirming, you will be asked if you want to add any Python packages to the project. Enter the package names separated by spaces or commas, or leave it blank to skip package installation.
4. **Project Setup:**
   - The script creates the necessary directories (`.vscode`, `src`), moves the `hello.py` file into `src/main.py`, and installs the specified packages.
5. **VSCode Launch:**
   - The script automatically opens the project folder in Visual Studio Code upon completion.

## Notes

- The project initialization is based on the `UV` python package manager, which must be installed and available in your environment.
- The script is designed to be flexible and can be adapted to various project setups by modifying the commands and paths used.
