# masterclass

## 1. Requirements
- [NodeJs](https://nodejs.org/en/download/) (version >= 8.11.2)
- IDE (eg [Visual Studio Code](https://code.visualstudio.com/download), Notepad or so on)

## 2. Setup environment
Windows (10 Pro)

1. Install truffle

    ``
    npm i -g truffle
    ``

2. Install Ethereum RPC client

    ``
    npm i -g ganache-cli
    ``
    
## 3. Run Ethereum RPC client 

1. Open PowerShell
2. Execute command

    ``
    ganache-cli
    ``
    
## 4. Getting started

1. Open PowerShell
2. Create directory for project

    ``
    mkdir masterclass
    ``
    
3. Clone repository

   ``
   git clone ...
   ``
    
4. Run Ethereum RPC client
5. Run truffle console

    ``
    truffle console
    ``
    
6. Run commands in truffle console (deploy contract, call function)

    ```
    > var contract
    > HelloWorld.new().then((instance) => { contract = instance; })
    > contract.get()
    ```
