# Cleanup build and dist directories
Remove-Item -Force -Recurse .\dist
Remove-Item -Force -Recurse .\build

# Copy kestrel file from linux client repo
Copy-Item -Force .\Kestrel-AMPL-Linux\kestrel .\kestrel.py

# Run py2exe setup script
python setup.py py2exe

# Create zip file
Compress-Archive -Path .\dist\*, .\Kestrel-AMPL-Linux\kestrelkill, .\Kestrel-AMPL-Linux\kestrelret, .\Kestrel-AMPL-Linux\kestrelsub -DestinationPath .\kestrel.zip
