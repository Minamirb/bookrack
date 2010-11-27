class UserBooksController < ApplicationController
  # GET /user_books
  # GET /user_books.xml
  def index
    @user_books = UserBook.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @user_books }
    end
  end

  # GET /user_books/1
  # GET /user_books/1.xml
  def show
    @user_book = UserBook.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user_book }
    end
  end

  # GET /user_books/new
  # GET /user_books/new.xml
  def new
    @user_book = UserBook.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user_book }
    end
  end

  # GET /user_books/1/edit
  def edit
    @user_book = UserBook.find(params[:id])
  end

  # POST /user_books
  # POST /user_books.xml
  def create
    @user_book = UserBook.new(params[:user_book])

    respond_to do |format|
      if @user_book.save
        format.html { redirect_to(@user_book, :notice => 'User book was successfully created.') }
        format.xml  { render :xml => @user_book, :status => :created, :location => @user_book }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user_book.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /user_books/1
  # PUT /user_books/1.xml
  def update
    @user_book = UserBook.find(params[:id])

    respond_to do |format|
      if @user_book.update_attributes(params[:user_book])
        format.html { redirect_to(@user_book, :notice => 'User book was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user_book.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /user_books/1
  # DELETE /user_books/1.xml
  def destroy
    @user_book = UserBook.find(params[:id])
    @user_book.destroy

    respond_to do |format|
      format.html { redirect_to(user_books_url) }
      format.xml  { head :ok }
    end
  end
end
