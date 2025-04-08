#!/bin/sh
echo "======================================================================"
echo "Welcome to the setup. This will enable the local virtual environment."
echo "It will also run the application in development mode."
echo "----------------------------------------------------------------------"

# Check if the virtual environment directory exists
if [ -d "app_project" ]; then
    echo "Virtual environment found."
else
    echo "No virtual environment found. Please run setup.sh first."
    exit 1
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

# Set environment variable for development mode (Windows-specific)
echo "Setting environment variable..."
set ENV=development

# Run the Python application
echo "Running the application..."
python app.py

if [ $? -ne 0 ]; then
    echo "Error: Failed to run 'app.py'. Please check your application for errors."
    deactivate
    exit 1
fi

# Deactivate the virtual environment
echo "Deactivating virtual environment..."
deactivate