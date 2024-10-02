require './class_student.rb'

student1 = Student.new(surname: "Агаджанян", firstname: "Алёна", lastname: "Самвеловна", id: 1, phone_number: "81234567895", telegram: "@alena", email: "agadzhanyan_alyona@mail.ru", git: "github.com/AlenaAgadzhanyan")
student2 = Student.new(surname: "аникин", firstname: "марк", lastname: "андреевич", id: 2,  telegram: "@mark333", phone_number: "89235614578", email: "anikin_mark@gmail.com", git: "github.com/Corray333")

student1.to_s()
student2.to_s()
puts student2.getInfo()
st_short = Student_short.new(id: 1, data: "fio: Аникин М.А., git: github.com/Corray333, contact: 89235614578")
st_short = Student_short.new(id: 1, data: student1.getInfo())
st_short2 = Student_short.new(id: 2, student: student2)
