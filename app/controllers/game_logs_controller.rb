class GameLogsController < GamesController
  before_action :set_game, only: %i[edit update destroy]

  def new
    @game = Game.find(params[:game_id])
    @game_log = GameLog.new
    params[:game_id] = @game.id
  end

  def create
    @game_log = GameLog.new(game_log_params)
    @game_log.game_id = params[:game_id]
    if @game_log.save
      flash[:notice] = 'Game log successfully added'
      redirect_to edit_game_path(params[:game_id])
    else
      redirect_to :back
    end

  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def game_log_params
    params.require(:game_log).permit(
      :game_id,
      :completion_date,
      :hours
    )
  end
end