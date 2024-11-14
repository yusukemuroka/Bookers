class BooksController < ApplicationController
    def new
        @book = Book.new
    end
    
    def create
        @book =Book.new(book_params)
        if @book.save
            flash[:notice] = "Book was successfully created."
            redirect_to book_path(@book.id)
        else
            if @book.title.blank? || @book.body.blank?
            flash.now[:notice] = "An error has occurred:"
            flash.now[:notice] += "Title can't be blank.\n" if @book.title.blank?
            flash.now[:notice] += "Body can't be blank." if @book.body.blank?
            @books =Book.all
            render :index
            else
            flash.now[:notice] = "An error has occurred" 
            @books =Book.all
            render :index
            end
        end
    end

    def index
        @books =Book.all
        @book =Book.new
    end

    def show
        @book = Book.find(params[:id])
    end

    def edit
        @book = Book.find(params[:id])
    end

    def update
        book =Book.find(params[:id])
        if book.update(book_params)
            flash[:notice] = "Book was successfully updated."
            redirect_to book_path(book.id)
        else
            @book = book
            flash[:notice] = "An error has occurred."
            render :edit 
        end
      end
      

    def destroy
        book = Book.find(params[:id])
        book.destroy
        redirect_to books_path
    end

    private
    def book_params
        params.require(:book).permit(:title,:body)
    end
end
