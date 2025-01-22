require 'fox16'
require_relative "../view/student_list_view.rb"
include Fox

app = FXApp.new
StudentListView.new(app)
app.create
app.run
