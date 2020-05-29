require "spec_helper"

describe "homebrew" do
  let(:facts) { default_test_facts }

  let(:boxen_home) { facts[:boxen_home] }
  let(:homebrew_root) { facts[:homebrew_root] }

  it do
    should contain_class('boxen::config')
    should contain_class('homebrew::repo')

    should contain_file(homebrew_root).with_ensure('directory')
    should contain_file("#{homebrew_root}/lib").with_ensure('directory')
    should contain_file("#{homebrew_root}/var").with_ensure('directory')

    should contain_exec("install homebrew to #{homebrew_root}").with({
      :cwd     => homebrew_root,
      :user    => 'testuser',
      :creates => "#{homebrew_root}/.git"
    })

    should contain_file("#{boxen_home}/cache").with_ensure('directory')
    should contain_file("#{homebrew_root}/Library/Taps").with_ensure('directory')
    should contain_file("#{homebrew_root}/Library/Homebrew/cmd").with_ensure('directory')
    should contain_file("#{homebrew_root}/Library/Taps/boxen").with_ensure('directory')
    # brewsdir
    should contain_file("#{homebrew_root}/Library/Taps/boxen/homebrew-brews").with_ensure('directory')
    should contain_file("#{homebrew_root}/Library/Taps/boxen/homebrew-brews/cmd").with_ensure('directory')

    should contain_boxen__env_script('homebrew')
  end
end
