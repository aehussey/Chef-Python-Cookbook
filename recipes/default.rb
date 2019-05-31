#
# Cookbook:: python
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

apt_update 'update' do
  action :update
end

package 'python3' do
  action [:install, :upgrade]
end

package 'python-pip' do
  action [:install, :upgrade]
end

template '/etc/python3/requirements.txt' do
  source 'requirements.txt'
end

execute 'pip install' do
  command 'pip install -v -r /etc/python3/requirements.txt'
end
