# frozen_string_literal: true

module Site
  class SearchController < SiteController
    def questions
      @questions = Question.search(params[:page], params[:term])
    end
  end
end
# params[:term]
# @questions = Question.all.includes(:answers).page(params[:page]).per(10)
