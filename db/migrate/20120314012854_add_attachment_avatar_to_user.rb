class AddAttachmentAvatarToUser < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.has_attached_file :avatar
    end
  end

  def self.down

  end
end
