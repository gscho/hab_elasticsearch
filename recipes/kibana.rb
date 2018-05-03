include_recipe 'hab_elasticsearch::_install_hab'

# Loads and starts the kibana habitat package
hab_service 'core/kibana' do
  action [:load, :start]
  topology 'standalone'
  strategy 'at-once'
  bind 'elasticsearch:elasticsearch.cluster'
end
