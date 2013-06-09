require_relative '../../lib/gigpress_tour_date_parser'
require 'csv'
# require 'spec_helper'

describe Gigpress::TourDateParser do
  let(:klass) { Gigpress::TourDateParser }

  subject { klass.read("gigpress-export-2013-06-08.csv")}

  it { should_not be_nil }
end
