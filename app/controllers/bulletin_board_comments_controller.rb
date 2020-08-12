class BulletinBoardCommentsController < ApplicationController

	def create
		@comment = BulletinBoardComment.new(bulletin_board_comment_params)
		@board = BulletinBoard.find(params[:bulletin_board_id])
		@comment.bulletin_board_id = @board.id
	    if @comment.save
	    	redirect_to @board, notice: "successfully created book!"#保存された場合の移動先を指定。
	    else
	   		redirect_to @board, notice: "コメントを入力してください"
	    end
	end

	def bulletin_board_comment_params
		params.require(:bulletin_board_comment).permit(:name,:comment)
	end

end
