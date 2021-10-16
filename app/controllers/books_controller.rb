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
       @books = Book.all
    book = Book.find(params[:id])
    if  book.update(book_params)
    redirect_to book_path(book)
    else
      render "index"
    end
  end
 
  def create
    @books = Book.all
    # １. データを新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    # ２. データをデータベースに保存するためのsaveメソッド実行
    if  @book.save
    # ３. トップ画面へリダイレクト
      redirect_to book_path(@book.id), success: '登録ができました'
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
