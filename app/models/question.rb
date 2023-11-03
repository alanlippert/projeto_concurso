# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :subject, inverse_of: :questions
  has_many :answers
  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true

  

  def self.search(page, term)
    Question.includes(:answers)
            .where('lower(description) LIKE ?', "%#{term.downcase}%")
            .page(page)
  end
end
