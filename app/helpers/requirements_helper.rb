module RequirementsHelper
  def img_of_proof_for(requirement, placeholder=false)
    filepicker_image_tag src_for_img_of_proof_for(requirement, placeholder), {w: 320, h: 320, fit: 'clip'}, {id: "#{requirement.name.gsub(/\./, "-")}-image"}
  end

  def src_for_img_of_proof_for(requirement, placeholder=false)
    placeholder ? "" : requirement.proof_for(current_user).filepicker_url
  end
end
