#
# Cookbook Name:: mysecurity-cookbook
# Recipe:: packages
#

include_recipe 'ohai::default'
log '*** In mysecurity-cookbook::packages recipe'

log "*** Bash vulnerable: #{node['languages']['bash']['shellshock_vulnerable']}"

package 'bash' do
  action :upgrade
  only_if { node['languages']['bash']['shellshock_vulnerable'] }
end
