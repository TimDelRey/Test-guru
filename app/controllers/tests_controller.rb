class TestsController < ApplicationController
  def index
    # byebug
    # render plain: 'Hello world!'
    # render inline: '<%=console%>'

    # render json: {tests: Test.all}
    render inline: '<%= Test.all.pluck(:id, :title)%>'
  end

  def show
    render inline: '<%= Test.find(params[:id]).title%>'
    # render json: Test.find(params[:id])
  end

  def new
  end
end
