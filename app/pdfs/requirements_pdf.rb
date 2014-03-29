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
    text "Current PCI Assessment for QSA"
  end

  def requirements_table
    data = [].tap do |data|
      data << ["#", "Description", "Note", {content: "Proof", colspan: 2}]
    end
    @requirements.each do |req|
      data << [req.name, req.description, proof_of(req).try(:note), image_for_proof(req), link_for_image_of_proof_of(req)]
    end

    font_size 10 do
      table data, header: true, column_widths: {0 => 40, 2 => 100, 3 => 150, 4 => 60}, cell_style: { inline_format: true }
    end
  end

  def proof_of(requirement)
    requirement.proof_for(@view.current_user)
  end

  def link_for_image_of_proof_of(requirement)
    link = proof_of(requirement).try(:filepicker_url)
    link ? "<link href='#{link}'><u><color rgb='0000FF'>LINK</color></u></link>" : ""
  end

  def image_for_proof(requirement)
    proof_of(requirement) ? {image: open(proof_of(requirement).try(:filepicker_url)), scale: 0.1} : ""
  end
end
