require 'spec_helper'

describe 'base' do

  it 'has a running service of sshd' do
    expect(service('sshd')).to be_running
  end

end