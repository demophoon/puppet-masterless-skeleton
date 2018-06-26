################################################################################
## Do not delete the following line. It includes the important masterless secret sauce.
################################################################################
include profiles::masterless


################################################################################
## Add custom classification below
################################################################################
node default {
  notify {'Please add classification to /etc/puppetlabs/code/environments/production/site.pp':
    loglevel => warning,
  }
}
