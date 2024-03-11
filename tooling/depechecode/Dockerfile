# docker build --ssh default -f depechecode/Dockerfile -t rmme -o - . > out.tar
FROM ubuntu:22.04 

# Configure the build parameters    
ENV POETRY_VERSION=1.4.2

# Set the working directory
WORKDIR /src

# Set the profiles dir
ENV DBT_PROFILES_DIR /root/.dbt

# Update and install dependencies
RUN apt -y update && \
    apt -y upgrade && \
    DEBIAN_FRONTEND=noninteractive apt -yq install curl \
    software-properties-common \
    python3-distutils \
    python3-dev \
    unixodbc-dev \
    # Install Git related stuff
    openssh-client \
    git \
    awscli \
    # Install AWS cli related stuff, as some of the CICD is done through this docker
    unzip \
    zip \
    # Remove the cache to save to place
    && apt-get autoremove -yqq --purge \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


# Install SQL Server ODBC Driver
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
    curl https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/prod.list > /etc/apt/sources.list.d/mssql-release.list && \
    apt -y update && \
    ACCEPT_EULA=Y apt -y install msodbcsql17

# Alias python to python 3
RUN ln -s /usr/bin/python3 /usr/bin/python & \
    ln -s /usr/bin/pip3 /usr/bin/pip

# Install Poetry use it to inject the project dependencies
COPY pyproject.toml pyproject.toml
RUN curl -sSL https://install.python-poetry.org | POETRY_HOME=/usr/local python3 - --version $POETRY_VERSION && \ 
    poetry install --no-interaction --no-ansi --only main

# Configure DBT to always use the profile file with interpolated values
COPY tooling/depechecode/cdbt /usr/local/bin/cdbt
RUN chmod +x /usr/local/bin/cdbt
COPY tooling/depechecode/profiles.yml /root/.dbt/profiles.yml

# Add the CICD script 
COPY tooling/depechecode/cicd /usr/local/bin/cicd
RUN chmod +x /usr/local/bin/cicd

# Allow github key
RUN mkdir -p -m 0600 ~/.ssh && \
    ssh-keyscan -H github.com >> ~/.ssh/known_hosts

# Add the content of depechecode for downstream build
COPY tooling/depechecode/DAG depechecode/DAG