require 'spec_helper'

describe 'lincall' do
  let(:facts) do
    {
      osfamily: 'Debian'
    }
  end

  context 'with defaults for all parameters' do
    it { should contain_class('lincall') }
    it { should contain_file('/usr/share/applications/lincall.desktop') }
    it { should contain_file('/usr/bin/lincall') }
    it { should contain_package('desktop-file-utils') }
    it { should contain_exec('lincall update-desktop-database') }
  end
end
