class SubtitlesController < ApplicationController

  def process_subtitle_file
    if !params["subtitle_file"]
      redirect_to error_path
    else
      @original_file = params["subtitle_file"].tempfile
      output_file = Subtitle.convert_subtitle_file_to_text(@original_file)
      new_name = params["subtitle_file"].original_filename.split(".").first+ ".txt"

      send_data IO.read(output_file), filename: new_name,
                            type: "txt",
                            disposition: "attachment"
    end
  end
end