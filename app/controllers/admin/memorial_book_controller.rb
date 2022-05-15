class Admin::MemorialBookController < Admin::AdminController
  before_action :set_memorial_book, only: [:destroy, :edit, :update, :show]

  def index
    @memorial_books = MemorialBook.all
  end

  def new
    @is_main_article = MemorialBook.find_by(is_main_article: true)
    @memorial_book = MemorialBook.new
  end

  def show
    @is_main_article = @memorial_book.is_main_article
  end

  def create
    memorial_book = current_user.memorial_books.new(params_memorial_book)
    if memorial_book.save
      flash[:notice] = 'You created memorial book successfully'
      redirect_to admin_memorial_book_index_path
    else
      flash.now[:warning] = 'You can not create memorial book, please check error'
      render :new
    end
  end

  def update
    if @memorial_book.update(params_memorial_book)
      flash[:notice] = 'You updated memorial book successfully'
      redirect_to admin_memorial_book_index_path
    else
      flash.now[:warning] = 'You can not update memorial book, please check error'
      render :edit
    end
  end

  def edit
    @is_main_article = MemorialBook.find_by(is_main_article: true)
  end

  def destroy
    @memorial_book.destroy
    flash[:notice] = 'You deleted memorial book successfully'
    redirect_to admin_memorial_book_index_path
  end

  private
  def params_memorial_book
    params.require(:memorial_book).permit(:name, :content, :is_main_article, :display, :file_image, :file_pdf, :name_link)
  end

  def set_memorial_book
    @memorial_book = MemorialBook.find_by(id: params[:id])
  end
end
