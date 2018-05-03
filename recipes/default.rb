#
# Cookbook:: hab_elasticsearch
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
include_recipe 'hab_elasticsearch::_install_hab'

# Loads and starts the elasticsearch habitat package
hab_service 'gscho/elasticsearch' do
  action [:load, :start]
  topology 'leader'
  strategy 'rolling'
  service_group 'cluster'
end

# Applies the port configuration to the cluster
hab_config 'elasticsearch.cluster' do
  config({
    network: {
      host: node['ipaddress'],
    },
    http: {
      port: node['es']['port'],
    },
  })
end
