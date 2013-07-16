#
# Cookbook Name:: newrelic_sysmond
# Recipe:: default
#
# Copyright 2012, Jeremy Olliver
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

if node['newrelic']['license_key']

  # First add the appropriate platform specific repository

  case node['platform']
  when "debian", "ubuntu"

    include_recipe("apt")

    apt_repository "newrelic" do
      uri "http://apt.newrelic.com/debian/"
      components ["newrelic", "non-free"]
      keyserver node["newrelic"]["keyserver"] # hkp://subkeys.pgp.net
      key "548C16BF"
      notifies :run, resources(:execute => "apt-get update"), :immediately
      not_if { File.exist?("/etc/apt/sources.list.d/newrelic-source.list") }
    end

  when "redhat", "centos", "amazon", "scientific"

    execute "Add New Relic yum repository" do
      command "rpm -Uvh http://download.newrelic.com/pub/newrelic/el5/i386/newrelic-repo-5-3.noarch.rpm"
      not_if "yum list installed | grep newrelic-repo.noarch"
    end

  end

  # Ensure the newrelic-sysmond package is installed and up to date.

  package "newrelic-sysmond" do
    action :upgrade
  end

  template "/etc/newrelic/nrsysmond.cfg" do
    source "nrsysmond.cfg.erb"
    variables :newrelic => node['newrelic']
    owner  "root"
    group  "newrelic"
    mode   "0640"
  end

  service "newrelic-sysmond" do
    action [:enable, :start]
  end

else
  Chef::Log.warn("New Relic license not specifed, skipping enabling agent please specify ['newrelic']['license_key'] through environment/role/node")
end
