# frozen_string_literal: true

module AdminsBackoffice
  class AdminsController < AdminsBackofficeController
    before_action :set_admin, only: %i[show edit update destroy]

    def index
      @admins = Admin.all
    end

    def show; end

    def edit; end

    def update
      if params[:admin][:password].blank? && params[:admin][:password_confirmation].blank?
        params[:admin].extract!(:password, :password_confirmation)
      end
      if @admin.update(admin_params)
        respond_to do |format|
          format.html { redirect_to admins_backoffice_admins_path, notice: 'Admin atualizado com sucesso.' }
          format.turbo_stream
        end
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

    def admin_params
      params.require(:admin).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
  end
end
