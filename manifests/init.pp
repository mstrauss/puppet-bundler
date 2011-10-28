class bundler {
  
  Class[rubygems] -> Class[bundler]
  
  # gem_fixed_version is part of https://github.com/mstrauss/puppet-rubygems;
  # it returns the version of the latest available gem;
  # if we would use simply 'latest' this had the same effect on the puppets but
  # it would show as configuration change on each puppet run
  package { 'bundler': ensure => gem_fixed_version('bundler'), provider => gem }
  
}
