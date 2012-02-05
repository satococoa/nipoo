# coding: utf-8
require 'spec_helper'

describe Comment do
  describe '.create' do
    let(:comment) { Fabricate :comment }
    subject { comment }
    context 'パラメータが正しい時' do
      it { should be_valid }
    end
    context '本文が空の時' do
      before do
        comment.body = ''
      end
      it { should_not be_valid }
    end
  end
  describe '#destroy' do
    let(:comment) { Fabricate :comment }
    subject { Comment.where(comment.id).first }
    context '日報が削除された時' do
      before do
        comment.report.destroy
      end
      it { should be_nil }
    end
    context 'ユーザーが削除された時' do
      before do
        comment.user.destroy
      end
      it { should be_nil }
    end
  end
end
