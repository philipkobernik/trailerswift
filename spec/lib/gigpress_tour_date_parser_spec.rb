require_relative '../../lib/gigpress_tour_date_parser'
require 'csv'
# require 'spec_helper'

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
    subject { klass.read("test.csv").last }

    its ([:lat]){ should == 23.1234567 }
    its ([:lng]){ should == -129.7654321 }
  end
end
