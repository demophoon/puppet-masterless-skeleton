#!/bin/bash

################################################################################
##  User options
################################################################################
control_repo=''

################################################################################
##  Touching anything below this line may lead to the control repo breaking
##  You've been warned!
################################################################################

control_repo=${CONTROL_REPO:?}
puppet="/opt/puppetlabs/puppet/bin/puppet"
r10k="/opt/puppetlabs/puppet/bin/r10k"

command_exists() {
    type "$1" &> /dev/null ;
}

install_puppet() {
    # Currently only supports ubuntu
    if command_exists dpkg; then
        source /etc/os-release
        codename=$(lsb_release -c | cut -f2)
        release_file="puppet5-release-${codename:?}.deb"
        wget "https://apt.puppetlabs.com/${release_file:?}"
        dpkg -i ${release_file:?}
        rm ${release_file:?}
        apt-get update
        apt-get install puppet-agent -y
    elif command_exists yum; then
        source /etc/os-release
        release_file="puppet5-release-el-${VERSION_ID:?}.noarch.rpm"
        rpm -Uvh "https://yum.puppetlabs.com/${release_file:?}"
        yum install puppet-agent -y
    else
      echo "Unsupported platform :("
      exit 1
    fi
}

run_puppet() {
  ${r10k:?} deploy environment -pv
  ${puppet:?} apply --modulepath /etc/puppetlabs/code/environments/production/modules/ /etc/puppetlabs/code/environments/production/site.pp
}

if [ ${UID} -ne 0 ]; then
  echo "This script must run as root to work properly."
  exit 1
fi

if ! command_exists /opt/puppetlabs/puppet/bin/puppet; then
    install_puppet
fi

if [ "${1}" = "run" ]; then
    run_puppet
    exit $?
fi

${puppet:?} apply -e "
class { 'r10k':
  sources => {
    'puppet' => {
      'remote' => '${control_repo:?}',
      'basedir'=> '/etc/puppetlabs/code/environments',
      'prefix' => false,
    },
  },
}"

run_puppet
