class OdaisController < ApplicationController
	before_action :sign_in_required, only: [:new, :create, :destroy]
	def index
		@odais = Odai.find(params[:id])
		@fukyos = @odais.fukyos
	end

	def new
	end

	def create
		@odai = Odai.create(detail: odai_params[:detail], user_id: current_user.id)
	end

	def show
		@odai = Odai.find(params[:id])
		@fukyos = @odai.fukyos
	end

	def destroy
		odai = Odai.find(params[:id])
		if odai.user_id == current_user.id
			odai.destroy
			redirect_to root_url
		end
	end

	private
	def odai_params
	  params.permit(:detail)
	end

end
