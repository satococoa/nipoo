# coding: utf-8
require 'spec_helper'

describe User do
  describe '#member?' do
    let(:user) { Fabricate :user }
    let(:organization) { 'organization' }
    subject { user.member?(organization) }
    context 'organizationのメンバーのとき' do
      before do
        Octokit.stub(:organization_members) { [Hashie::Mash.new({id: user.uid.to_i})] }
      end
      it { should be_true }
    end
    context 'organizationのメンバーではないとき' do
      before do
        Octokit.stub(:organization_members) { [Hashie::Mash.new({id: 1111})] }
      end
      it { should be_false }
    end
    context 'organizationの設定値が空の時' do
      let(:organization) { '' }
      it { should be_true }
    end
  end

  describe '#whitelisted?' do
    let(:user) { Fabricate :user }
    subject { user.whitelisted?(whitelist) }
    before do
      Settings.github.stub(:whitelist) { whitelist }
    end
    context 'whitelistが空の時' do
      let(:whitelist) { nil }
      it { should be_false }
    end
    context 'whitelistにuidが入っていないとき' do
      let(:whitelist) { 'xxxxxx' }
      it { should be_false }
    end
    context 'whitelistにuidが含まれるとき' do
      let(:whitelist) { "xxxxxx,#{user.uid}" }
      it { should be_true }
    end
  end
end
