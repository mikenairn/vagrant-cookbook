default['vagrant']['download_url'] = 'https://releases.hashicorp.com/vagrant'
default['vagrant']['version'] = '1.7.4'
default['vagrant']['arch'] = kernel['machine'] =~ /x86_64/ ? "x86_64" : "i686"
default['vagrant']['plugins'] = []

case node['platform_family']
  when 'redhat', 'fedora'
    default['vagrant']['rpm'] = "vagrant_#{node['vagrant']['version']}_#{node['vagrant']['arch']}.rpm"
    default['vagrant']['url'] = "#{node['vagrant']['download_url']}/#{node['vagrant']['version']}/#{node['vagrant']['rpm']}"
  when 'windows'
    default['vagrant']['msi'] = "vagrant_#{node['vagrant']['version']}.msi"
    default['vagrant']['url'] = "#{node['vagrant']['download_url']}/#{node['vagrant']['version']}/#{node['vagrant']['msi']}"
  when 'mac_os_x'
    default['vagrant']['dmg'] = "vagrant_#{node['vagrant']['version']}.dmg"
    default['vagrant']['url'] = "#{node['vagrant']['download_url']}/#{node['vagrant']['version']}/#{node['vagrant']['dmg']}"
  when 'debian', 'ubuntu'
    default['vagrant']['deb'] = "vagrant_#{node['vagrant']['version']}_#{node['vagrant']['arch']}.deb"
    default['vagrant']['url'] = "#{node['vagrant']['download_url']}/#{node['vagrant']['version']}/#{node['vagrant']['deb']}"
  else
    default['vagrant']['tar'] = nil
    default['vagrant']['url'] = nil
end