class ApplicationController < ActionController::Base
  before_action :configurar_carrinho
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configurar_carrinho
    @carrinho = Carrinho.find_by(id: session[:carrinho_id])
    if @carrinho.nil?
      @carrinho = Carrinho.create
      session[:carrinho_id] = @carrinho.id
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nome, :telefone])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nome, :telefone])
  end
end