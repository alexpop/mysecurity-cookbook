
# Skip ohai if the 'bash' plugin is already installed. 
# chef-client::config enables this by adding Ohai::Config[:plugin_path] in client.rb
if !(node['languages'] && node['languages']['bash'])
  # Specify the directory(files/default/plugins/) where 
  # the 'ohai::default' recipe finds the bash plugin
  node.default['ohai']['plugins']['mysecurity-cookbook'] = 'plugins'
  include_recipe 'ohai::default'
end

Chef::Log.warn "*** Bash vulnerable: #{node['languages']['bash']['shellshock_vulnerable']}"

# Upgrade bash if vulnerable and trigger ohai plugin reload 
package 'bash' do
  action :upgrade
  only_if { node['languages']['bash']['shellshock_vulnerable'] }
  notifies :reload, "ohai[reload_bash]", :immediately
end

# Reload the 'bash' plugin to update the bash attributes
ohai 'reload_bash' do
  plugin 'languages/bash'
  action :nothing
end


