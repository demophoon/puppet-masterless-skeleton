Puppet for your environment
===========================

Want to run puppet in your own environment without a master?

Installation
------------

1. Fork this repo into your own namespace.
2. Change the following files to point the puppet code to your forked control repo instead of mine.
    * Puppetfile
    * manifests/params.pp

3. Download the install.sh script to the machine you would like to manage with puppet and ensure it is executable.
    * Can be the install script in your fork or this one. Both will work the same.

4. Run the install.sh script on a machine you would like to manage with your new puppet control repo!

   `CONTROL_REPO='https://github.com/<YOUR_USERNAME_HERE>/puppet-masterless-skeleton' ./install.sh`

5. Start checking in puppet code to your fork to start managing your infrastructure with puppet.
    * Try adding some defined roles under `manifests/roles` using the [Roles and Profiles](http://garylarizza.com/blog/2014/02/17/puppet-workflow-part-2/) pattern.
    * Add additional modules to your `Puppetfile`.

6. Classify your infrastructure by adding nodes to `site.pp`

Contributing
============

Open issues here on [Github](https://github.com/demophoon/puppet-masterless-skeleton/issues/new).

OR if you are awesome and want to write some code

Fork, Create topic branch, Submit a PR!
