default['vagrant']['download_url'] = 'http://files.vagrantup.com/packages'
default['vagrant']['version'] = '1.1.4'
default['vagrant']['version_hash'] = '87613ec9392d4660ffcb1d5755307136c06af08c'
default['vagrant']['arch'] = kernel['machine'] =~ /x86_64/ ? "x86_64" : "i686"

case node['platform_family']
  when 'redhat', 'fedora'
    default['vagrant']['rpm'] = "vagrant_#{vagrant['arch']}.rpm"
    default['vagrant']['rpm_url'] = "#{node['vagrant']['download_url']}/#{node['vagrant']['version_hash']}/#{node['vagrant']['rpm']}"
  when 'windows'
    default['vagrant']['msi'] = 'Vagrant.msi'
    default['vagrant']['msi_url'] = "#{node['vagrant']['download_url']}/#{node['vagrant']['version_hash']}/#{node['vagrant']['msi']}"
  when 'mac_os_x'
    default['vagrant']['dmg'] = 'Vagrant.dmg'
    default['vagrant']['dmg_url'] = "#{node['vagrant']['download_url']}/#{node['vagrant']['version_hash']}/#{node['vagrant']['dmg']}"
  when 'debian', 'ubuntu'
    default['vagrant']['deb'] = "vagrant_#{vagrant['arch']}.deb"
    default['vagrant']['deb_url'] = "#{node['vagrant']['download_url']}/#{node['vagrant']['version_hash']}/#{node['vagrant']['deb']}"
  else
    default['vagrant']['tar'] = "vagrant_#{vagrant['arch']}.pkg.tar.xz"
    default['vagrant']['tar_url'] = "#{node['vagrant']['download_url']}/#{node['vagrant']['version_hash']}/#{node['vagrant']['tar']}"
end