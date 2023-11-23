class DropSceneExperiences < ActiveRecord::Migration[7.0]
  def up
    drop_table :scene_experiences
  end

  def down
    create_table :scene_experiences do |t|
      t.bigint "user_id", null: false
      t.string "experience_scene"
      t.integer "xp"
      t.timestamps
    end
    add_index :scene_experiences, ["user_id"], name: "index_scene_experiences_on_user_id"
  end
end
