class KittensController < ApplicationController

    def index
        @kittens = Kitten.all
    end

    def show
        @kitten = Kitten.find(params[:id])
    end

    def new
        @kitten = Kitten.new
    end

    def create
        @kitten = Kitten.new(kitten_params)

        if @kitten.save
            flash[:success] = "Kitten was created successfully, meow!"
            redirect_to @kitten
        else
            flash.now[:error] = "Error creating kitten!"
            render :new
        end
    end

    def edit
        @kitten = Kitten.find(params[:id])
    end

    def update
        @kitten = Kitten.find(params[:id])

        if @kitten.update(kitten_params)
            redirect_to @kitten, flash[:success] = "Kitten was updated successfully, they do have nine lives!"
        else
            render :edit, flash.now[:error] = "Try again! And slower this time", status: :unprocessable_entity
        end
    end

    def destroy
        @kitten = Kitten.find(params[:id])

        @kitten.destroy!
        flash[:success] = "Kitten was deleted successfully, I think it's ran away!"
        redirect_to root_path
    end


    private


    def kitten_params
        params.require(:kitten).permit(:name, :age, :cuteness, :softness)
    end
end
