# frozen_string_literal: true

module AdminsBackoffice
  class QuestionsController < AdminsBackofficeController
    before_action :set_question, only: %i[show edit update destroy]
    before_action :get_subjects, only: %i[new edit]

    def index
      @questions = Question.all.includes(:subject).order(:description).page(params[:page]).per(10)
    end

    def new
      @question = Question.new
    end

    def create
      @question = Question.new(params_question)
      if @question.save
        redirect_to admins_backoffice_questions_path, notice: 'Questão cadastrada com sucesso.', status: :see_other
      else
        render :new, status: :unprocessable_entity
      end
    end

    def show; end

    def edit; end

    def update
      if @question.update(params_question)
        redirect_to admins_backoffice_questions_path, notice: 'Questão atualizada com sucesso.'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @question.destroy
      redirect_to admins_backoffice_questions_path, notice: 'Questão deletada com sucesso'
    end

    private

    def set_question
      @question = Question.find(params[:id])
    end

    def params_question
      params.require(:question).permit(:subject_id, :description)
    end

    def get_subjects
      @subjects = Subject.all
    end
  end
end
