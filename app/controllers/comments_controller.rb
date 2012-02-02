class CommentsController < ApplicationController
  before_filter :require_login
  before_filter :find_report

  # POST /comments
  # POST /comments.json
  def create
    @comment = @report.comments.build(params[:comment].merge(user_id: current_user.id))
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @report, notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { redirect_to @report, alert: 'Comment was not created.'  }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = @report.comments.where(user_id: current_user.id).find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to @report }
      format.json { head :no_content }
    end
  end

  private
  def find_report
    @report = Report.find(params[:report_id])
  end
end
