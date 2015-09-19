module ApplicationHelper
  def formatted_date(date)
    date.strftime("%Y-%b-%d")
  end

  # This only formats MM-YYYY
  def format_month_year(date)
    date.strftime("%Y-%b")
  end

end
