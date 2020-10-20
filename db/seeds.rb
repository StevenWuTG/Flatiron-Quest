require 'pry'
User.destroy_all
Quest.destroy_all
Monster.destroy_all
Support.destroy_all

#user data
# mary = User.create(user_name: "Mary", user_password: "Apples")
# steven = User.create(user_name: "Steven", user_password: "Oranges")

#quest data
# codechallenge = Quest.create(quest_name: "Code Challenge", quest_level: 7)
# project = Quest.create(quest_name: "Mod 1 Project", quest_level: 10)
modcomplete = Quest.create(quest_name: "Mod 1 Complete!", quest_level: 1)

#monster data
envsetup = Monster.create(mon_name: "Environment Set-up",mon_health: 3,mon_attack: 1)

intro_oo = Monster.create(mon_name: "Intro to Object Orientation",mon_health: 4,mon_attack: 2)

more_oo = Monster.create(mon_name: "More Object Orientation!!",mon_health: 5,mon_attack: 1)

ass_lab = Monster.create(mon_name: "Associations One-to-many",mon_health: 5,mon_attack: 2)

ass_more = Monster.create(mon_name: "More Associations Many-to-Many",mon_health: 6,mon_attack: 1)

cc_practice = Monster.create(mon_name: "Mock Code Challenge",mon_health: 6,mon_attack: 2)

cc_mod1 = Monster.create(mon_name: "Mod1 Code Challenge",mon_health: 10,mon_attack: 3)

blog_talk = Monster.create(mon_name: "Blog Talk",mon_health: 4,mon_attack: 1)

ar_intro = Monster.create(mon_name: "ActiveRecord::Base Intro",mon_health: 6,mon_attack: 2)

ar_ass = Monster.create(mon_name: "ActiveRecord Associations",mon_health: 6,mon_attack: 2)

proj_intro = Monster.create(mon_name: "Project Week day 1",mon_health: 8,mon_attack: 2)

proj_2 = Monster.create(mon_name: "Project Week day 2",mon_health: 6,mon_attack: 5 )

proj_3 = Monster.create(mon_name: "Project Week day 3",mon_health: 7,mon_attack: 4)

proj_4 = Monster.create(mon_name: "Project Week day 4",mon_health: 12,mon_attack: 4)

proj_final = Monster.create(mon_name: "Project Presentation",mon_health: 3,mon_attack: 1)

#support data
rewatch = Support.create(support_name: "Rewatched today's lecture", support_health: 2, support_attack:5)

rest = Support.create(support_name: "Slept 8 hours", support_health: 5, support_attack:1)

participation = Support.create(support_name: "Paid attention and participated in lecture", support_health: 3, support_attack:4)

# office_hours = Support.create(support_name: "Went to office hours", support_health:0, support_attack:3)

sing = Support.create(support_name: "Sang and danced with Caryn before lecture", support_health:2, support_attack:0)

cats = Support.create(support_name: "Laughed at Caryn's cats during lecture", support_health:2, support_attack:4)

yoga = Support.create(support_name: "Practiced chair yoga", support_health:3, support_attack:0)

# fun = Support.create(support_name: "Mandatory fun", support_health:2, support_attack:0)

solutions = Support.create(support_name: "Copied solutions code", support_health:1, support_attack:4)

slack = Support.create(support_name: "Asked for help on Slack and studied with a cohort-mate", support_health:1, support_attack:4)

# friend = Support.create(support_name: "Studied with a cohort-mate", support_health:1, support_attack:4)

stack_over = Support.create(support_name: "Duck, duck, go-ed and found answers on Stack-Overflow", support_health:1, support_attack:3)

docs = Support.create(support_name: "Read Ruby docs!", support_health:5, support_attack:1)

michelle = Support.create(support_name: "Michelle's accent made me smile", support_health:3, support_attack:4)



#battle data
# battle1 = Battle.create(battle_name: "Mary vs. Code Challenge", user_id: mary.id, quest_id: codechallenge.id, monster_id: intro_oo.id, support_id: rewatch.id)




# envbattle = Battle.create()
# binding.pry

