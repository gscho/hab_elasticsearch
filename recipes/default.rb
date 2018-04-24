#
# Cookbook:: hab_elasticsearch
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
hab_install

hab_sup 'default' do
  hab_channel 'stable'
end

hab_package 'core/elasticsearch'

hab_service 'core/elasticsearch' do
  strategy 'rolling'
  channel :stable
  action [:load, :start]
end

hab_config 'elasticsearch.default' do
  config({
    cluster: {
      name: 'foobar',
    },
    network: {
      host: '_local_',
    },
  })
end
