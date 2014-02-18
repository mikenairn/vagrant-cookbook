Vagrant Cookbook
================

Installs Vagrant and Vagrant plugins

Requirements
------------

### Platform:

* Mac_os_x
* Ubuntu

### Cookbooks:

* dmg

Attributes
----------

<table>
  <tr>
    <td>Attribute</td>
    <td>Description</td>
    <td>Default</td>
  </tr>
  <tr>
    <td><code>node['vagrant']['download_url']</code></td>
    <td>Download URL</td>
    <td><code>http://files.vagrantup.com/packages</code></td>
  </tr>
  <tr>
    <td><code>node['vagrant']['version']</code></td>
    <td>Vagrant version to install</td>
    <td><code>1.3.5</code></td>
  </tr>
  <tr>
    <td><code>node['vagrant']['plugins']</code></td>
    <td>Vagrant plugins to install</td>
    <td><code>1.3.5</code></td>
  </tr>
</table>

Recipes
-------

### vagrant::default

Installs Vagrant and Vagrant plugins


Usage
-------

### Example Chef Solo Config

```
{
  "instance_role": "dev_host",
  "vagrant": {
     "version": "1.4.3",
        "plugins": [
          {
            "vagrant-aws": {
              "version": "0.4.1"
            }
          },
          {
            "vagrant-omnibus": {
              "version": "1.2.1"
            }
          },
          {
            "vagrant-butcher": {
              "version": "2.1.4"
            }
          }
        ]
  },
  "run_list": [
    "recipe[vagrant]"
  ]
}
```

License and Author
------------------

Author:: Michael Nairn (<m.nairn@gmail.com>)

Copyright:: 2013, Michael Nairn

License:: Apache 2.0

