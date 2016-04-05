require 'serverspec'

# Required by serverspec
set :backend, :exec

describe file('/usr/bin/perf') do
  it { should be_executable }
end

describe file('/opt/flamegraph/stackcollapse-perf.pl') do
  it { should be_executable }
end

describe file('/tmp/perf.data') do
  it { should be_file }
end
describe file('/tmp/out.svg') do
  it { should be_file }
end


