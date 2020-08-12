class BulletinBoardsController < ApplicationController

  def index
  	@boards = BulletinBoard.all
  	@board  = BulletinBoard.new
  end

  def create
    @board = BulletinBoard.new(bulletin_board_params)
    if @board.save
      redirect_to bulletin_boards_path, notice: "successfully created book!"#保存された場合の移動先を指定。
    else
      @boards = BulletinBoard.all
      @board  = BulletinBoard.new
      render 'index'
    end
  end

  def show
    @board = BulletinBoard.find(params[:id])
    @comments = @board.bulletin_board_comments
    @comment = BulletinBoardComment.new
  end

  def bulletin_board_params
  	params.require(:bulletin_board).permit(:title,:name,:body,:delete_password)
  end

end
