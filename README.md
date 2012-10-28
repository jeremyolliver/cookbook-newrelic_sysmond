Description
===========

This cookbook installs, and keeps up to date the newrelic system monitoring daemon "newrelic-sysmond". So far this cookbook only supports debian systems

Requirements
============

ubuntu/debian

Also depends on version 1.4.2 of the apt cookbook. This is because more recent
versions break the notifications, causing apt-get update to never run after
adding the newrelic package repository, and the installation to fail without
manually running apt-get update in between

Attributes
==========

* newrelic[:license_key]    Needs specifying
* newrelic[:ssl]            = true # changed from newrelic's default of false
* newrelic[:collector_host] = 'collector.newrelic.com'
* newrelic[:timeout]        = 30
* newrelic[:loglevel]       = 'info'

The license key needs specifying with your own newrelic license key.
All other attributes are keep the same as the default configuration provided
by newrelic with the exception of the `ssl` option which has been turned on by
default, because I assume you don't want system details able to be intercepted
across a network between here and the newrelic servers

Usage
=====

Set either on your node, or in a role/environment the attribute

    node[:newrelic][:license_key]

and include this cookbook in your run list.

The newrelic-sysmond package will be installed and keep up to date, as well
as being enabled as a service (will run on boot, and started when you first
enable it)
