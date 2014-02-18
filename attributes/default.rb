default['vagrant']['download_url'] = 'https://dl.bintray.com/mitchellh/vagrant'
#https://dl.bintray.com/mitchellh/vagrant/Vagrant-1.4.3.dmg
default['vagrant']['version'] = '1.4.3'
default['vagrant']['arch'] = kernel['machine'] =~ /x86_64/ ? "x86_64" : "i686"
default['vagrant']['plugins'] = []

case node['platform_family']
  when 'redhat', 'fedora'
    default['vagrant']['rpm'] = "vagrant_#{node['vagrant']['version']}_#{node['vagrant']['arch']}.rpm"
    default['vagrant']['url'] = "#{node['vagrant']['download_url']}/#{node['vagrant']['rpm']}"
  when 'windows'
    default['vagrant']['msi'] = "Vagrant_#{node['vagrant']['version']}.msi"
    default['vagrant']['url'] = "#{node['vagrant']['download_url']}/#{node['vagrant']['msi']}"
  when 'mac_os_x'
    default['vagrant']['dmg'] = "Vagrant-#{node['vagrant']['version']}.dmg"
    default['vagrant']['url'] = "#{node['vagrant']['download_url']}/#{node['vagrant']['dmg']}"
  when 'debian', 'ubuntu'
    default['vagrant']['deb'] = "vagrant_#{node['vagrant']['version']}_#{node['vagrant']['arch']}.deb"
    default['vagrant']['url'] = "#{node['vagrant']['download_url']}/#{node['vagrant']['deb']}"
  else
    default['vagrant']['tar'] = nil
    default['vagrant']['url'] = nil
end