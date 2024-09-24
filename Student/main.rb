require './class_student.rb'

student1 = Student.new(surname: "Агаджанян", firstname: "Алёна", lastname: "Самвеловна", id: 1, phone_number: "81234567895", telegram: "@alena", email: "agadzhanyan_alyona@mail.ru", git: "github.com/AlenaAgadzhanyan")
student2 = Student.new(surname: "Аникин", firstname: "Марк", lastname: "Андреевич", id: 2, phone_number: "89235614578", telegram: "@mark", email: "anikin_mark@gmail.com", git: "github.com/Corray333")

student1.information()
student2.information()