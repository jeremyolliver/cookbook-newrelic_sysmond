name             "newrelic_sysmond"
maintainer       "Jeremy Olliver"
maintainer_email "jeremy.olliver@gmail.com"
license          "Apache 2.0"
description      "Installs/Configures newrelic_sysmond"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.2.0"

recommends "apt", ">= 1.8.2" # Some earlier versions don't correctly trigger an apt-get update after adding the repo

%w{ ubuntu debian redhat centos amazon scientific }.each do |os|
  supports os
end

provides "service[newrelic-sysmond]"
