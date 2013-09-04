require 'spec_helper'

describe ApplicationHelper do
  describe "display_published_at" do
    it "displays Today if date is today" do
      expect(helper.display_published_at(DateTime.now).include? 'Today').to be_true 
    end

    it "displays Yesterday if date is yesterday" do
      expect(helper.display_published_at(1.day.ago).include? 'Yesterday').to be_true 
    end

    it "displays the short date format if date is before yesterday" do
      datetime = 2.days.ago
      expect(helper.display_published_at(datetime)).to eq(datetime.to_s(:short))
    end
  end
end
