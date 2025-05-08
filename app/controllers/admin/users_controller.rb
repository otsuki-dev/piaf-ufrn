class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!
  before_action :set_user, only: :toggle_instructor # Mudança aqui

  def toggle_instructor 
    @user.toggle!(:instructor) 
    redirect_to admin_dashboard_path, notice: "Status de instrutor de #{@user.username} alterado para #{@user.instructor ? 'Ativo' : 'Inativo'}."
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def authorize_admin!
    unless current_user.admin?
      redirect_to root_path, alert: 'Você não tem permissão para acessar esta área.'
    end
  end
end