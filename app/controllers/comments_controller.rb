class CommentsController < ApplicationController

def create
	@book = Book.find(params[:book_id])
	@comment = @book.comments.create(params.require(:comment).permit(:content))
	@comment.user_id = current_user.id

	if @comment.save
		redirect_to book_path(@book)
	else
		render 'new'
	end
end


end
