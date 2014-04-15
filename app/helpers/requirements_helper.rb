module RequirementsHelper
  def screenshot_for(requirement, placeholder = false)
    filepicker_image_tag screenshot_url_for(requirement, placeholder), { w: 320, h: 320, fit: 'clip' }, id: "#{requirement.dashed_name}-image"
  end

  def screenshot_url_for(requirement, placeholder = false)
    placeholder ? '' : requirement.proof_for(current_user).filepicker_url
  end
end
