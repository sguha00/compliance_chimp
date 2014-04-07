class ImagesController < ApplicationController
  def destroy
    image_url = params[:image_url]
    complete_delete_url = image_url + "?key=#{ENV["FILEPICKER_API_KEY"]}"
    HTTParty.delete(complete_delete_url)
    redirect_to requirements_url, notice: message
  end

  private

  def message
    @message ||= params[:message].present? ? params[:message] : 'Unsaved image has been successfully removed from filepicker service.'
  end
end
