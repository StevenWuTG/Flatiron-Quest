require 'pry'
User.destroy_all
Quest.destroy_all
Monster.destroy_all
Support.destroy_all

#user data
# mary = User.create(user_name: "MARY", user_password: "mary", user_health: 1000, user_attack: 1000)
)
steven = User.create(user_name: "STEVEN", user_password: "steve", user_health: 1000, user_attack: 1000)

#quest data
codechallenge = Quest.create(quest_name: "Code Challenge")#id 1

mod1complete = Quest.create(quest_name: "Mod 1 Project")#id 2

#monster data
envsetup = Monster.create(mon_name: "Environment Set-up",mon_health: 3,mon_attack: 1,quest_id: codechallenge.id)

object_o = Monster.create(mon_name: "Object Orientation",mon_health: 4,mon_attack: 2,quest_id: codechallenge.id)

cc_practice = Monster.create(mon_name: "Mock Code Challenge",mon_health: 6,mon_attack: 2,quest_id: codechallenge.id)

cc_mod1 = Monster.create(mon_name: "Mod1 Code Challenge",mon_health: 10,mon_attack: 3,quest_id: codechallenge.id) #id 4

active_r = Monster.create(mon_name: "ActiveRecord::Base",mon_health: 6,mon_attack: 2,quest_id: mod1complete.id)

proj_week = Monster.create(mon_name: "Project Week",mon_health: 8,mon_attack: 2,quest_id: mod1complete.id)

proj_final = Monster.create(mon_name: "Project Presentation",mon_health: 13,mon_attack: 6,quest_id: mod1complete.id) #id  7



#support data

caryn = Support.create(support_name: "caryn",support_message: "Laughed at Caryn's cats during lecture", support_health:2, support_attack:2)

michelle = Support.create(support_name: "michelle",support_message: "Michelle's soothing voice made me smile", support_health:3, support_attack:1)

rest = Support.create(support_name: "rest", support_message: "Slept like rock...", support_health: 5, support_attack:1)

slack = Support.create(support_name: "slack",support_message: "Asked for help on Slack and studied with a cohort-mate", support_health:1, support_attack:3)

stack_over = Support.create(support_name: "stack_over",support_message: "Duck, duck, go-ed and found answers on Stack-Overflow", support_health:0, support_attack:4)

docs = Support.create(support_name: "docs",support_message: "Read Ruby docs! Who knew they would actually help!", support_health:1, support_attack:5)

solutions = Support.create(support_name: "solutions",support_message: "Copied solutions code... shhhhh...", support_health:3, support_attack:1)




# binding.pry

