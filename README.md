## Documentation

Runs nginx, php-fpm and mysql (mariadb).

## Dependencies

1. [Vagrant](https://www.vagrantup.com/downloads.html)
2. [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
3. [Ansible](http://docs.ansible.com/ansible/intro_installation.html) (for all non-windows environments)

## Installation

  1. Install `Vagrant`, `VirtualBox` and `Ansible`
  
  2. Rename `Vagrantfile.default` file to `Vagrantfile` 

  3. Update `Vagrantfile` configs

  Go to ./Vagrantfile in the root and change the following settings:

      config.vm.provider :virtualbox do |v|
        v.name = "GIVE A NAME TO  YOUR MACHINE"
        v.customize [
            "modifyvm", :id,
            "--name", "GIVE A NAME TO  YOUR MACHINE",
            "--memory", 2048,
            "--natdnshostresolver1", "on",
            "--cpus", 4,
        ]
      end

  Replace `GIVE A NAME TO  YOUR MACHINE` with a name of your project.
  Other configs (like `--memory` or `--cpus`) can be left as is or updated
  if needed.
  
  4. If necessary, change port in the following line of `Vagrantfile`:

     `config.vm.network :private_network, ip: "192.168.33.99"`
  
  5. Copy `ansible/inventories/dev.default` file to `ansible/inventories/dev`.

     If you've changed port in the step above, change it here as well.

  6. Run `vagrant up`

  7. Download & import database

    `mysql db < dump.sql`

  8. Configure your `hosts` file to match the project name and the ip

    `192.168.33.99 sitename.local`

  9. Go to http://192.168.33.99 or http://sitename.local


## Usage

### OS root user

username: `root`
password: `vagrant`

### SSH

    vagrant ssh

It will log you in as "vagrant" user. If you want to switch to root user, do the following:

    vagrant ssh
    su

Or just connect through any available ssh terminal:

    ssh root@192.168.33.99

### MySQL

**Database name:** `db`

**MySQL user:**
  username: `root`
  password: `(empty)`

### How to access web server logs

  Go to http://192.168.33.99/logs

## TODO List

  1. Xdebug
  2. Redis
  3. Solr
  4. Selenium
  5. Phantomjs
  6. XHprof
  7. Add email stub
  8. Review performance
  9. PhpMyAdmin