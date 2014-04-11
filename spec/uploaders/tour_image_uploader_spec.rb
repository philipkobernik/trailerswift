require 'spec_helper'
require 'carrierwave/test/matchers'

describe TourImageUploader do
  include CarrierWave::Test::Matchers

  let(:tour) { create :tour }
  let(:test_image_path) { File.join(Rails.root, 'public', 'images', 'tour_image_test.jpg') }

  before do
    TourImageUploader.enable_processing = true
    @uploader = TourImageUploader.new(tour, :tour_image)
    @uploader.store!(File.open(test_image_path))
  end

  after do
    TourImageUploader.enable_processing = false
    @uploader.remove!
  end

  context 'the thumb version' do
    it "should scale down a landscape image to be exactly 183 by 64 pixels" do
      @uploader.thumb.should be_no_larger_than(183, 183)
    end
  end

  context 'the small version' do
    it "should scale down a landscape image to fit within 200 by 200 pixels" do
      @uploader.small.should be_no_larger_than(300, 300)
    end
  end
end
