require 'csv'
require 'spec_helper'

describe Gigpress::TourDateParser do
  let(:klass) { Gigpress::TourDateParser }
  let(:fixture_file) { File.open(File.join(Rails.root, 'db', 'tour_dates', 'test.csv')) }
  let(:result) { klass.read(fixture_file) }

  context "parsing date time" do
    subject { result.first[:date] }

    it { should be_a_kind_of(DateTime)}
    its (:hour){ should == 13 }
    its (:minute){ should == 42 }
    its (:second){ should == 11 }
  end

  context 'parsing venue' do
    subject { result.first[:venue] }
    it { should eq('The Capitol Hill Block Party') }
  end

  context "when lat and lng are present" do
    context 'when lat and lng are in one field' do
      subject { result[2] }

      its ([:lat]){ should == 23.1234567 }
      its ([:lng]){ should == -129.7654321 }

    end
    context 'when lat and lng are in seperate cells' do
      subject { result[3] }

      its ([:lat]){ should == 23.12 }
      its ([:lng]){ should == -129.76 }

    end
  end
end
