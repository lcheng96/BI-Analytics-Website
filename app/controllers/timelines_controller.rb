class TimelinesController < ApplicationController
  def index
    @timelines = Timeline.all
  end  
  def explore
   # render 'explore'
  end
  def show

  end
end
