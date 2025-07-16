class Api::V1::UsersController < Api::V1::BaseController

   

  def create

     # Debug completo dos parâmetros
    Rails.logger.info "=== DEBUG PARÂMETROS ==="
    Rails.logger.info "Parâmetros RAW: #{params.inspect}"
    Rails.logger.info "Content-Type: #{request.content_type}"
    Rails.logger.info "Request Body: #{request.raw_post}"
    Rails.logger.info "========================="
    
    # Imprimir no console também
    puts "=== PARÂMETROS RECEBIDOS ==="
    puts "Raw params: #{params.inspect}"
    puts "User params: #{params[:user]}"
    puts "Keys disponíveis: #{params.keys}"
    puts "=============================="


    @user = User.new(user_params)
    
    if @user.save
      render json: {
        message: "Usuário criado com sucesso",
        user: {
          id: @user.id,
          name: @user.name,
          email: @user.email,
          created_at: @user.created_at
        }
      }, status: :created
    else
      render json: {
        errors: @user.errors.full_messages
      }, status: :unprocessable_entity
    end
  end
  
  def show
    @user = User.find(params[:id])
    
    render json: {
      user: {
        id: @user.id,
        name: @user.name,
        email: @user.email,
        created_at: @user.created_at
      }
    }
  rescue ActiveRecord::RecordNotFound
    render json: {
      error: "Usuário não encontrado"
    }, status: :not_found
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end