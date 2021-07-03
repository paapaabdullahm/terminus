# Terminus CLI
Terminus CLI for advanced interaction with the Pantheon platform

**Current Terminus CLI Tag: v2.6.0**

## Install as native binary

First export and persist version
```sh
$ export TERMINUS_VERSION="v2.6.0"
$ echo 'TERMINUS_VERSION="v2.6.0"' | sudo tee -a /etc/environment > /dev/null
```

To update an already exported version (optional)
```sh
$ export TERMINUS_VERSION="<your-new-version-string-goes-here>"
$ sudo sed -i "/TERMINUS_VERSION/c TERMINUS_VERSION=\"$TERMINUS_VERSION\"" /etc/environment
```

Pull image from docker.io
```sh
$ docker pull pam79/terminus:${TERMINUS_VERSION}
```

Create a wrapper script with your favorite editor
```sh
$ sudo vim /usr/local/bin/terminus
```

Add the following docker run command to the file
```sh
#!/bin/sh

# A wrapper script for invoking terminus with docker
# Put this script in $PATH as terminus

TTY_FLAG=``

if [ -t 1 ]; then TTY_FLAG="-t"; fi

exec docker run --rm -i ${TTY_FLAG} \
     --volume "$(pwd)":/src \
     --workdir /src \
     --user $(id -u):$(id -g) \
     "pam79/terminus:${TERMINUS_VERSION}" "$@";
```

Make script executable
```sh
$ sudo chmod +x /usr/local/bin/terminus
```

Test script
```sh
$ terminus --version
```

## Usage
Use Terminus to perform these and [other operations](https://pantheon.io/docs/terminus/commands/):

- Create a new site
- Create and delete Multidev environments
- Clone one environment to another
- Check for and apply upstream updates
- Deploy code from one environment to another
- Run [Drush](https://pantheon.io/docs/drush/) and [WP-CLI](https://pantheon.io/docs/wp-cli/) commands



For more info on terminus commands, visit their [official website](https://pantheon.io/docs/terminus/).
