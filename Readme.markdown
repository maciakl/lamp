LAMP Environment for Vagrant
===

This will automatically set up the stock precise32.box vagrant environment and then immediately
install full lamp stack, so you don't have to. As soon as the machine boots you can open your
web browser and hit:

- http://localhost:8080

If everything went correctly you should see a PHPInfo page. At that point you can immediately
start building your website in the `www` directory.

Usage
---

Set up is super easy:

    git clone https://github.com/maciakl/lamp.git
    cd lamp
    vagrant up

That's it. The `setup.sh` script will be ran automatically and will install all the dependencies. You should now have full blown lamp stack ready to go.

Details
---

Here are some things you might need to know:

- On the guest, web stuff lives in `/var/www`
- The root password for mysql is `toor`
- PDO is installed via the `php-mysql` package
- Mod Rewrite is enabled by default
