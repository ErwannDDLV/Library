class BooksController < ApplicationController
    before_action :set_book, only: [:show, :edit, :update, :destroy]

    def index
        @books = Book.all.order('title')
    end

    def show
    end

    def new
        @book = Book.new
    end

    def create
        @book = Book.new(book_params)
        if @book.save
            flash[:notice] = " '#{@book.title}' has been added !"
            redirect_to @book
        else
            render :new
        end
    end

    def edit
    end

    def update
        @book.update(book_params)
        if @book.save
            redirect_to book_path(@book)
            flash[:notice] = "Book updated"
        else
            render :edit
        end
    end

    def borrowed
        @books = Book.where(state: true)
    end

    def destroy
        if @book.destroy
            redirect_to books_path
            flash[:alert] = "Book has been deleted"
        else
            render :edit
        end
    end

    private

    def set_book
        @book = Book.find(params[:id])
    end

    def book_params
        params.require(:book).permit(:title, :author, :resume, :aasm_state,)
    end
end