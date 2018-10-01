class GroupsController < ApplicationController
before_filter :redirect_on_bad_date, only: [:show]

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
    @posts = @group.post_for_day get_date
  end

  def get_date
    if params[:date].present? 
      date = DateTime.parse params[:date] rescue nil
      # date = params[:date]
    else
      date = Time.zone.today
    end
  end

  def redirect_on_bad_date
    if get_date.blank?
      redirect_to group_path(params[:id])
      return
    end
  end

end
