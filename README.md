Puppet for your environment
===========================

Want to run puppet in your own environment without a master?

Here is how:

1. Fork this repo into your own namespace.
2. Change the following files to point the puppet code to your forked control
   repo instead of mine.
    * Puppetfile
    * manifests/params.pp

3. Run the install.sh script on a machine you would like to manage with your new
   puppet control repo!

   `CONTROL_REPO='https://github.com/<YOUR_USERNAME_HERE>/puppet-masterless-skeleton' ./install.sh`
