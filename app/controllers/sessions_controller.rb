class SessionsController < ApplicationController
    before_action :logged_in_redirect, only: [:new, :create]

    def new; end
    
    def create
        user = User.find_by(name: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to root_path, notice: 'Logged in successfully'
        else
            flash[:alert] = 'E-mail or password are not valid!'
            render :new, :status => :unprocessable_entity
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to root_path, notice: 'You are logged out'
    end

    private

    def logged_in_redirect
        if logged_in?
            flash[:alert] = "You are already logged in"
            redirect_to login_path
        end
    end
end
