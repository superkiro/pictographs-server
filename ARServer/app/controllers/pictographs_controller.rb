class PictographsController < ApplicationController


	def index
		@pictograph = Pictograph.all
	end

	def new
		@pictograph = Pictograph.new
	end

	def create
		@pictograph = Pictograph.new(params[:pictograph])
		if @pictograph.save
			flash[:notice] = "Pictograph Created $green"
			redirect_to :action => "index"
		else
			render "new"
		end
	end
	
	def delete
		@pictograph = Pictograph.find(params[:id])
	end
	
	def destroy
		@pictograph = Pictograph.find(params[:id])

		if @pictograph.destroy
			flash[:notice] = "Pictograph Deleted $blue"
			redirect_to(:action =>  "index")
		else
			flash[:notice] = "Couldn't delete Pictograph $red"
		end
	end
		
		
	def edit
		@pictograph = Pictograph.find(params[:id])
	end
	
	def update
		@pictograph = Pictograph.find(params[:id])
		if @pictograph.update_attributes(params[:pictograph])
			redirect_to :action => "index"
		else
			render "edit"
		end
	end

	def kiro
		@pictograph = Pictograph.find_by_text(params[:text])
		send_data open(@pictograph.photo.path, "rb"){ |f| f.read }	
	end

	def sendNames

		@names = Pictograph.getNames
respond_to do |format|
    format.json  { render :json => @names.to_json }
  end
		
	end

end
