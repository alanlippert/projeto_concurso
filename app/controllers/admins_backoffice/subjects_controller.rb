module AdminsBackoffice
  class AdminsBackoffice::SubjectsController < AdminsBackofficeController
    def index
      @subjects = Subject.all
    end
    
    def new
      @subject = Subject.new
    end

    def create
      @subject = Subject.create(subject_params)      
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
