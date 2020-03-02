class GamesController < ApplicationController
  before_action :set_game, only: %i[edit update show destroy]

  helper_method :sort_order
  helper_method :game_service

  def sort_order
    # @sort_order ||=
  end

  def game_service
    game = Game.find(params[:id])
    return game
    # if game.service
    #   @game_service = game.system.system + ' (' + game.service + ')'
    # else
    #   @game_service = game.system.system
    # end
  end

  def index
    @games = Game.order('coalesce(series, sort, title) asc')
    # @games = Game.order('coalesce(series, sort)').order(:title)
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      flash[:notice] = 'Game was successfully added'
      redirect_to games_path
    else
      render 'new'
    end
  end

  def edit;
  end

  def update
    @game = Game.update(game_params)
    if @game.save
      flash[:notice] = 'Game was successfully updated'
      redirect_to games_path
    else
      render 'edit'
    end
  end

  def destroy
    @game.destroy
    flash[:notice] = 'Game was successfully deleted'
    redirect_to games_path
  end

  private

  def set_game
    @game = Games.find(params[:id])
  end

  def game_params
    params.require(:game).permit(
      :title,
      :series,
      :sort,
      :service,
      :owned,
      :hr_est,
      :hr_comp,
      :date_comp,
      :system,
      :status
    )
  end
end
