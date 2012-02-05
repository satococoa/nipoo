# coding: utf-8
require 'spec_helper'

describe Report do
  describe '.create' do
    let(:report) { Fabricate :report }
    subject { report }
    context 'パラメータが正しいとき' do
      it { should be_valid }
    end
    context '本文が空の時' do
      before do
        report.body = ''
      end
      it { should_not be_valid }
    end
    context '日付が空の時' do
      before do
        report.date = nil
      end
      it { should_not be_valid }
    end
  end
  describe '.latest_date' do
    subject { Report.latest_date }
    before do
      Fabricate(:report, :date => '2012-01-01')
    end
    context '2012-01-01 の日報だけがあるとき' do
      it { should == Date.parse('2012-01-01') }
    end
    context 'さらに 2012-01-02 の日報があるとき' do
      before do
        Fabricate(:report, :date => '2012-01-02')
      end
      it { should == Date.parse('2012-01-02') }
    end
  end
  describe '#destroy' do
    let(:report) { Fabricate :report }
    subject { Report.where(report.id).first }
    context 'ユーザーが削除された時' do
      before do
        report.user.destroy
      end
      it { should be_nil }
    end
  end
end
