class ApplicationController < ActionController::Base
  
  #deviseのストロングパラメータ ４−２
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  # ログイン、ログアウト後に投稿一覧画面へ飛ぶ（デフォルトはrootのトップページ）
  def after_sign_in_path_for(resource)
    post_images_path
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  
end
