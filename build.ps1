# Cleanup build and dist directories
Remove-Item -Force -Recurse .\dist
Remove-Item -Force -Recurse .\build

# Remove previous kestrel.zip
Remove-Item -Force .\kestrel.zip

# Copy kestrel and kestrelAMPL.py files from linux client repo
Copy-Item -Force .\Kestrel-AMPL-Linux\kestrel .\kestrel.py
Copy-Item -Force .\Kestrel-AMPL-Linux\kestrelAMPL.py .\kestrelAMPL.py

# Run py2exe setup script
python setup.py py2exe

# Create zip file
Compress-Archive -Path .\dist\*, .\Kestrel-AMPL-Linux\kestrelkill, .\Kestrel-AMPL-Linux\kestrelret, .\Kestrel-AMPL-Linux\kestrelsub -DestinationPath .\kestrel.zip
