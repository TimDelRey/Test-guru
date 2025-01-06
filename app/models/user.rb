# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, and :omniauthable
  devise :database_authenticatable, 
         :registerable,
         :recoverable,
         :rememberable, 
         :validatable,
         :confirmable,
         :trackable
  has_many :test_passages
  has_many :tests, through: :test_passages

  def tests_history_by_level(level)
    Test.joins(:started_tests)
        .where(started_tests: { user_id: id })
        .where('level = ?', level)
        .pluck(:title)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
