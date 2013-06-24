require 'spec_helper'

describe Location do
  context "::within_blacklist_hours?" do
    subject { Location.within_blacklist_hours? }

    context "when blacklist hours are 19:00 - 09:00" do
      before do
        Settings.stub_chain(:tracking_blacklist, :start) { "19:00" }
        Settings.stub_chain(:tracking_blacklist, :end) { "09:00" }
      end

      context "when TZ offset is -4 hours" do
        before do
          Settings.stub(:current_utc_offset) { -4 }
        end
        context "when utc time is 22:59" do
          before do
            Time.stub_chain(:now, :utc) { Time.utc(2013, 6, 24, 22, 59) }
          end

          it { should be_false }
        end

        context "when utc time is 23:00" do
          before do
            Time.stub_chain(:now, :utc) { Time.utc(2013, 6, 24, 23, 01) }
          end

          it { should be_true }
        end

        context "when utc time is 12:59" do
          before do
            Time.stub_chain(:now, :utc) { Time.utc(2013, 6, 24, 12, 59) }
          end

          it { should be_true }
        end

        context "when utc time is 13:00" do
          before do
            Time.stub_chain(:now, :utc) { Time.utc(2013, 6, 24, 13, 00) }
          end

          it { should be_false }
        end

      end
    end
  end
end