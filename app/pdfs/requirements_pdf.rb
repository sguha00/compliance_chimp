require "open-uri"
class RequirementsPdf < Prawn::Document
  def initialize requirements, view
    super top_margin: 20
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
      data << ["#", "Description", "Note", "Proof"]
    end
    @requirements.each do |req|
      data << [req.name, req.description, "", (req.proof_for(@current_user).nil? ? "" : {image: open(@view.src_for_img_of_proof_for(req))})]
    end

    font_size 10 do
      table data, header: true, column_widths: {0 => 40, 2 => 40, 3 => 40}
    end
  end
end
