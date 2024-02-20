# Use a Windows base image
ARG GITHUB_TOKEN

FROM mcr.microsoft.com/windows/servercore:ltsc2022

# Set the working directory in the container
WORKDIR C:\\myapp

# Use PowerShell for subsequent commands
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop';"]

# Install Python and Git
# Note: Replace the URLs with the actual URLs for Python and Git installers
RUN Invoke-WebRequest -Uri 'https://www.python.org/ftp/python/3.9.0/python-3.9.0-amd64.exe' -OutFile 'python_installer.exe' -UseBasicParsing; \
    Start-Process python_installer.exe -ArgumentList '/quiet InstallAllUsers=1 PrependPath=1' -Wait; \
    Remove-Item python_installer.exe -Force; \
    Invoke-WebRequest -Uri 'https://github.com/git-for-windows/git/releases/download/v2.28.0.windows.1/Git-2.28.0-64-bit.exe' -OutFile 'git_installer.exe' -UseBasicParsing; \
    Start-Process git_installer.exe -ArgumentList '/VERYSILENT /NORESTART /NOCANCEL /SP-' -Wait; \
    Remove-Item git_installer.exe -Force
    # Invoke-WebRequest -Uri 'https://curl.se/ca/cacert.pem' -OutFile 'cacert.pem'; \
    # [System.Environment]::SetEnvironmentVariable('GIT_SSL_CAINFO', 'C:\codpy\cacert.pem', [System.EnvironmentVariableTarget]::Machine); \
    # Remove-Item cacert.pem -Force

# Add Python and Git to PATH (replace with the actual installation paths if different)
RUN $env:Path += ';C:\\Program Files\\Python39;C:\\Program Files\\Python39\\Scripts;C:\\Program Files\\Git\\cmd'; \
    [Environment]::SetEnvironmentVariable('Path', $env:Path, [EnvironmentVariableTarget]::Machine)

# Set the GitHub token as an environment variable
ENV GITHUB_TOKEN=$GITHUB_TOKEN

# Use the token to install the codpy package from the private repository
RUN $Env:GITHUB_TOKEN='YOURGITHUBTOKEN'; \
    git clone https://yourrepo:$Env:GITHUB_TOKEN@github.com/yourrepo/myapp.git; \
    cd myapp; \
    pip install .

# Reset the working directory to C:\app
WORKDIR C:\\app

# Copy the content of the local src directory to the working directory
COPY . C:\\app

# Install any dependencies from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# If necessary,  copy the specific .pyd file to the site-packages directory
COPY ["yourapp.cp39-win_amd64.pyd", "C:/Program Files/Python39/Lib/site-packages/"]

# Command to run on container start
#CMD ["powershell", "-Command", "while ($true) { Start-Sleep -Seconds 3600 }"]

CMD ["python", "C:\\app\\main.py"]
