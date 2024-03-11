# Documention'S website
> Helping dashboards-developers, one README at a time.

## Pre-requisites

### Install Node.js and Node Versions Manager
> Doc is for linux only. (If you are crazy enough to use Windows, you deserve the struggle).

The website is created with Node.js and Nuxt.js. You need to install Node.js to be able to run the website locally. We advise you to use the Node Version Manager to save you from future conflicting issues with other projects. I you alkready now Python / Virtualenv, you schould feel at home.

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash # Install NVM
source ~/.bashrc # Reload bashrc
nvm install v18.10.0 # Install Node.js
```

## How to contribute ?

1. Start the website in preview mode to previzualize your changes

```bash
npm run dev
```