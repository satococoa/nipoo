class ReportsController < ApplicationController
  before_filter :require_login

  # GET /my_reports
  # GET /my_reports.json
  def my_reports
    @reports ||= Report.user(current_user).all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reports }
    end
  end

  # GET /reports
  # GET /reports.json
  def index
    if params[:date].present?
      begin
        @date = Date.parse(params[:date])
      rescue => e
        Rails.logger.debug [e.class, e.message].join(' ')
      end
    end

    @date ||= (Report.latest_date.presence || Date.today)
    @reports = Report.date(@date).all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reports }
    end
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
    @report = Report.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @report }
    end
  end

  # GET /reports/new
  # GET /reports/new.json
  def new
    @report = current_user.reports.new
    if params[:copy_mode].present?
      latest_report = current_user.reports.order('date DESC').limit(1).first
      @report.body = latest_report.try(:body) || ''
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @report }
    end
  end

  # GET /reports/1/edit
  def edit
    @report = current_user.reports.find(params[:id])
  end

  # POST /reports
  # POST /reports.json
  def create
    @report = current_user.reports.new(params[:report])

    respond_to do |format|
      if @report.save
        format.html { redirect_to @report, notice: 'Report was successfully created.' }
        format.json { render json: @report, status: :created, location: @report }
      else
        format.html { render action: "new" }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /reports/1
  # PUT /reports/1.json
  def update
    @report = current_user.reports.find(params[:id])

    respond_to do |format|
      if @report.update_attributes(params[:report])
        format.html { redirect_to @report, notice: 'Report was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @report = current_user.reports.find(params[:id])
    @report.destroy

    respond_to do |format|
      format.html { redirect_to reports_url }
      format.json { head :no_content }
    end
  end
end
