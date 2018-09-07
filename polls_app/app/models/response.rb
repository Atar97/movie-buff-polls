# == Schema Information
#
# Table name: responses
#
#  id         :bigint(8)        not null, primary key
#  user_id    :integer          not null
#  answer_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Response < ApplicationRecord
  
  belongs_to :user,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :User 
  
  belongs_to :answer, 
  primary_key: :id,
  foreign_key: :answer_id,
  class_name: :AnswerChoice
  
end 
