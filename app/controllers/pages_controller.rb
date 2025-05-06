class PagesController < ApplicationController

  def results
    @past_courses = Course.where("end_date < ?", Time.current).order(end_date: :desc)
  end

  def home_off
    @recent_courses = Course.where(status: [ "active", "finished" ]).order(end_date: :desc).limit(6)
    @open_courses = Course.where("start_date <= ? AND end_date >= ?", Time.current, Time.current).order(end_date: :asc)
  end

  def home_on
    now = Time.current
    @open_courses = Course.where("start_date <= ? AND end_date >= ?", now, now).order(:start_date)
    @past_courses = Course.where("end_date < ?", now).order(end_date: :desc)
    @future_courses = Course.where("start_date > ?", now).order(:start_date)
  end

  def instructor
    @instrutores = User.where(instructor: true)
  end

  def about
  end

  def policy
  end

  def consent_form
  end

end
