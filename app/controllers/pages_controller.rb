class PagesController < ApplicationController
  before_action :set_page, only: [:edit, :update, :show, :destroy]
   before_action :require_user, except: [:index, :show]
   before_action :require_same_user, only: [:edit, :update, :destroy]

  # GET /pages
  # GET /pages.json
  def index
    @pages = Page.paginate(page:  params[:page], per_page: 5)
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
  end

  # GET /pages/new
  def new
    @page = Page.new
  end

  # GET /pages/1/edit
  def edit
  end

  # POST /pages
  # POST /pages.json
  def create
  @page = Page.new(page_params)
  @page.user = current_user
  if @page.save
    flash[:success] = "You created your today's memory!"
    redirect_to page_path(@page)
  else
    render 'new'
  end
end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
  if @page.update(page_params)
    flash[:success] = "You have updated the current page!!"
    redirect_to page_path(@page)
  else
    render 'edit'
  end
end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page.destroy
    flash[:danger] = "You deleted today's memory!!"
    redirect_to pages_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:title, :description)
    end

        def require_same_user
        if current_user != @page.user and !current_user.admin? 
          flash[:danger]= "You can only edit your own account"
          redirect_to root_path
        end
      end



end
