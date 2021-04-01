class GamesController < ApplicationController
  before_action :set_game, only: %i[edit update destroy]

  helper_method :game_service
  helper_method :get_statuses

  def index
    @games = Game.all.sort_by(&:sort_string)
  end

  def in_progress_priority
    @games = Game.where(status: [0,1]).sort_by(&:sort_string) # Priority, In Progress
  end

  def complete_abandoned
    @games =
      Game
        .left_outer_joins(:game_logs)
        .where(status: [2,3]) # Complete, Abandoned
        .order(
          status: :asc,
          completion_date: :desc
        )
  end

  def unowned
    @games = Game.where(owned: false).sort_by(&:sort_string)
  end

  def games_to_play
    @games =
      Game
        .where(owned: true)
        .sort_by(&:sort_string)
        .reject { |g| g.status == 'abandoned' || g.status == 'complete' }
  end

  def pc_games
    @games =
      Game
        .joins(:system)
        .where("systems.system LIKE 'PC -%'")
  end

  def switch_games
    @games =
      Game
        .where(
          system: System.where(nickname: 'Switch')
        )
  end

  def ps4_games
    @games =
      Game
        .where(
          system: System.where(nickname: 'PS4')
        )
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

  def edit
  end

  def update
    if @game.update(game_params)
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
    @game = Game.find(params[:id])
  end

  def game_service
    game = Game.find(params[:id])
    return game
  end

  def get_statuses
    @statuses = Status.all
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
      :system_id,
      :status_id
    )
  end
end
