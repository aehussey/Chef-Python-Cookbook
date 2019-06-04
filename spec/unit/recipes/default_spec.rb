#
# Cookbook:: python
# Spec:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'python::default' do
  context 'When all attributes are default, on Ubuntu 16.04' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '16.04')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
    it 'runs apt get update' do
      expect(chef_run).to update_apt_update 'update'
    end
    it 'should install python3' do
      expect(chef_run).to install_package('python3')
    end
    it 'should upgrade python' do
      expect(chef_run).to upgrade_package('python3')
    end
    it 'should install python-pip' do
      expect(chef_run).to install_package('python-pip')
    end
    it 'should upgrade python-pip' do
      expect(chef_run).to upgrade_package('python-pip')
    end

   it 'should enable pip install' do
     expect(chef_run).to enable_service "pip install"
   end
   it 'should start pip install' do
    expect(chef_run).to start_service "pip install"
  end
  it 'should create a requirements.txt template in /etc/python3/' do
    expect(chef_run).to create_template("/etc/python3/requirements.txt")
  end
  it 'should execute pip install' do
    expect(chef_run).to run_execute('pip install')
  end
    at_exit { ChefSpec::Coverage.report! }
  end
end
