# Installs the habitat binary
hab_install

systemd_unit 'hab-supervisor.service' do
  content <<-EOF.gsub(/^\s+/, '')
  [Unit]
  Description=Habitat Supervisor

  [Service]
  ExecStart=/bin/hab sup run --peer #{node['ipaddress']}
  Restart=on-failure
  LimitNOFILE=#{node['es']['no_file']}

  [Install]
  WantedBy=default.target
  EOF

  action [:create, :enable, :restart]
end
