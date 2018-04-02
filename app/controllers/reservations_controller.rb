class ReservationsController < ApplicationController

    def index
        @reservations = Reservation.all
        @reservation  = Reservation.new
    end

    def new
        @reservation = Reservation.new()
        @users = User.all
        @books = Book.available
    end

    def create
        @reservation = Reservation.new(reservation_params)
        @book = Book.find(reservation_params[:book_id])
        if @reservation.save
            @book.borrow!
            redirect_to new_reservation_path
            flash[:notice] = "#{@book.title} borrowed by #{@book.user.first_name}!"
        else
            render :new
        end
    end

    def destroy
        @reservation = Reservation.find(params[:reservation][:id])
        @book = @reservation.book
        @book.return!
        @reservation.delete
        redirect_to books_path
        flash[:notice] = "#{@book.title} is available"
    end

    private
    def reservation_params
        params.require(:reservation).permit(:user_id, :book_id)
    end
end
