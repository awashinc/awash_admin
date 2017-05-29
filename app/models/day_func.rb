module DayFunc
  DAY_LIST = %w[일요일 월요일 화요일 수요일 목요일 금요일 토요일]
  def to_wday(day)
    DayFunc::DAY_LIST[day] if day.present?
  end
end
