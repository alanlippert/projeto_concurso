module AdminsBackoffice
  class AdminsBackoffice::SubjectsController < AdminsBackofficeController
    before_action :set_subject, only: %i[show edit update destroy]

    def index
      @subjects = Subject.all
    end
    
    def new
      @subject = Subject.new
    end

    def create
      @subject = Subject.create(subject_params)
      if @subject.save
        redirect_to admins_backoffice_subject_path, notice: 'Assunto cadastrado com sucesso.', status: :see_other
      else
        render :new, status: :unprocessable_entity
      end 
    end

    def show
    end
    
    def edit
    end

    def update
      if @subject.update(params_subject)
        redirect_to admins_backoffice_subject_path, notice: 'Assunto atualizado com sucesso.' 
      else
        render :edit, status: :unprocessable_entity 
      end
    end

    def destroy
      @subject.destroy
       redirect_to admins_backoffice_subject_path, notice: 'Assunto atualizado com sucesso.' 
    end


    private
    
    def set_subject
      @subject = Subject.find(params[:id])
    end

    def params_subject
      params.require(:subject).permit(:description)
    end
  end
end
