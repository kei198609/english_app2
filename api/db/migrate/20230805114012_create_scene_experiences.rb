class CreateSceneExperiences < ActiveRecord::Migration[7.0]
  def change
    create_table :scene_experiences do |t|
      t.references :user, null: false, foreign_key: true
      t.string :experience_scene
      t.integer :xp

      t.timestamps
    end
  end
end
