class AnketasController < ApplicationController
  # GET /anketas
  # GET /anketas.xml
  before_filter :get_poll_anketa

  def index
    @anketas = @poll.anketas.paginate(:page => params[:page] || 1)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @anketas }
    end
  end

  # GET /anketas/1
  # GET /anketas/1.xml
  def show
    @anketa = Anketa.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @anketa }
    end
  end

  # GET /anketas/new
  # GET /anketas/new.xml
  def new
    @anketa = Anketa.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @anketa }
    end
  end

  # GET /anketas/1/edit
  def edit
    @anketa = Anketa.find(params[:id])
  end

  # POST /anketas
  # POST /anketas.xml
  def create
    @anketa = Anketa.new(params[:anketa])
    @anketa.poll=@poll

    respond_to do |format|
      if @anketa.save
        flash[:notice] = 'Anketa was successfully created.'
        format.html { redirect_to(poll_anketa_path(@poll,@anketa)) }
        format.xml  { render :xml => @anketa, :status => :created, :location => @anketa }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @anketa.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /anketas/1
  # PUT /anketas/1.xml
  def update
    @anketa = Anketa.find(params[:id])

    respond_to do |format|
      if @anketa.update_attributes(params[:anketa])
        flash[:notice] = 'Anketa was successfully updated.'
        format.html { redirect_to(poll_anketa_path(@poll,@anketa)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @anketa.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /anketas/1
  # DELETE /anketas/1.xml
  def destroy
    @anketa = Anketa.find(params[:id])
    @anketa.destroy

    respond_to do |format|
      format.html { redirect_to(poll_anketas_url(@poll)) }
      format.xml  { head :ok }
    end
  end
end
