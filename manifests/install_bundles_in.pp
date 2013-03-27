# Define: install_bundles_in
#  Searches for Gemfiles and runs 'bundle install' for each
# Parameters:
#  $title: the directory where we should keep the gems up-to-date
#
define bundler::install_bundles_in( $user = 'root', $deployment = false, $without = '' ) {
  if $deployment == true {
    $_deploy = '--path vendor/bundle'
  } else {
    $_deploy = ''
  }
  exec { "install_bundles_${title}":
    # this one runs silent on success
    unless  => "/usr/bin/sudo -u ${user} /usr/bin/find '${title}' -maxdepth 1 -name Gemfile -execdir bash -c \"bundle check || bundle install ${_deploy} --without '${without}'\" \\;",
    command => '/bin/false',
    # FixMe: We might not find all Bundles which need installation
    # unless  => "/usr/bin/find '${title}' -name Gemfile -execdir bundle check \\;",
    require => Package[bundler],
  }
}
