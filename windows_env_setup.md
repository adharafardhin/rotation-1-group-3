# Windows Environment Setup
## Installing Python and Miniconda

1. **Download Miniconda**:
   - Visit the Miniconda download page: [Miniconda](https://docs.conda.io/en/latest/miniconda.html).
   - Choose the Miniconda version for Windows.
   - Download the appropriate installer for your architecture (64-bit is recommended).

2. **Install Miniconda**:
   - Run the downloaded installer.
   - Follow the on-screen instructions. Make sure to check:
     - **Add Miniconda to my PATH environment variable** (it is not mandatory, but it simplifies command line usage).

3. **Verify Installation**:

   - Open Command Prompt and type:

     ```
     conda --version
     ```
   - If Miniconda is installed correctly, the conda version should be displayed.

4. **Create a Conda Environment**:
   - In Command Prompt, create a new conda environment:

     ```
     conda create -n myenv python=3.8
     ```
   - Activate the environment:

     ```
     conda activate myenv
     ```

5. **Install Necessary Python Packages**:

   - With your environment activated, install the necessary packages using conda:

     ```
     conda install numpy scipy matplotlib
     ```

### General Notes
- Miniconda comes with its own Python interpreter. When you install Miniconda, you're also installing a default version of Python, managed by Conda. This setup helps ensure that your Python environment is consistent with the packages and dependencies managed by Conda.
- **Miniconda vs. Anaconda**: Miniconda provides a minimal base installation of Conda, allowing more granular control over package installations, which is preferred for ensuring a lightweight and clean environment.
- **Using Different Python Versions**: You can specify a different version of Python if required by changing the version number in the `conda create` command.
- **Command Line Tools**: Ensure that command line tools are available in your PATH to use Miniconda from your terminal.
