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
      @book = Book.find(params[:id])
  end
   def update
    book = Book.find(params[:id])
    if  book.update(book_params)
    redirect_to book_path(book)
    else
    end
  end
 
  def create
    # １. データを新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    # ２. データをデータベースに保存するためのsaveメソッド実行
    if  @book.save
    # ３. トップ画面へリダイレクト
      redirect_to book_path(@book.id)
      # 詳細画面へリダイレクト
    else
      
      redirect_to book_path
    end
  end
  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
