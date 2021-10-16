class BooksController < ApplicationController
  def index
     @books = Book.all
     # Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する。
     @book = Book.new
  end

  def show
     @book = Book.find(params[:id])
  end
  
  def destroy
     book = Book.find(params[:id])
    book.destroy
    redirect_to book_path
  end

  def edit
   
    @books = Book.all
    if  @book = Book.find(params[:id])
      flash[:notice] = "Book was successfully created."
  else
    @book = Book.new(book_params)
      render "show"
    end
    end
   def update
    
       @books = Book.all
    book = Book.find(params[:id])
    if  book.update(book_params)
       flash[:notice] = "Book was successfully created."
    redirect_to book_path(book)
    else
         @book = Book.new(book_params)
      render "show"
    end
  end
 
  def create
    @books = Book.all
    # １. データを新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    # ２. データをデータベースに保存するためのsaveメソッド実行
    if  @book.save
    # ３. トップ画面へリダイレクト
     flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
      # 詳細画面へリダイレクト
    else
      render "index"
     
    end
  end
  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
