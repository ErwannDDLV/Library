class BooksController < ApplicationController
    before_action :set_book, only: [:show, :edit, :update, :destroy]

    def index
        @books = Book.all
    end

    def show
        @book
    end

    def edit
    end

    def borrowed
        @books = Book.where(state: true)
    end

    def destroy
        @book.destroy

        redirect_to books_path
    end

    private

    def set_book
        @book = Book.find(params[:id])
    end

end