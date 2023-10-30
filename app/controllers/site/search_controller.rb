class Site::SearchController < SiteController
  def questions
    @questions = Question.all.includes(:answers).page(params[:page]).per(10)
  end
end
