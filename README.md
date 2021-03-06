# Getting Started
To get started, setup your SWI-Prolog environment.

The following will get you up and running in a Cloud9 enviroment (http://c9.io):

From the terminal, run:

```
sudo apt-get install build-essential autoconf curl chrpath ncurses-dev libreadline-dev libgmp-dev libxext-dev libice-dev libjpeg8-dev libxinerama-dev libxft-dev libxpm-dev libxt-dev pkg-config libssl-dev unixodbc-dev openjdk-7-jdk junit zlib1g-dev libarchive-dev libossp-uuid-dev
git clone http://github.com/SWI-Prolog/swipl-devel.git ~/swipl
cd ~/swipl
./prepare
```

When prompted about git submodule --init, type "yes".

When prompted about documentation, type "3".

```
./configure --with-world
make
sudo make install
cd ~/workspace
```

Test it. In the terminal, type:
```
swipl
```
From the SWI-Prolog terminal, type:
```
check_installation.
```
This will probably give an warning about library(jpl), but it doesn't matter for this app.

# Start the server

Once you have checked out the todo app, you're ready to go. From the SWI-Prolog terminal, type the following. You can replace 8080 with whichever port you wish to use.

``` 
[server].
server(8080).
```

On Cloud9, you can access this todo app by choosing Preview->Running Application.

If you're in a Cloud9 environment, you can move ~/workspace/runners/Prolog.run to .c9/runners/Prolog.run to use the Run button.
