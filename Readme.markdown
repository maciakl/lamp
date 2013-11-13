LAMP Environment for Vagrant
===

This will automatically set up the stock [precise32.box][p32] vagrant environment and then immediately
install full LAMP stack, so you don't have to. As soon as the machine boots you can open your
web browser and hit:

- [http://localhost:8080](http://localhost:8080/)

If everything went correctly you should see a PHPInfo page. At that point you can immediately
start building your website in the `www` directory.

Usage
---

Set up is super easy:

    git clone https://github.com/maciakl/lamp.git
    cd lamp
    vagrant up

That's it. The `setup.sh` script will be ran automatically and will install all the dependencies. You should now have full blown lamp stack ready to go.

Customizing
---

You can add instructions to `setup.sh` if you want them to be executed when the box bootstraps itself for the first time.

Details
---

Here are some things you might need to know:

- On the guest, web stuff lives in `/var/www`
- The root password for mysql is `toor`
- PHP PDO module is installed via the `php-mysql` package
- Apache `mod_rewrite` is enabled by default
- [Composer][co] is installed in `/usr/bin/local/compiser`


  [co]: http://getcomposer.com
  [p32]: http://files.vagrantup.com/precise32.box
  [vag]: http://vagrantup.com
