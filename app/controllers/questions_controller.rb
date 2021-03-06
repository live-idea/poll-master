class QuestionsController < ApplicationController

  before_filter :login_required


  # GET /questions
  # GET /questions.xml
  before_filter :get_anketa #фільтр для визначення залежного poll анкети
  def get_anketa
    @poll = Poll.find_by_id(params[:poll_id])
    @anketa = Anketa.find_by_id(params[:anketa_id]) #ВИБІР анкети по id
  end
  def index
    @questions = @anketa.questions.paginate(:page => params[:page] || 1)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @questions }
    end
  end

  # reorder pages
  def reorder
    params[:questions].each_with_index { |id,idx|
      q = @anketa.questions.find_by_id(id)
      q.update_attribute(:position, idx)
    }
    render :nothing=>true
  end

  # GET /questions/1
  # GET /questions/1.xml
  def show
    @question = Question.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @question }
    end
  end

  # GET /questions/new
  # GET /questions/new.xml
  def new
    @question = Question.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @question }
    end
  end

  # GET /questions/1/edit
  def edit
    @question = Question.find(params[:id])
  end

  # POST /questions
  # POST /questions.xml
  def create
    @question = Question.new(params[:question])
    @question.anketa = @anketa #зберігання до якої анкети належить питання
    @question.position = @anketa.questions.length
    respond_to do |format|
      if @question.save
        flash[:notice] = 'Question was successfully created.'
        format.html { redirect_to(poll_anketa_path(@poll,@anketa)) } #збереження та повернення
        format.xml  { render :xml => @question, :status => :created, :location => @question }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @question.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /questions/1
  # PUT /questions/1.xml
  def update
    @question = Question.find(params[:id])

    respond_to do |format|
      if @question.update_attributes(params[:question])
        flash[:notice] = 'Question was successfully updated.'
        format.html { redirect_to(poll_anketa_path(@poll,@anketa)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @question.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.xml
  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    respond_to do |format|
      format.html { redirect_to(questions_url) }
      format.xml  { head :ok }
    end
  end
end
