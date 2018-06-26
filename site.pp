node default {
  notify {'Please add classification to /etc/puppetlabs/code/environments/production/site.pp':
    loglevel => warn,
  }
}
