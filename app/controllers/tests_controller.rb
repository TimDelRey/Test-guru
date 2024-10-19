# frozen_string_literal: true

class TestsController < ApplicationController
  def index
    render inline: '<%= Test.all.pluck(:id, :title)%>'
  end

  def show
    render inline: '<%= Test.find(params[:id]).title%>'
  end

  def new; end
end
