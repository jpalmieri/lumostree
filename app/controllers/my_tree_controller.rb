class MyTreeController < ApplicationController
  def index
    @trees = MyTree.all.select { |t| t.root? }
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end
end
