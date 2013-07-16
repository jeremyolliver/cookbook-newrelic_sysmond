Description
===========

This cookbook installs, and keeps up to date the newrelic system monitoring daemon "newrelic-sysmond". This cookbook should support all of ubuntu debian redhat centos amazon scientific though it is only actively tested on ubuntu and redhat systems.

This cookbook will install newrelic-sysmond as per default configurations provided by newrelic on your system, with one exception - traffic will be sent over SSL by default, the default newrelic configuration file has SSL off.

Requirements
============

If you are using ubuntu or debian, you should have "1.8.2" or higher of the apt cookbook as well. (Earlier versions don't trigger an apt-get update after adding the repository).

You will also need a newrelic account (free plan is available), and to provide your newrelic license key via attributes to this cookbook.

Attributes
==========

All attributes map to configuration optionsof the same name in the newrelic config file.

Common options:

* `newrelic['license_key']`    Needs specifying
* `newrelic['ssl']`            = `true` # changed from newrelic's default of false
* `newrelic['timeout']`        = `30`
* `newrelic['loglevel']`       = `'info'`
* `newrelic["proxy"]`          = `nil`

Other attributes:

* `newrelic['collector_host']` = `'collector.newrelic.com'`
* `newrelic["keyserver"]`      = `'subkeys.pgp.net'`
* `newrelic["logfile"]`        = `'/var/log/newrelic/nrsysmond.log'`
* `newrelic["ssl_ca_bundle"]`  = `nil`
* `newrelic["ssl_ca_path"]`    = `nil`
* `newrelic["pidfile"]`        = `nil`

The license key needs specifying with your own newrelic license key.
All other attributes are keep the same as the default configuration provided
by newrelic with the exception of the `ssl` option which has been turned on by
default, because I assume you don't want system details able to be intercepted
across a network between here and the newrelic servers

Usage
=====

Set either on your node, or in a role/environment the attribute

    node['newrelic']['license_key']

and include this cookbook in your run list.

The newrelic-sysmond package will be installed and keep up to date, as well
as being enabled as a service (will run on boot, and started when you first
enable it)
