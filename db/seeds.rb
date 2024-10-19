# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# frozen_string_literal: true

Started_test.destroy_all
Answer.destroy_all
Question.destroy_all
Test.destroy_all
Category.destroy_all
User.destroy_all

salads, soups, main_course =
  Category.create!([
                     { title: 'Салаты' },
                     { title: 'Первые блюда' },
                     { title: 'Вторые блюда' }
                   ])

pomich, nataly, maks =
  User.create!([
                 { name: 'Роман Александрович' },
                 { name: 'Наталия Валериевна' },
                 { name: 'Максим Дмитриевич' }
               ])

vegetable_salads, meat_salads, fruit_salads,
vegetable_soups, meat_soups, fish_soups,
vegetable_course, meat_course, fish_course =
  Test.create!([ # 1st line category
                 { title: 'Овощные салаты', level: 1, user_id: pomich.id, category_id: salads.id },
                 { title: 'Салаты с мясом', level: 1, user_id: nataly.id, category_id: salads.id },
                 { title: 'Фруктовые салаты', level: 1, user_id: maks.id, category_id: salads.id },
                 # 2nd line category
                 { title: 'Овощные супы', level: 2, user_id: pomich.id, category_id: soups.id },
                 { title: 'Супы с мясом', level: 2, user_id: nataly.id, category_id: soups.id },
                 { title: 'Супы с морепродуктами', level: 2, user_id: maks.id, category_id: soups.id },
                 # 3th line category
                 { title: 'Вегетарианские блюда', level: 3, user_id: pomich.id, category_id: main_course.id },
                 { title: 'Мясные блюда', level: 3, user_id: nataly.id, category_id: main_course.id },
                 { title: 'Блюда с рыбой', level: 3, user_id: maks.id, category_id: main_course.id }
               ])

# 1st line category
veg_salads_q1, veg_salads_q2,
meat_salads_q1, meat_salads_q2,
fruit_salads_q1, fruit_salads_q2,
# 2nd line category
veg_soups_q1, veg_soups_q2,
meat_soups_q1, meat_soups_q2,
fish_soups_q1, fish_soups_q2,
# 3th line category
veg_course_q1, veg_course_q2,
meat_course_q1, meat_course_q2,
fish_course_q1, fish_course_q2 =
  Question.create!([ # 1st line category
                     { body: 'Сколько листов айсберга требется в салат из 1 морковки и 1 белой редьки?', # one
                       test_id: vegetable_salads.id },
                     { body: 'Сколько грамм сыра нужно добавить в салат из 100г риса, 4 яиц, 1 банки кукурузы, 3 маринованых огурчика?', # 150 gramm
                       test_id: vegetable_salads.id },

                     { body: 'Сколько требуется моркови в классический домашний салат с зеленым горошком при 150 граммах колбасы и 1 банке зеленого горошка?', # no one
                       test_id: meat_salads.id },
                     { body: 'На cколько времени необходимо оставить остужаться салат с ананасами, овощами, ветчиной и яйцом?', # 2 hours
                       test_id: meat_salads.id },

                     { body: 'Какой сок добавляется в апельсиновый салат с курицей, фенхелем и гранатом?', # limon juice
                       test_id: fruit_salads.id },
                     { body: '3 столовые ложки чего добавляется в салат из маринованной свеклы с яблоками?', # roasted seeds (sunflower, pumpkin, sesame)
                       test_id: fruit_salads.id },
                     # 2nd line category
                     { body: 'Какой ингридиент добавляется в красный борщ из цветной капусты?', # red wine
                       test_id: vegetable_soups.id },
                     { body: 'Какой сыр лучше всего подходит для сливочного супа из брокколи с семечками?', # parvmezan
                       test_id: vegetable_soups.id },

                     { body: 'Что принято добавлять в восточный суп с рисом?', # chiken wings
                       test_id: meat_soups.id },
                     { body: 'С чем рекомендуется подавать мясной суп с луком пореем?', # with grenkies
                       test_id: meat_soups.id },

                     { body: 'Какого овоща нет в рецепте ароматного супа с лососем и овощами?', # all except carrots and leeks
                       test_id: fish_soups.id },
                     { body: 'Сколько порций супа из креветок по-польски получится из 6 картофелин и 230 грамм креветок?', # 5
                       test_id: fish_soups.id },
                     # 3s line category
                     { body: 'Какая крупа применяется в деревенской каше с овощами?', # perlovka
                       test_id: vegetable_course.id },
                     { body: 'Какое вино добавляется в ризотто с варенной свеклой?', # red dry wine
                       test_id: vegetable_course.id },

                     { body: 'В каких пропорциях добавляются чеснок и имбирь в курицу Кари?', # a little more garlic than ginger
                       test_id: meat_course.id },
                     { body: 'Какие грибы нужны в гуляше из дикого кабана с грибами?', # champignons
                       test_id: meat_course.id },

                     { body: 'Какая паста применяется в рецепте форели запеченной в апельсинах', # pasts meeso
                       test_id: fish_course.id },
                     { body: 'Какой перец добавляется в спагетти с тыквой и креветками?', # ground chili pepper
                       test_id: fish_course.id }
                   ])
Answer.create! ([ 
  {body: 'Один', correct: true, question_id: veg_salads_q1.id},
  {body: 'Два', correct: false, question_id: veg_salads_q1.id},
  {body: 'Три', correct: false, question_id: veg_salads_q1.id},
  {body: 'Ни одного', correct: false, question_id: veg_salads_q1.id},

  {body: '100 г', correct: false, question_id: veg_salads_q2.id},
  {body: '150 г', correct: true, question_id: veg_salads_q2.id},
  {body: '150 г', correct: false, question_id: veg_salads_q2.id},
  {body: '250 г', correct: false, question_id: veg_salads_q2.id},

  {body: '1 морковь', correct: false, question_id: meat_salads_q1.id},
  {body: '2 морковки', correct: false, question_id: meat_salads_q1.id},
  {body: '3 морковки', correct: false, question_id: meat_salads_q1.id},
  {body: 'Ни одной', correct: true, question_id: meat_salads_q1.id},

  {body: '30 минут', correct: false, question_id: meat_salads_q2.id},
  {body: '1 час', correct: false, question_id: meat_salads_q2.id},
  {body: '2 часа', correct: true, question_id: meat_salads_q2.id},
  {body: '3 часа', correct: false, question_id: meat_salads_q2.id},

  {body: 'Лимонный сок', correct: true, question_id: fruit_salads_q1.id},
  {body: 'Сок грэйпфрута', correct: false, question_id: fruit_salads_q1.id},
  {body: 'Яблочный сок', correct: false, question_id: fruit_salads_q1.id},
  {body: 'Гранатовый сок', correct: false, question_id: fruit_salads_q1.id},

  {body: 'Жаренные семечки', correct: false, question_id: fruit_salads_q2.id},
  {body: 'Конжутные семечки', correct: false, question_id: fruit_salads_q2.id},
  {body: 'Тыквенные семечки', correct: false, question_id: fruit_salads_q2.id},
  {body: 'Допускаются все варианты', correct: true, question_id: fruit_salads_q2.id}
])
# 2nd line category
veg_soups_q1_a1, veg_soups_q1_a2, veg_soups_q1_a3, veg_soups_q1_a4,
veg_soups_q2_a1, veg_soups_q2_a2, veg_soups_q2_a3, veg_soups_q2_a4,
meat_soups_q1_a1, meat_soups_q1_a2, meat_soups_q1_a3, meat_soups_q1_a4,
meat_soups_q2_a1, meat_soups_q2_a2, meat_soups_q2_a3, meat_soups_q2_a4,
fish_soups_q1_a1, fish_soups_q1_a2, fish_soups_q1_a3, fish_soups_q1_a4,
fish_soups_q2_a1, fish_soups_q2_a2, fish_soups_q2_a3, fish_soups_q2_a4 = 
Answer.create! ([
  {body: 'Вино белое', correct: false, question_id: veg_soups_q1.id},
  {body: 'Вино розовое', correct: false, question_id: veg_soups_q1.id},
  {body: 'Вино красное', correct: true, question_id: veg_soups_q1.id},
  {body: 'Ликер', correct: false, question_id: veg_soups_q1.id},

  {body: 'Пармезан', correct: true, question_id: veg_soups_q2.id},
  {body: 'Сливочный', correct: false, question_id: veg_soups_q2.id},
  {body: 'Гауда', correct: false, question_id: veg_soups_q2.id},
  {body: 'Королевский', correct: false, question_id: veg_soups_q2.id},

  {body: 'Куринные сердечки', correct: false, question_id: meat_soups_q1.id},
  {body: 'Куринные шкурки', correct: false, question_id: meat_soups_q1.id},
  {body: 'Куринные крылашки', correct: true, question_id: meat_soups_q1.id},
  {body: 'Куринные бедрышки', correct: false, question_id: meat_soups_q1.id},

  {body: 'С водочкой', correct: false, question_id: meat_soups_q2.id},
  {body: 'С салом', correct: false, question_id: meat_soups_q2.id},
  {body: 'С пампушками', correct: false, question_id: meat_soups_q2.id},
  {body: 'С гренками', correct: true, question_id: meat_soups_q2.id},

  {body: 'Морковь', correct: false, question_id: fish_soups_q1.id},
  {body: 'Огурец', correct: true, question_id: fish_soups_q1.id},
  {body: 'Лук', correct: false, question_id: fish_soups_q1.id},
  {body: 'Помидор', correct: false, question_id: fish_soups_q1.id},

  {body: '5 порций', correct: true, question_id: fish_soups_q2.id},
  {body: '6 порций', correct: false, question_id: fish_soups_q2.id},
  {body: '7 порций', correct: false, question_id: fish_soups_q2.id},
  {body: '8 порций', correct: false, question_id: fish_soups_q2.id}
])
# 3th line
veg_course_q1_a1, veg_course_q1_a2, veg_course_q1_a3, veg_course_q1_a4,
veg_course_q2_a1, veg_course_q2_a2, veg_course_q2_a3, veg_course_q2_a4,
meat_course_q1_a1, meat_course_q1_a2, meat_course_q1_a3, meat_course_q1_a4,
meat_course_q2_a1, meat_course_q2_a2, meat_course_q2_a3, meat_course_q2_a4,
fish_course_q1_a1, fish_course_q1_a2, fish_course_q1_a3, fish_course_q1_a4,
fish_course_q2_a1, fish_course_q2_a2, fish_course_q2_a3, fish_course_q2_a4 = 
Answer.create! ([
  {body: 'Пшено', correct: false, question_id: veg_course_q1.id},
  {body: 'Ячмень', correct: false, question_id: veg_course_q1.id},
  {body: 'Овсянка', correct: false, question_id: veg_course_q1.id},
  {body: 'Перловка', correct: true, question_id: veg_course_q1.id},

  {body: 'Розовое полусладкое вино', correct: false, question_id: veg_course_q2.id},
  {body: 'Красное полусладкое', correct: false, question_id: veg_course_q2.id},
  {body: 'Красное сухое вино', correct: true, question_id: veg_course_q2.id},
  {body: 'Белое сухое вино', correct: false, question_id: veg_course_q2.id},

  {body: 'Чеснока столько же сколько имбиря', correct: false, question_id: meat_course_q1.id},
  {body: 'Чеснока чуть больше чем имбиря', correct: true, question_id: meat_course_q1.id},
  {body: 'Имбиря чуть больше чем чеснока', correct: false, question_id: meat_course_q1.id},
  {body: 'Пропорции имбиря и чеснока не важны', correct: false, question_id: meat_course_q1.id},

  {body: 'Шампиньоны', correct: true, question_id: meat_course_q2.id},
  {body: 'Опята', correct: false, question_id: meat_course_q2.id},
  {body: 'Мышата', correct: false, question_id: meat_course_q2.id},
  {body: 'Любые грибы', correct: false, question_id: meat_course_q2.id},

  {body: 'Паста Песто', correct: false, question_id: fish_course_q1.id},
  {body: 'Паста Карбонара', correct: false, question_id: fish_course_q1.id},
  {body: 'Паста Мессо', correct: true, question_id: fish_course_q1.id},
  {body: 'Паста Конкилье', correct: false, question_id: fish_course_q1.id},

  {body: 'Молотый чили', correct: true, question_id: fish_course_q2.id},
  {body: 'Свежемолотый черный перец', correct: false, question_id: fish_course_q2.id},
  {body: 'Кайенский перец', correct: false, question_id: fish_course_q2.id},
  {body: 'Мелконарезанный халапеньо', correct: false, question_id: fish_course_q2.id}
])


pomich_users_tests = [{test_id: vegetable_salads.id},
                      {test_id: meat_soups.id},
                      {test_id: fish_course.id}]

nataly_users_tests = [{test_id: meat_salads.id},
                      {test_id: fish_soups.id},
                      {test_id: vegetable_salads.id}]

maks_users_tests = [{test_id: fruit_salads.id},
                    {test_id: vegetable_course.id},
                    {test_id: meat_salads.id}]

# pomich_exp1, pomich_exp2, 
pomich_exp3 = 
User.find(pomich.id).started_test.create(pomich_users_tests)

# nataly_exp1, nataly_exp2, 
nataly_exp3 = 
User.find(nataly.id).started_test.create(nataly_users_tests)

# maks_exp1, maks_exp2, 
maks_exp3 = 
User.find(maks.id).started_test.create(maks_users_tests)