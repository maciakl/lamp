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

That's it. 

The `setup.sh` script will be ran automatically, will install all the dependencies and
clean up after itself. You should now have full blown lamp stack ready to go with a minimalistic
vagrant file.
    
If all went well you should see a folder structure like this in your directory:

    .
    ├── .gitignore
    ├── Vagrantfile
    └── www
        └── index.php
        
Note that the provisioning script `setup.sh` will be deleted along with `.git` and the readme file to
give you a clean working environment.

Customizing
---

You can add instructions to the end of `setup.sh` file. They will be executed when the box bootstraps 
itself the first time you run `vagrant up`. Note that you have to add these modifications before you
bring up the box for the first time.

Details
---

Here are some things you might need to know:

- On the guest, web stuff lives in `/var/www`
- The root password for mysql is `toor`
- PHP PDO module is installed via the `php-mysql` package
- Apache `mod_rewrite` is enabled by default
- [Composer][co] is installed in `/usr/bin/local/composer`
- [Pear][pear] is installed by default and has `auto_discover` enabled
- [PHPUnit][unit] is installed along with all dependencies via Pear on first boot
- [PHPDocumentor][doc] is also instaleld via Pear


  [co]: http://getcomposer.org
  [p32]: http://files.vagrantup.com/precise32.box
  [vag]: http://vagrantup.com
  [pear]: http://pear.php.net/
  [doc]: http://www.phpdoc.org/
  [unit]: http://phpunit.de
