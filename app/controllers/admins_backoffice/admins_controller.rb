module AdminsBackoffice
  class AdminsController < AdminsBackofficeController
    before_action :verify_password, only: %i[update]
    before_action :set_admin, only: %i[show edit update destroy]
   
    def index      
      @admins = Admin.all.page(params[:page]).per(5)     
    end
    
    def new
      @admin = Admin.new
    end

    def create
      @admin = Admin.new(params_admin)  
      if @admin.save
        redirect_to admins_backoffice_admins_path, notice: 'Admin cadastrado com sucesso.', status: :see_other
      else
        render :new, status: :unprocessable_entity
      end
    end
    
    def show; end

    def edit; end

    def update            
      if @admin.update(params_admin)
        redirect_to admins_backoffice_admins_path, notice: 'Admin atualizado com sucesso.'          
      else
        render :edit, status: :unprocessable_entity 
      end
    end

    def destroy
      @admin.destroy      
        redirect_to admins_backoffice_admins_path, notice: 'Admin excluído com sucesso.', status: :see_other       
    end

    private

    def set_admin
      @admin = Admin.find(params[:id])
    end

    def params_admin
      params.require(:admin).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
    
    def verify_password
      if params[:admin][:password].blank? && params[:admin][:password_confirmation].blank?
        params[:admin].extract!(:password, :password_confirmation)
      end
    end
  end
end
