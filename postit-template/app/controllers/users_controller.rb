class UsersController <ApplicationController
	before_action :set_user, [:edit, :update]
	before_action :require_same_user, only: [:edit, :update]
	
	

	def show

	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			session[:user_id] = @user.id
			flash[:notice] = "You have logged in."
			redirect_to root_path
		elsif
			render :new
		end
	end

	def edit
		
	end

	def update
		if @user.save
			flash[:notice] = "Your profile has been updated."
			redirect_to root_path
		elsif 
			render :edit
		end
	end

	private
	
	def set_user
		@user = User.find(params[:id])
	end

	def require_same_user
		if current_user != @user
			flash[:error] = "You are not allowed to do that."
			redirect_to root_path
		end
	end

	def user_params
		params.require(:user).permit(:username, :password)
	end
end