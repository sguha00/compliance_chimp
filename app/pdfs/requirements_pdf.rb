require "open-uri"
class RequirementsPdf < Prawn::Document
  def initialize requirements, view
    super top_margin: 20, page_layout: :landscape
    @requirements = requirements
    @view = view
    header
    move_down 10
    requirements_table
  end

  def header
    text "Current PCI Assessment for QSA - #{@view.current_user.name_and_email}"
    move_down 10
    font_size 10 do
      text "Edited on #{@view.l(Time.now)}"
    end
  end

  def requirements_table
    data = [].tap do |data|
      data << ["#", "Description", "Note", {content: "Proof", colspan: 2}, "Updated"]
    end
    @requirements.each do |req|
      data << [req.name, req.description, proof_of(req).try(:note), image_for_proof(req), link_for_image_of_proof_of(req), timestamp_for_proof_of(req)]
    end

    font_size 10 do
      table data, header: true, column_widths: {0 => 40, 1 => 150, 2 => 150, 3 => 250}, cell_style: { inline_format: true }
    end
  end

  def proof_of(requirement)
    requirement.proof_for(@view.current_user)
  end

  def timestamp_for_proof_of(requirement)
    proof_of(requirement) ? @view.time_ago_in_words(proof_of(requirement).updated_at) : ""
  end

  def link_for_image_of_proof_of(requirement)
    proof_of(requirement) ? "<link href='#{proof_of(requirement).filepicker_url}'><u><color rgb='0000FF'>LINK</color></u></link>" : ""
  end

  def image_for_proof(requirement)
    proof_of(requirement) ? {image: open(proof_of(requirement).filepicker_url), scale: 0.15} : ""
  end
end
