
Quick Puppet Development Environment
====================================

Want to run Puppet in your own environment without a master?

Basic Instructions
------------------

+ Fork this repo into your own namespace.
+ Change the following files to point to _your_ forked Github repo.
  + Puppetfile
  + manifests/params.pp
+ Download the `run-puppet` script to the machine you would like to manage
with Puppet and ensure it is executable.
+  Run the `run-puppet` script on a machine you would like to manage
with your new Puppet control repo.  Set the control repo with either the
`CONTROL_REPO` environment variable or the `-c` flag:
    + `CONTROL_REPO=https://github.com/<YOUR_USERNAME_HERE>/puppet-masterless-skeleton ./run-puppet` _or_
    + `./run-puppet -c https://github.com/<YOUR_USERNAME_HERE>/puppet-masterless-skeleton`


Classifying your environment
----------------------------

+ Add Puppet files (with a '.pp' suffix) to the `manifests` directory.
+ Add `include` statements to the `site.pp` file to include the above
Puppet files.
+ Add any support files to the `files/<module>/<filename>` directory and
reference them as `puppet:///modules/profiles/<module>/<filename>`. Example:
    + Location in repo: `files/artifactory/some-random-file`
    + Reference in Puppet code: `puppet:///modules/profiles/artifactory/some-random-file`
* Classify your infrastructure by adding nodes to `site.pp`
+ Commit and push Puppet code to your fork to manage the target machine
with Puppet.


Extras
------

* Add defined roles under `manifests/roles` using the
[Roles and Profiles](http://garylarizza.com/blog/2014/02/17/puppet-workflow-part-2/) pattern.
* Add additional modules to `Puppetfile`.
* By default puppet is configured to automatically run every 30 minutes from
the top of each hour. If you would like to manually kickoff a puppet run just
rerun the `run-puppet` script on the machine you wish to run puppet on.
* Use the `-n` argument to `run-puppet` to prevent `puppet/r10k` from
being re-initialized.



Running With Vagrant
--------------------

+ [Set up VirtualBox and Vagrant](https://www.vagrantup.com/intro/getting-started/index.html)
+ Add a `Vagrantfile` to your fork. Pushing isn't required but doesn't hurt.
The minimum would be something like this:

```ruby
Vagrant.configure(2) do |config|
  config.vm.box = "centos/7"
end
```

In 1 window

+ Make changes to the manifest/*.pp files
+ Control use in the Puppetfile and the toplevel site.pp
+ Commit and push changes

In another window, from the clone

+ Run `vagrant up` then `vagrant ssh`
+ To deploy the Puppet code inside the vagrant VM:
  + `sudo su -`
  + `cd /vagrant`
  + `./run-puppet -c <control-repo>`

+ Make any changes in the first window. Repeating `run-puppet` will update
the vagrant VM with changed code.
+ Clean the vagrant VM if needed with `vagrant destroy`


Contributing
============

Open issues here on
[Github](https://github.com/demophoon/puppet-masterless-skeleton/issues/new).

OR if you are awesome and want to write some code

Fork, Create topic branch, Submit a PR!
