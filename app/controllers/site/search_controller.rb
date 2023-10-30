class Site::SearchController < SiteController
  def questions
    params[:term]
    @questions = Question.all.includes(:answers).page(params[:page]).per(10)
  end
end
