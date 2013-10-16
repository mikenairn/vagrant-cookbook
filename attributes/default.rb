default['vagrant']['download_url'] = 'http://files.vagrantup.com/packages'
default['vagrant']['version'] = '1.3.5'
default['vagrant']['checksum'] = 'a40522f5fabccb9ddabad03d836e120ff5d14093'
default['vagrant']['arch'] = kernel['machine'] =~ /x86_64/ ? "x86_64" : "i686"
default['vagrant']['plugins'] = []

case node['platform_family']
  when 'mac_os_x'
    file_name = vagrant['version'].to_f >= 1.2 ? "Vagrant-#{vagrant['version']}" : 'Vagrant'
  when 'windows'
    file_name = vagrant['version'].to_f >= 1.2 ? "Vagrant_#{vagrant['version']}" : 'Vagrant'
  else
    file_name = vagrant['version'].to_f >= 1.2 ? "vagrant_#{vagrant['version']}_#{vagrant['arch']}" : "vagrant_#{vagrant['arch']}"
end

case node['platform_family']
  when 'redhat', 'fedora'
    default['vagrant']['rpm'] = "#{file_name}.rpm"
    default['vagrant']['rpm_url'] = "#{node['vagrant']['download_url']}/#{node['vagrant']['checksum']}/#{node['vagrant']['rpm']}"
  when 'windows'
    default['vagrant']['msi'] = "#{file_name}.msi"
    default['vagrant']['msi_url'] = "#{node['vagrant']['download_url']}/#{node['vagrant']['checksum']}/#{node['vagrant']['msi']}"
  when 'mac_os_x'
    default['vagrant']['dmg'] = "#{file_name}.dmg"
    default['vagrant']['dmg_url'] = "#{node['vagrant']['download_url']}/#{node['vagrant']['checksum']}/#{node['vagrant']['dmg']}"
  when 'debian', 'ubuntu'
    default['vagrant']['deb'] = "#{file_name}.deb"
    default['vagrant']['deb_url'] = "#{node['vagrant']['download_url']}/#{node['vagrant']['checksum']}/#{node['vagrant']['deb']}"
  else
    default['vagrant']['tar'] = "#{file_name}.pkg.tar.xz"
    default['vagrant']['tar_url'] = "#{node['vagrant']['download_url']}/#{node['vagrant']['checksum']}/#{node['vagrant']['tar']}"
end