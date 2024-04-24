# Linux/macOS Environment Setup

## Installing Python and Miniconda

1. **Download Miniconda**:

   - Go to the Miniconda download page linked above.
   - Download the Miniconda installer for Linux or macOS, according to your system.

2. **Install Miniconda**:

   - Open a terminal.
   - Navigate to the directory containing the downloaded installer.
   - Run the installer script:
     - For Linux:
       
       ```
       bash Miniconda3-latest-Linux-x86_64.sh
       ```
     - For macOS:

       ```
       bash Miniconda3-latest-MacOSX-x86_64.sh
       ```
   - Follow the on-screen prompts to complete the installation and agree to the license terms. Allow `conda init` to run as suggested to set up Miniconda correctly.

3. **Verify Installation**:

   - Close and reopen your terminal.
   - Check the Miniconda installation:

     ```
     conda --version
     ```

4. **Create a Conda Environment**:

   - Create and activate a new environment:

     ```
     conda create -n myenv python=3.8
     conda activate myenv
     ```

5. **Install Required Packages**:

   - Install packages necessary for your project:

     ```
     conda install numpy scipy matplotlib
     ```

**General notes:**
- Miniconda comes with its own Python interpreter. When you install Miniconda, you're also installing a default version of Python, managed by Conda. This setup helps ensure that your Python environment is consistent with the packages and dependencies managed by Conda.
- **Miniconda vs. Anaconda**: Miniconda provides a minimal base installation of Conda, allowing more granular control over package installations, which is preferred for ensuring a lightweight and clean environment.
- **Using Different Python Versions**: You can specify a different version of Python if required by changing the version number in the `conda create` command.
- **Command Line Tools**: Ensure that command line tools are available in your PATH to use Miniconda from your terminal.
