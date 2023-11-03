# frozen_string_literal: true

class Subject < ApplicationRecord
  has_many :questions

  validates :description, presence: true, uniqueness: true
end
