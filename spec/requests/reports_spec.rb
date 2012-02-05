# coding: utf-8
require 'spec_helper'

describe "Reports" do
  context 'ログインしていないとき' do
    describe '/' do
      it 'ログイン画面' do
        visit '/'
        page.body.should match(/Login/)
      end
    end
  end
  context 'ログイン後の時' do
    let(:user) { Fabricate :user }
    before do
      login_as user
    end
    it '日報一覧画面' do
      visit '/'
      page.body.should match(/Listing reports/)
    end
    let!(:report) { Fabricate :report, :user => user }
    before do
      login_as user
    end
    it '日報が表示される' do
      visit '/'
      page.body.should match(/#{report.body}/)
    end
  end
end
