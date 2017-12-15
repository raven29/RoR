class ChangeBooleanColumns < ActiveRecord::Migration
  def self.up
    change_column :emails, :deleted, :boolean, :null=>false, :default=>0
    change_column :emails, :important, :boolean, :null=>false, :default=>0
	change_column :emails, :sent, :boolean, :null=>false, :default=>0
  end

  def self.down
    change_column :emails, :deleted, :boolean
    change_column :emails, :important, :boolean
	change_column :emails, :sent, :boolean
  end
end
