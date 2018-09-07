# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ActiveRecord::Base.transaction do
  User.destroy_all
  Poll.destroy_all
  Question.destroy_all
  AnswerChoice.destroy_all
  Response.destroy_all
  
  users = User.create([
    { username: "Darren"},
    { username: "Atar97"},
    { username: "EJ"},
    { username: "Ryan"},
    { username: "Darth_Vader"},
    ])
    
  polls = Poll.create([
    {title: 'Darren Get to know you', user_id: users[0].id},
    {title:"Austin's Pizza Poll", user_id: users[1].id},
    {title:"Darth Poll", user_id: users[4].id}
    
    ])
    
  questions = Question.create([
      {text: "Do You Like Pizza?", poll_id: polls[1].id},
      {text: "What is your favorite color?", poll_id: polls[0].id},
      {text: "Where were you born?", poll_id: polls[0].id},
      {text: "Political Party?", poll_id: polls[2].id}
  ])

  answer_choices = AnswerChoice.create([
    {body: "Yes!", question_id: questions[0].id},
    {body: "Nah! Cheese is gross", question_id: questions[0].id},
    {body: "Red", question_id: questions[1].id},
    {body: "Orange", question_id: questions[1].id},
    {body: "Yellow", question_id: questions[1].id},
    {body: "Green", question_id: questions[1].id},
    {body: "Blue", question_id: questions[1].id},
    {body: "Indigo", question_id: questions[1].id},
    {body: "Violet", question_id: questions[1].id},
    {body: "UK!", question_id: questions[2].id},
    {body: "USA!", question_id: questions[2].id},
    {body: "France...", question_id: questions[2].id},
    {body: "Degobah?", question_id: questions[2].id},
    {body: "Imperial", question_id: questions[3].id}
    ])
    
  Response.create([
    {user_id: users[0].id, answer_id: answer_choices[0].id},
    {user_id: users[1].id, answer_id: answer_choices[0].id},
    {user_id: users[3].id, answer_id: answer_choices[0].id},
    {user_id: users[4].id, answer_id: answer_choices[1].id},
    {user_id: users[0].id, answer_id: answer_choices[2].id},
    {user_id: users[1].id, answer_id: answer_choices[6].id},
    {user_id: users[1].id, answer_id: answer_choices.last.id},
    {user_id: users[4].id, answer_id: answer_choices.last.id}
    ])

end 

    

    
    