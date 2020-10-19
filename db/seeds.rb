require 'pry'
User.destroy_all
Quest.destroy_all
Monster.destroy_all
Support.destroy_all

#user data
# mary = User.create(user_name: "Mary", user_password: "Apples")
# steven = User.create(user_name: "Steven", user_password: "Oranges")

#quest data
codechallenge = Quest.create(quest_name: "Code Challenge", quest_level: 7)
project = Quest.create(quest_name: "Mod 1 Project", quest_level: 10)
modcomplete = Quest.create(quest_name: "Mod 1 Complete!", quest_level: 14)

#monster data
envsetup = Monster.create(mon_name: "Env Set-up",mon_health: 3,mon_attack: 1,mon_level: 1)
intro_oo = Monster.create(mon_name: "Intro to OO",mon_health: 4,mon_attack: 2,mon_level: 2)

#support data
rewatch = Support.create(support_name: "Rewatched lecture")
rest = Support.create(support_name: "Slept 8 hours")

#battle data
# battle1 = Battle.create(battle_name: "Mary vs. Code Challenge", user_id: mary.id, quest_id: codechallenge.id, monster_id: intro_oo.id, support_id: rewatch.id)




# envbattle = Battle.create()
# binding.pry

