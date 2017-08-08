require "rails_helper"

describe Subtitle do

  describe "#convert_subtitle_file_to_text" do

    it "returns the correct file" do
      original_file = File.open("spec/support/EN-HUMAN.txt")
      output_file = Subtitle.convert_subtitle_file_to_text(original_file)
      expect(IO.read(output_file)).to eq(IO.read(original_file))
      File.delete(output_file)
    end
  end 

  describe "#get_new_file_name" do
    it "returns to the expected name after the files gets processed" do
      original_file = File.open("spec/support/EN-HUMAN.txt")
      expect(Subtitle.get_new_file_name(original_file)).to eq("EN-HUMAN.txt")
    end
  end
end