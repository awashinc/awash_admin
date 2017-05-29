# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


if User.where(username: "admin").blank?
  user = User.new(username: "admin", phone: "010-0000-0000", email: "admin@admin.com", email1: nil, user_status: 0, user_level: 99)
  user.password = "admin1!"
  user.password_confirmation = "admin1!"
  user.save
end

family_name_list = %w(김 이 박 최 정 강 조 윤 장 임)

name_list = %w(은교 은영 은혜 은희 은서 은선 은정 은설 은율 은예 은영 은주 은솔 은오 은우 은지 은하 은채 
은희 은후 은세 혜린 혜선 혜수 혜은 혜연 혜영 혜윤 혜인 혜리 혜림 혜주 혜진 혜정 혜선 혜율 혜솔 혜슬 
재아 재연  재영 재은 재현 재율 재희 재민 재빈 대언 대연 대영 대원 대윤 대은 대율 대인 
대한 대현 대형 대환 대훈 대경 대권 대규 대융 대우 대후 은재 은준 은찬 은진 이준 이찬 
하준 하진 효준 효찬 효재 영재 영찬 영준 원찬 세연 세영 세은 세완 세원 세윤 세현 세훈 
세호 세후 세율 세희 세한 세일 세혁 세준 세진 세민 세빈 세영) 
 
email_list = %w(legendre nosiness nembutsu cinerama townwear gutsiest lazarist intonaco 
caulonia hoariest prealtar revealer overable nonlocal craniums clinical erodible faceable 
monogeny handcuff masthead marchese cheerier surmount lineally vocalize assuaged larruper 
eastmost spurrite annealer skiatron amnesiac cannabic topotype injector seascout horniest 
kynewulf paltrily slopping equitant mannikin desulfur overkick unhuddle ligulate weftwise boulogne photomap)
  
begin
  (1..10).each do
    user1 = User.new(username: "#{family_name_list.sample}#{name_list.sample}", phone: "010-#{rand(9999).to_s.rjust(4,'0')}-#{rand(9999).to_s.rjust(4,'0')}", \
              email: "#{email_list.sample}#{rand(100)}@awash.com", email1: nil, \
              wash_offer: rand(2), wash_offer_memo: nil)
    user1.password = "user1!"
    user1.password_confirmation = "user1!"
    user1.save
  end
rescue
end 


car_manu_list = %w[폭스바겐 아우디 벤틀리 BMW BMW미니 벤츠 포르쉐 인피티니 르노삼성 도요타 현대자동차 기아자동차 
렉서스  재규어 랜드로버 페라리 마세라티 쉐보레 
다이하쓰 사이언 닛산 람보르기니 포드 링컨 푸조 시트로엥 혼다 어큐라 롤스로이스 스마트 
크라이슬러 마이바흐 닷지 지프 마쓰다 타타자동차 세코다 부가티 세아트 캐딜락 뷰익 오펠 복스홀 홀덴
]

ActiveRecord::Base.connection.execute('TRUNCATE car_manufacturers ')
car_manu_list.each do |name|
  CarManufacturer.create(manufacturer_name: name)
end

car_list = %w(BMW미니쿠페 BMWM3 BMW530D 재규어XF 볼보XC90 포르쉐까레라911 마이바흐 아우디A7 벤츠S65 
포르쉐파나메라 아우디A6 마세라티 BMW120d 포르쉐파나메라 BMW520D 레인지로버 제네시스 재규어 BMW640d 벤츠E300 
포르쉐까이엔느 포르쉐까레라 그랜드카니발 BMWx4 제네시스 신형 포르쉐박스터 포드익스플로러 랜드로버디스커버리3 아우디Q7 제네시스)

(1..20).each do

  now = Time.now
  a_day_ago = now - 60 * 60 * 24
  random_time = rand(a_day_ago..now).strftime("%H:00") 

  car = Car.new(user_id: User.where.not(username: "admin").sample.id, car_name: car_list.sample, car_number: "#{rand(99).to_s.rjust(2,'0')}구 #{rand(99).to_s.rjust(4,'0')}", \
              car_manufacturer_id: CarManufacturer.all.sample.id , spot: "세차 지역", \
              issue: "깨끗하게", service_day: rand(6), service_time: random_time, service_etc: "세차 참고 사항")
  car.save

end

service_list = %w("내외부 왁스 유막제거 발수코팅 내부 외부)

(1..20).each do

  yester = Time.now - 1.day
  a_day_ago = yester - 60 * 60 * 24
  random_time = rand(a_day_ago..yester)

  wash  = Washing.new(user_id: User.where.not(username: "admin").sample.id,\
                      car_id: Car.sample.id, washer_id: 1, \
                      wash_date: random_time, washer_comment: "누구와함께 또는 세차참고사항", \
                      service_part: service_list.sample,\
                      start_time: random_time, end_time: random_time + 2.hours, feedback: "고객 피드백")
  wash.save
  (1..rand(20)).each do
    user_id = 1
    user_id = wash.user_id if rand(100) % 2 == 0
    wash.washing_comments.create(user_id: user_id, comment: "세차에 대한 코멘트들")
  end

end


Car.all.each do |car|

  (0..rand(10)).each do

    price = %w[ 100000, 150000 300000]

    yester = Time.now - 1.day
    a_day_ago = yester - 60 * 60 * 24
    random_time = rand(a_day_ago..yester)

    payment = car.payments.new(user_id: car.user_id, payment_date: random_time, payment_price: price.sample, memo: "Recharge")
    payment.save

  end
end


Chat.new(title: "Chatting").save
 
strs  = ["Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Morbi leo risus, porta ac consectetur ac, vestibulum at eros",\
         "Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus",\
         "Aenean lacinia bibendum nulla sed consectetur. Etiam porta sem malesuada magna mollis euismod. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa",\
         "Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean lacinia bibendum nulla sed consectetur. Etiam porta sem malesuada magna mollis euismod. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus",\
         "Donec ullamcorper nulla non metus auctor fringilla. Nulla vitae elit libero, a pharetra augue",\
         "Cras mattis consectetur purus sit amet fermentum. Sed posuere consectetur est at lobortis",\
         "Curabitur blandit tempus porttitor. Nullam quis risus eget urna mollis ornare vel eu leo. Nullam id dolor id nibh ultricies vehicula ut id elit",\
         "Etiam porta sem malesuada magna mollis euismod. Cras mattis consectetur purus sit amet fermentum. Aenean lacinia bibendum nulla sed consectetur"
]
(1..10).each do

  Chat.first.messages.new(user: User.first, content: strs.sample).save

end



