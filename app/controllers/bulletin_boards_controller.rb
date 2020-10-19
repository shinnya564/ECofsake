class BulletinBoardsController < ApplicationController

  def index
  	@boards = BulletinBoard.all.order(id: "DESC")
  	@board  = BulletinBoard.new
  end

  def create
    @board = BulletinBoard.new(bulletin_board_params)
    if @board.save
      redirect_to bulletin_boards_path, notice: "新しく投稿されました"#保存された場合の移動先を指定。
    else
      redirect_to request.referer, notice: "error message:空白があります"
    end
  end

  def show
    @no = 1
    @board = BulletinBoard.find(params[:id])
    @comments = @board.bulletin_board_comments
    @comment = BulletinBoardComment.new
  end

  def bulletin_board_params
  	params.require(:bulletin_board).permit(:title,:name,:body,:delete_password)
  end

end
