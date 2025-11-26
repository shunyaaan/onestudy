class BoardsController < ApplicationController
    def index
        @boards = Board.all
    end

    def new
        @board = Board.new
    end

    def create
        board = Board.new(board_params)
        if board.save
            redirect_to :action => "index"
        else
            redirect_to :action => "new"
        end
    end

    def show
        @board = Board.find(params[:id])
    end

    def edit
        @board = Board.find(params[:id])
    end

    def update
        board = Board.find(params[:id])
        if Board.update(board_params)
            redirect_to :action => "show", :id => board.id
        else
            redirect_to :action => "new"
        end
    end

    def destroy
        board = Board.find(params[:id])
        board.destroy
        redirect_to action: :index
    end
    
    private
    def board_params
        params.require(:board).permit(:body, :title, :subject, :grade)
    end
end
