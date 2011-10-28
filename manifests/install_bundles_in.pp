# Define: install_bundles_in
#  Searches for Gemfiles and runs 'bundle install' for each
# Parameters:
#  $title: the directory where we should keep the gems up-to-date
#
define bundler::install_bundles_in() {
  exec { "install_bundles_${title}":
    command => "find '${title}' -name Gemfile -execdir bash -c \"bundle check || bundle install\" \\;",
    # FixMe: We might not find all Bundles which need installation
    unless  => "find '${title}' -name Gemfile -execdir bundle check \\;",
    require => Package[bundler],
  }
}
