## Documentation

Runs nginx, php-fpm and mysql (mariadb).

## Dependencies

1. [Vagrant](https://www.vagrantup.com/downloads.html)
2. [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
3. [Ansible](http://docs.ansible.com/ansible/intro_installation.html) (for all non-windows environments)

## Installation

  1. Install Vagrant, VirtualBox and Ansible.

  2. Update Vagrant config file

Go to ./Vagrantfile in the root and change the following settings:

    v.customize [
        "modifyvm", :id,
        "--name", "default",
        "--memory", 2048,
        "--natdnshostresolver1", "on",
        "--cpus", 4,
    ]

Change the --name param to reflect the name of your project. Other params can be left unchanged.

  3. Run `vagrant up`

  4. Download & import database

    `mysql db < dump.sql`

  5. Configure your `hosts` file to match the project name and the ip

    192.168.33.99 sitename.local

  6. Go to http://192.168.33.99 or http://sitename.local


## Usage

### OS root user

username: `root`
password: `systemseed`

### SSH

    vagrant ssh

It will log you in as "vagrant" user. If you want to switch to root user, do the following:

    vagrant ssh
    su

Or just connect through any available ssh terminal:

    ssh root@192.168.33.99

### MySQL

**Database name:** `db`

**MySQL DB User:**
  username: `vagrant`
  password: `(empty)`

**MySQL ROOT user:**
  username: `root`
  password: `(empty)`

### How to access web server logs

  Go to http://192.168.33.99/logs

## TODO List
  0. Terminus
  1. Xdebug
  2. Redis
  3. Solr
  4. Selenium
  5. Phantomjs
  6. XHprof
  7. Add email stub
  8. Review performance
  9. PhpMyAdmin