module RequirementsHelper
  def img_for_user_proof(requirement)
    proof = requirement.user_proof(current_user)
    content_tag(:img, nil, src: h(proof.image_url), class: "pull-left") if proof
  end
end
