require "spec_helper"

describe "homebrew" do
  let(:facts) { default_test_facts }

  let(:dir) { facts[:homebrew_root] }
  let(:cmddir) { "#{dir}/Library/Taps/boxen/homebrew-brews/cmd" }

  it do
    should contain_exec("install homebrew to #{dir}").with({
      :cwd => dir,
      :user => 'testuser',
      :creates => "#{dir}/.git"
    })

    should contain_boxen__env_script("homebrew")

    should contain_file("#{dir}/lib").with_ensure("directory")
    should contain_file(cmddir).with_ensure("directory")
    should contain_file("#{dir}/Library/Taps").with_ensure("directory")
    should contain_file("/test/boxen/cache/homebrew").with_ensure("directory")
  end
end
