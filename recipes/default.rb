#
# Cookbook Name:: vagrant
# Recipe:: default
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

case node['platform_family']
  when 'redhat', 'fedora'
    remote_file "#{Chef::Config['file_cache_path']}/#{node['vagrant']['rpm']}" do
      source node['vagrant']['url']
      mode 0644
      not_if "test -f #{Chef::Config['file_cache_path']}/#{node['vagrant']['rpm']}"
    end
    rpm_package "vagrant" do
      source "#{Chef::Config['file_cache_path']}/#{node['vagrant']['rpm']}"
      action :install
      not_if "vagrant --version | grep #{node['vagrant']['version']}"
    end
  when "debian"
    remote_file "#{Chef::Config['file_cache_path']}/#{node['vagrant']['deb']}" do
      source node['vagrant']['url']
      mode 0644
      not_if "test -f #{Chef::Config['file_cache_path']}/#{node['vagrant']['deb']}"
    end
    dpkg_package "vagrant" do
      source "#{Chef::Config['file_cache_path']}/#{node['vagrant']['deb']}"
      action :install
      not_if "vagrant --version | grep #{node['vagrant']['version']}"
    end
  when "mac_os_x"
    dmg_package "Vagrant" do
      source node['vagrant']['url']
      type "pkg"
      action :install
      not_if "vagrant --version | grep #{node['vagrant']['version']}"
    end
  else
    return "#{node['platform']} is not supported by the #{cookbook_name}::#{recipe_name} recipe"
end

node['vagrant']['plugins'].each() do |plugin|
  execute "vagrant plugin install #{plugin}" do
    command "vagrant plugin install #{plugin}"
    not_if "vagrant plugin list | grep #{plugin}"
  end
end