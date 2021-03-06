require "spec_helper"

describe "homebrew" do
  let(:facts) { default_test_facts }

  let(:dir) { facts[:homebrew_root] }
  let(:cmddir) { "#{dir}/Homebrew/Library/Taps/boxen/homebrew-brews/cmd" }

  it do
    should contain_exec("install homebrew to #{dir}/Homebrew").with({
      :cwd => "#{dir}/Homebrew",
      :user => 'testuser',
      :creates => "#{dir}/Homebrew/.git"
    })

    ["ldflags.sh", "cflags.sh", "homebrew.sh"].each do |f|
      should contain_file("/test/boxen/env.d/#{f}").
        with_ensure(:absent)
    end

    should contain_boxen__env_script("homebrew")

    should contain_file("#{dir}/lib").with_ensure("directory")
    should contain_file(cmddir).with_ensure("directory")
    should contain_file("#{dir}/Homebrew/Library/Taps").with_ensure("directory")
    should contain_file("/test/boxen/cache/homebrew").with_ensure("directory")
  end
end
