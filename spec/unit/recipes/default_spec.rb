#
# Cookbook Name:: webserver_test
# Spec:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
require 'spec_helper'

describe 'webserver_test::default' do
  context 'when run on CentOS 7.3.1611' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'centos', version: '7.3.1611')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'installs httpd' do
      expect(chef_run).to install_package 'httpd'
    end

    it 'enables the httpd service' do
      expect(chef_run).to enable_service 'httpd'
    end

    it 'starts the httpd service' do
      expect(chef_run).to start_service 'httpd'
    end
  end

  context 'when run on Ubuntu 14.04' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '14.04')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'installs apache2' do
      expect(chef_run).to install_package 'apache2'
    end

    it 'enables the apache2 service' do
      expect(chef_run).to enable_service 'apache2'
    end

    it 'starts the apache2 service' do
      expect(chef_run).to start_service 'apache2'
    end
  end
end

# Uncomment below to use shared examples.

# shared_examples 'webserver_test' do |platform, version, package, service|
#   context "when run on #{platform} #{version}" do
#     let(:chef_run) do
#       runner = ChefSpec::ServerRunner.new(platform: platform, version: version)
#       runner.converge(described_recipe)
#     end
#
#     it 'converges successfully' do
#       expect { chef_run }.to_not raise_error
#     end
#
#     it "installs #{package}" do
#       expect(chef_run).to install_package package
#     end
#
#     it "enables the #{service} service" do
#       expect(chef_run).to enable_service service
#     end
#
#     it "starts the #{service} service" do
#       expect(chef_run).to start_service service
#     end
#   end
# end
#
# describe 'webserver_test::default' do
#   platforms = {
#     'centos' => ['7.3.1611', 'httpd', 'httpd'],
#     'ubuntu' => ['14.04', 'apache2', 'apache2']
#   }
#
#   platforms.each do |platform, platform_data|
#     include_examples 'webserver_test', platform, *platform_data
#   end
# end
