# # encoding: utf-8

# Inspec test for recipe hab_elasticsearch::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

[9200,9631,9638, 5601].each do |num|
  describe port(num) do
    it { should be_listening }
  end
end

describe command('/bin/hab sup -h') do
  its(:stdout) { should match(/The Habitat Supervisor/) }
end

describe file('/bin/hab') do
  it { should exist }
  it { should be_symlink }
end

describe directory('/hab/pkgs/gscho/elasticsearch') do
  it { should exist }
end

describe file('/hab/sup/default/specs/elasticsearch.spec') do
  it { should exist }
  its(:content) { should match(/^desired_state = "up"$/) }
end
