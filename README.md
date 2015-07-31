# Todo
To get started, setup your SWI-Prolog environment.

The following will get you up an running in a Cloud9 enviroment:

From the terminal, run:

```
sudo apt-get install build-essential autoconf curl chrpath ncurses-dev libreadline-dev libgmp-dev libxext-dev libice-dev libjpeg8-dev libxinerama-dev libxft-dev libxpm-dev libxt-dev pkg-config libssl-dev unixodbc-dev openjdk-7-jdk junit zlib1g-dev libarchive-dev libossp-uuid-dev
git clone http://github.com/SWI-Prolog/swipl-devel.git ~/swipl
cd ~/swipl
./prepare
```

When prompted, type "yes".

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

# Start the server.

From the SWI-Prolog terminal, type the following. You can replace 8080 with whichever port you wish to use.

``` 
[server].
server(8080).
```

If you're in a Cloud9 environment, move runners/Prolog.run to .c9/runners/Prolog.run if you want to use the Run button.
