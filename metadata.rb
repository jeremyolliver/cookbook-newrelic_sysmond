maintainer       "Jeremy Olliver"
maintainer_email "jeremy.olliver@gmail.com"
license          "Apache 2.0"
description      "Installs/Configures newrelic_sysmond"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.0"

depends "apt", "= 1.4.2" # As of 1.4.8 there is a bug with notifications from apt_repository resources

supports "ubuntu"
supports "debian"
