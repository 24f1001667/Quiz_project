#!/bin/sh
echo "======================================================================"
echo "Welcome to the setup. This will set up the local virtual environment."
echo "It will also install all the required Python libraries."
echo "You can rerun this without any issues."
echo "----------------------------------------------------------------------"

# Check if the virtual environment directory exists
if [ -d "app_project" ]; then
    echo "Virtual environment already exists."
else
    echo "Creating virtual environment in 'app_project'..."
    python -m venv app_project
fi

echo "----------------------------------------------------------------------"
# Activate the virtual environment (Windows-specific command)
if [ -f "app_project/Scripts/activate.bat" ]; then
    echo "Activating virtual environment..."
    app_project/Scripts/activate.bat
else
    echo "Error: Could not find 'activate.bat'. Ensure 'app_project' is a valid virtual environment."
    exit 1
fi

# Install required Python libraries
echo "Installing required Python libraries..."
pip install -r requirements.txt

if [ $? -ne 0 ]; then
    echo "Error: Failed to install dependencies from 'requirements.txt'."
    deactivate
    exit 1
fi

echo "----------------------------------------------------------------------"
# Deactivate the virtual environment
echo "Deactivating virtual environment..."
deactivate

echo "Setup completed successfully!"
echo "======================================================================"