################################################################################
## Do not delete the following line. It includes the important masterless secret sauce.
################################################################################
include profiles::masterless


################################################################################
## Add includes and/or nodes below 
################################################################################
node default {
  notify {'Please add classification to the site.pp file in your control repo.':
    loglevel => warning,
  }
}
