module RequirementsHelper
  def img_of_proof_for(requirement)
    content_tag(:img, nil, src: h(requirement.proof_for(current_user).image_url), class: "pull-left")
  end
end
