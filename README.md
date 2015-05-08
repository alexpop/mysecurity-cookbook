mysecurity-cookbook Cookbook
==========================
Sample security cookbook used for dev & test purposes.

Requirements
------------
'ohai' cookbook


Attributes
----------

Usage
-----
#### mysecurity-cookbook::default

Add 'mysecurity-cookbook::default' to the run list. The installed ohai plugin creates two automatic node attributes:

* `node['languages']['bash']['version']` - Version of bash installed
* `node['languages']['bash']['shellshock_vulnerable']` - Boolean value based on CVE-2014-7169 vulnerability

Use knife search from the workstation to find the shellshock vulnerable nodes:

```
knife search node "languages_bash_shellshock_vulnerable:true" --id-only
```

License and Authors
-------------------
Authors: Alex Pop
