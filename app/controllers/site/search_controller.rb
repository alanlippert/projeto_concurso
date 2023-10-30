class Site::SearchController < SiteController
  def questions
    @questions = Question.all.includes(:answers)
  end
end
