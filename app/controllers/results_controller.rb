class ResultsController < ApplicationController
  require 'spreadsheet'
  before_filter :login_required
  before_filter :check_poll_access
  before_filter :get_anketa


  def index
    @results = @anketa.results.paginate(:page => params[:page] || 1)
    generate_xls
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @results }
    end
  end

  # GET /results/1
  # GET /results/1.xml
  def show
    @result = Result.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @result }
    end
  end

  # GET /results/new
  # GET /results/new.xml
  def new
    @result = Result.new
    @anketa.questions.each do |q|
      @result.answers << Answer.new({:question=>q})
    end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @result }
    end
  end

  # GET /results/1/edit
  def edit
    @result = Result.find(params[:id])
  end

  # POST /results
  # POST /results.xml
  def create
    @result = Result.new(params[:result])

    @result.anketa_id = params[:anketa_id]

    respond_to do |format|
      if @result.save
        flash[:notice] = 'Result was successfully created.'
        if params["SubmitAndNext"]
          format.html { redirect_to(new_poll_anketa_result_path(@poll,@anketa))}
        else
          format.html { redirect_to(poll_anketa_results_path(@poll,@anketa))}
        end
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /results/1
  # PUT /results/1.xml
  def update
    @result = Result.find(params[:id])

    respond_to do |format|
      if @result.update_attributes(params[:result])
        flash[:notice] = 'Result was successfully updated.'
        if params["SubmitAndNext"]
          format.html { redirect_to(new_poll_anketa_result_path(@poll,@anketa))}
        else
          format.html { redirect_to(poll_anketa_results_path(@poll,@anketa)) }
        end
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @result.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /results/1
  # DELETE /results/1.xml
  def destroy
    @result = Result.find(params[:id])
    @result.destroy

    respond_to do |format|
      format.html { redirect_to(poll_anketa_results_url(@poll,@anketa)) }
      format.xml  { head :ok }
    end
  end

  def analize
    @graph = open_flash_chart_object( 600, 350, url_for( :action => 'load', :format => :json ) )
  end

  def load
    joins = []

    session[:filter] ||= {}

    @anketa.questions.each_with_index do |q, index|
      if session[:filter]["#{q.id}"] && !session[:filter]["#{q.id}"].empty?
        qstr = session[:filter]["#{q.id}"]
        tbl_name = "an_#{index}"
        joins << " INNER JOIN answers AS #{tbl_name} ON #{tbl_name}.result_id = results.id AND #{tbl_name}.question_id = #{q.id} AND #{tbl_name}.body LIKE  '%#{qstr}%'"
      end
    end
    @results = @anketa.results.find(:all, :joins => joins)


    session[:question] ||= @anketa.questions.first.id

    res = analyze(@results, session[:question].to_i)

    title = Title.new("Результати")

    pie = Pie.new
    pie.start_angle = 35
    pie.animate = true
    pie.tooltip = '#val# з #total#<br>#percent# з 100%'
    pie.colours = ["#d01f3c", "#356aa0", "#C79810", "#C35810", "#C755f0", "#559810", "#551f3c", "#556aa0", "#C79550", "#C55810", "#C551f0", "#C55810"]
    pie.grid_colour = "#fff"
    pie.font_size = "15"
    
    

    data = []
    res.each do |key, value|
      data << PieValue.new(value, key)
    end
    pie.values  = data

    chart = OpenFlashChart.new
    chart.title = title
    chart.add_element(pie)

    chart.x_axis = nil

    render :text => chart.to_s


  end

  def refresh

    session[:question] = params['field'] if params['field']
    session[:filter] = params['filter'] if params['filter']
    
    @graph = open_flash_chart_object( 600, 300, url_for( :action => 'load', :format => :json ) )
    render :update do |page|
      page.replace_html :result_div, :partial=>"analize_results"
    end

  end

  def analyze (results, q_id)
    analyzes = {}
    results.each do |result|
      result.answers.each do |answer|
        if answer.question_id == q_id
          key = answer.question.qtype == 'boolean' ? t("boolean_type_#{answer.body}".to_sym) : answer.body
          analyzes[key] ||= 0
          analyzes[key] += 1
          next
        end
      end
    end
    analyzes
  end


  def generate_xls
    book = Spreadsheet::Workbook.new
    worksheet = book.create_worksheet

    row = 0

    @results.each do |result|
      result.answers.each do |answer|
        worksheet.row(row).concat([answer.body])   
      end
      row += 1
    end
    book.write "export.xls"
  end
end
