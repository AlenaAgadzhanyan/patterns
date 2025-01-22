require 'fox16'
require_relative "../view/student_list_view.rb"
require "../model/strategy/student_list_base.rb"
require "../model/strategy/storage_strategy_json.rb"
include Fox

app = FXApp.new
students_list = StudentsListBase.new('../resources/data/students.json', StorageStrategyJSON.new)
StudentListView.new(app, students_list)
app.create
app.run