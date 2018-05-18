class MyTreeController < ApplicationController
  def index
    @trees = MyTree.all.select { |t| t.root? }
  end

  def create
    MyTree.create(tree_params)
  end

  def edit
    @tree = MyTree.find(params[:id])
  end

  def update
    tree = MyTree.find(params[:id])
    tree.children.create(tree_params)
    redirect_to action: 'edit', id: tree.root.id
  end

  private

  def tree_params
    params.permit(:name)
  end
end
