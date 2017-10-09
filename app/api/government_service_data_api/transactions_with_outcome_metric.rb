class GovernmentServiceDataAPI::TransactionsWithOutcomeMetric
  include GovernmentServiceDataAPI::MetricStatus

  def self.build(data)
    data ||= {}

    new(
      count: data.fetch('total', NOT_APPLICABLE),
      count_with_intended_outcome: data.fetch('with_intended_outcome', NOT_APPLICABLE),
      completeness: data['completeness']
    )
  end

  def initialize(count: nil, count_with_intended_outcome: nil, completeness: nil)
    @count = count || NOT_PROVIDED
    @count_with_intended_outcome = count_with_intended_outcome || NOT_PROVIDED
    @completeness = completeness || {}
  end

  attr_reader :count, :count_with_intended_outcome, :completeness

  def not_applicable?
    [@count, @count_with_intended_outcome].all? { |item| item == NOT_APPLICABLE }
  end

  def not_provided?
    [@count, @count_with_intended_outcome].all? { |item| item == NOT_PROVIDED }
  end

  def with_intended_outcome_percentage
    return @count_with_intended_outcome if @count_with_intended_outcome.in? [NOT_PROVIDED, NOT_APPLICABLE]
    (@count_with_intended_outcome.to_f / @count) * 100
  end

  def not_with_intended_outcome
    if @count != NOT_PROVIDED && @count_with_intended_outcome != NOT_PROVIDED
      return @count - @count_with_intended_outcome if @count.positive? && @count_with_intended_outcome.positive?
    end
  end

  def not_with_intended_outcome_percentage
    not_outcome = not_with_intended_outcome
    return not_outcome.to_f if @count_with_intended_outcome.nil? || @count == NOT_PROVIDED

    (not_outcome.to_f / @count) * 100
  end
end
