class PeriodDecorator < ApplicationDecorator
  delegate_all

  def label
    h.t :period_label, months: months, years: years, scope: :date
  end

  def start_at
    localize_date object.start_at
  end

  def end_at
    localize_date object.end_at
  end

  protected

  def months
    @months ||= max_and_min.
      map { |date| h.l(date, format: :month_name) }.
      uniq.join '/'
  end

  def years
    @years ||= max_and_min.
      map(&:year).
      uniq.join '/'
  end

  def max_and_min
    @max_and_min ||= [range.min, range.max]
  end

  def localize_date(date)
    h.l date, format: :short
  end
end
