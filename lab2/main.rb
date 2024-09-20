require './class_student.rb'

student1 = Student.new("Агаджанян", "Алёна", "Самвеловна", 1, "81234567895", "@alena", "agadzhanyan_alyona@mail.ru", "github.com/AlenaAgadzhanyan")
student2 = Student.new("Аникин", "Марк", "Андреевич", 2, "89235614578", "@mark", "anikin_mark@gmail.com", "github.com/Corray333")

student1.information()
student2.information()