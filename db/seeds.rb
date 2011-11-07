# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

BugCategory.create(:name=>'User Requirements', :description=>'Bugs in the UR, gathering, planning, translations, and etc.')
BugCategory.create(:name=>'Functional Specifications', :description=>'Bugs in the functional specs and related documents.')
BugCategory.create(:name=>'UI Component', :description=>'Bugs in the User Interface components.')
BugCategory.create(:name=>'Data Consistency', :description=>'Bugs with regards to data consistencies, integrity, proper locking and unlocking.')
BugCategory.create(:name=>'Logic', :description=>'Bugs concerning incorrect arithmetic, functional, and logical results.')
BugCategory.create(:name=>'Performance', :description=>'Bugs concerning the speed, efficiency and managed resources.')
BugCategory.create(:name=>'Security', :description=>'Bugs concerning the safety, and security, including SQL injections, and malicious scripts, to name a few.')
BugCategory.create(:name=>'Dependency', :description=>'Bugs caused by other bugs, fixed or not.')
BugCategory.create(:name=>'Others', :description=>'Other bugs not on this list.')

Role.create(:name=>'Developer', :description=>'Programmer')
User.create(:user_name=>'greenlover1991', :password=>'SCtheapuh', :password_confirmation=>'SCtheapuh', :screen_name=>'Steven Go', :email=>'greenlover1991@yahoo.com', :role_id=>1)


