class KlassesController < ApplicationController
  before_action :set_user
  before_filter :ensure_owner
  before_action :set_klass, only: [:show, :edit, :update, :destroy]

  def index
    @klasses = @user.klasses.all
  end

  def show
    @assignments = @klass.assignments
  end

  def new
    @klass = Klass.new
  end

  def edit
  end

  def create
    @klass = @user.klasses.new klass_params

    respond_to do |format|
      if @klass.save
        format.html { redirect_to user_klass_path(@user, @klass),
                        notice: 'Klass was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if @klass.update(klass_params)
        format.html { redirect_to user_klass_path(@user, @klass),
                        notice: 'Klass was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @klass.destroy
    respond_to do |format|
      format.html { redirect_to user_klasses_path(@user) }
    end
  end

  private
    def set_user
      @user = User.find params[:user_id]
    end

    def set_klass
      @klass = @user.klasses.find(params[:id])
    end

    def klass_params
      params.require(:klass).permit(:name)
    end
end
