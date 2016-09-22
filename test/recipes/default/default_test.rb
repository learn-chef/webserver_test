describe package 'httpd' do
  it { should be_installed }
end

describe service 'httpd' do
  it { should be_enabled }
  it { should be_running }
end

describe command 'curl localhost' do
  its('stdout') { should match /hello/ }
end

describe port 80 do
  it { should be_listening }
end
