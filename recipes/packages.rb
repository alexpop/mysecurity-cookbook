#
# Cookbook Name:: mysecurity-cookbook
# Recipe:: packages
#

log '*** In mysecurity-cookbook::packages recipe'

bash 'Checking if bash is vulnerable' do
  flags '-ex'
  cwd '/tmp'
  code <<-'EOH'
    env x='() { :;}; echo vulnerable' bash -c "echo this is a test"
    bash -version
  EOH
end
