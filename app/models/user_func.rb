module UserFunc

  STATUS_LIST = %w[미고객 예비고객(상품권) 예비고객(이벤트) 샵고객 버틀러]
  #WASHING_LIST = %w[이코노미(15외부) 스탠다드(20내외부) 충전식(3개월) 기타 취소] 
  WASHING_LIST = %w[버틀러(15외부) 기타 취소]
  GENDER_LIST = %w[무성 남 여]
  MARRIED_LIST = %w[미혼 기혼 재혼]

  LEVEL_LIST = {
    :"일반1" => 1,
    :"일반5" => 5,
    :"일반9" => 9,

    :"고객" => 11,
    :"중요 고객" => 15,
    :"극빈 고객" => 19,

    :"요원 일반" => 31,
    :"요원 관리" => 35,
    :"요원 총괄" => 39,

    :"어드민 일반" => 71,
    :"어드민 관리" => 75,
    :"어드민 총괄" => 79,

    :"개발 일반" => 91,
    :"개발 관리" => 95,
    :"개발 총괄" => 99
  }


  def to_status(status)
    return "" if status.blank?
    STATUS_LIST[status]
  end

  def to_wash_offer(offer)
    return "" if offer.blank?
    WASHING_LIST[offer]
  end

  def to_level(level)
    return "" if level.blank?
    LEVEL_LIST.key(level)
  end

  def to_gender_str(gender)
    gender = 0 if gender.blank?
    GENDER_LIST[gender]
  end

  def to_married_str(married)
    married = 0 if married.blank?
    MARRIED_LIST[married]
  end



end
