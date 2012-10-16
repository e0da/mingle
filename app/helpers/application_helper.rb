module ApplicationHelper
  def month_and_year(date)
    "#{Date::MONTHNAMES[date.month]} #{date.year}"
  end
end
