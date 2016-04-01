name             'vagrant'
maintainer       'Michael Nairn'
maintainer_email 'm.nairn@gmail.com'
license           'Apache 2.0'
description      'Installs Vagrant and Vagrant plugins'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.6.0'

%w{ mac_os_x ubuntu }.each do |platform|
  supports platform
end

%w{ dmg }.each do |cookbook|
  depends cookbook
end

recipe 'vagrant::default', "Installs Vagrant and Vagrant plugins"
