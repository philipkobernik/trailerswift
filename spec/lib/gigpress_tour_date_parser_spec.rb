require 'csv'
require 'spec_helper'

describe Gigpress::TourDateParser do
  let(:klass) { Gigpress::TourDateParser }

  subject { klass.read("test.csv")}

  it { should_not be_nil }

  context "parsing date time" do
    subject { klass.read("test.csv").first[:date] }

    specify { klass.read("test.csv").first[:venue].should == "The Capitol Hill Block Party" }

    it { should be_a_kind_of(DateTime)}
    its (:hour){ should == 13 }
    its (:minute){ should == 42 }
    its (:second){ should == 11 }

  end

  context "when lat and lng are present" do
    context 'when lat and lng are in one field' do
      subject { klass.read("test.csv")[2] }

      its ([:lat]){ should == 23.1234567 }
      its ([:lng]){ should == -129.7654321 }

    end
    context 'when lat and lng are in seperate cells' do
      subject { klass.read("test.csv")[3] }

      its ([:lat]){ should == 23.12 }
      its ([:lng]){ should == -129.76 }

    end
  end
end
