class DropTableStartedTests < ActiveRecord::Migration[6.1]
  def up
    drop_table :started_tests, if_exists: true # позволяет исключить ошибки при накатывании миграции, в случае когда таблицы уже не существует
  end
end
