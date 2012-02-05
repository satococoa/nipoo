# coding: utf-8
require 'spec_helper'

describe "Comments" do
  let(:user) { Fabricate :user }
  let!(:report) { Fabricate :report, :user => user }
  let!(:comment) { Fabricate :comment, :user => user, :report => report }
  before do
    login_as user
  end
  it 'コメントが表示される' do
    visit '/'
    page.body.should match(/#{comment.body}/)
  end
end
