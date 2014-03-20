class Requirement
  include Mongoid::Document
  field :name, type: String
  field :description, type: String
  has_many :proofs

  def self.fulfillment_chart_for(user)
    LazyHighCharts::HighChart.new('pie') do |chart|
      chart.options[:chart][:defaultSeriesType] = "pie"
      chart.options[:chart][:height] = 210
      chart.options[:title][:text] = "PCI Requirements"
      chart.plot_options(pie: {
        dataLabels: {format: "<strong>{point.name}</strong>: {point.percentage:.lf} %"}
      })
      chart.series({
                     name: 'Total',
                     data: complete_and_incomplete_series_for(user)
                   })
    end
  end

  def self.complete_and_incomplete_series_for(user)
    RequirementSeries.new(user).render
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
    (n.to_f / total) * 100
  end

  def total
    Requirement.count
  end
end
