maintainer       "Jeremy Olliver"
maintainer_email "jeremy.olliver@gmail.com"
license          "Apache 2.0"
description      "Installs/Configures newrelic_sysmond"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.1"

depends "apt", ">= 1.8.2" # Some earlier versions don't correctly trigger an apt-get update after adding the repo

supports "ubuntu"
supports "debian"
