class AdminsBackoffice::AdminsController < AdminsBackofficeController
  before_action :set_admin, only: %i[show edit update destroy]
  
  def index
    @admins = Admin.all
  end

  def show
  end

  def edit
  end

  def update
    @admin.update(admin_params)
    redirect_to admins_backoffice_admins_path, notice: "Admin atualizado com sucesso."
  end

  def destroy
    @admin.destroy
    redirect_to admins_backoffice_admins_path, notice: "Admin excluído com sucesso."
  end
  

  private

  def set_admin
    @admin = Admin.find(params[:id])
  end

  def admin_params
    params.require(:admin).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
