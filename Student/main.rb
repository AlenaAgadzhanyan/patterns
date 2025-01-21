require './entities/student.rb'
require './entities/student_short.rb'
require './student_tree.rb'
require './data_list/data_list.rb'
require './data_list/data_list_student_short.rb'
require './db/postgre.rb'

# student1 = Student.new(surname: "Агаджанян", firstname: "Алёна", lastname: "Самвеловна", id: 1, phone_number: "81234567895", telegram: "@alena", email: "agadzhanyan_alyona@mail.ru", git: "github.com/AlenaAgadzhanyan", birth_date: "2004.06.10")
# student2 = Student.new(surname: "аникин", firstname: "марк", lastname: "андреевич", id: 2,  telegram: "@mark333", phone_number: "89235614578", email: "anikin_mark@gmail.com", git: "github.com/Corray333", birth_date: "2002.10.12")
# student3 = Student.new(surname: "Иванов", firstname: "Иван", lastname: "Иванович", id: 3,  telegram: "@ivan123", phone_number: "89052654878", email: "ivanov_ivan@mail.ru", git: "github.com/Ivan2341", birth_date: "2010.12.12")

# student1.to_s()
# student2.to_s()
# puts student2.getInfo()
# st_short = Student_short.from_string(1, "fio: Аникин М.А., git: github.com/Corray333, contact: 89235614578")
# st_short3 = Student_short.from_string(3, student1.getInfo())
# st_short2 = Student_short.from_student(student2)

# tree = StudentTree.new(student1)
# tree.add(student2)
# tree.add(student3)

# tree.each{|student| puts student.to_s}

# test = DataListStudentShort.new([
#   Student_short.new(id:1, fio:"Ivanov I. I.", contact:"ivanov227@gmail.com",  git:"github.com/ivanov"),
#   Student_short.new(id:2, fio:"Petrov P. P.", contact:"@test_tgk",  git:"github.com/wsed4"),
#   Student_short.new(id:3, fio:"Sidorov S. S.", contact:"89320509129",  git:"github.com/dhy49")
# ])

# puts test.get_data().get_element(0, 2) 
# test.select(1)
# test.select(2)
# test.get_selected.each { |item| puts item.to_s }

client = PG_client.new
client.exec("select * from students;").each { |row| puts row }