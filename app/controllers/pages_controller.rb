class PagesController < ApplicationController
  layout false, only: [ :home_off ]

  def results
    @past_courses = Course.where("end_date < ?", Time.current).order(end_date: :desc)
  end

  def home_off
    @recent_courses = Course.where(status: [ "active", "finished" ]).order(end_date: :desc).limit(6)
    @open_courses = Course.where("start_date <= ? AND end_date >= ?", Time.current, Time.current).order(end_date: :asc)
  end

  def about
  end

  def policy
  end

  def home_on
    now = Time.current
    @open_courses = Course.where("start_date <= ? AND end_date >= ?", now, now).order(:start_date)
    @past_courses = Course.where("end_date < ?", now).order(end_date: :desc)
    @future_courses = Course.where("start_date > ?", now).order(:start_date)
  end

  private

  def greeting_message
    case Time.current.hour
    when 5..11
      "Bom dia"
    when 12..17
      "Boa tarde"
    else
      "Boa noite"
    end
  end
end
