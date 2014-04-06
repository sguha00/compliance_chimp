class Requirement
  include Mongoid::Document
  field :name, type: String
  field :description, type: String
  has_many :proofs

  def self.assessment_chart_for(user)
    LazyHighCharts::HighChart.new('pie') do |chart|
      chart.options[:chart][:defaultSeriesType] = "pie"
      chart.options[:chart][:height] = 210
      chart.options[:title][:text] = "PCI Requirements"
      chart.options[:chart][:backgroundColor] = '#ecf0f1'
      chart.plot_options(pie: {
        dataLabels: {format: "<strong>{point.name}</strong>: {point.percentage:.lf} %"}
      })
      chart.series({
                     name: 'Total',
                     data: completed_and_incompleted_for(user)
                   })
    end
  end

  def self.completed_and_incompleted_for(user)
    RequirementSeries.new(user).render
  end

  def description_extended
    description
  end

  %w(description_short has_children proof_type testing_procedure guidance).each do |method|
    define_method method do
      "dummy"
    end
  end

  def proof_for(user)
    proofs.where(user: user).first
  end
end

class RequirementSeries
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def render
    [["Complete", percentage(completes_count)], ["Incomplete", percentage(total - completes_count)]]
  end

  private

  def completes_count
    # since user can submit only one proof per requirement
    # to return the number of complete requirements
    # I'm using the user proofs count
    user.proofs_count
  end

  def percentage(n)
    ((n.to_f / total) * 100).round(1)
  end

  def total
    Requirement.count
  end
end
