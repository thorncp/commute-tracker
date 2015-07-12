class UpdateDailyAveragesToVersion2 < ActiveRecord::Migration
  def change
    update_view :daily_averages, version: 2, revert_to_version: 1
  end
end
