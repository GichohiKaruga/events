class AddTypeToEvents < ActiveRecord::Migration
  def change
    add_reference :events, :type
  end
end
