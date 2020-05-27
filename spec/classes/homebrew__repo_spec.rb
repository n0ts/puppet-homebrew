require "spec_helper"

describe "homebrew::repo" do
  let(:facts) { default_test_facts }

  let(:dir) { "#{facts[:homebrew_root]}/Homebrew" }

  it do
    should contain_homebrew_repo(dir)
  end
end
