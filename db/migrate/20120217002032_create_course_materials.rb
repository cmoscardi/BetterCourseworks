class CreateCourseMaterials < ActiveRecord::Migration
  def self.up
    create_table :course_materials do |t|
      t.string :name
      t.string :url

      t.timestamps
    end
  end

  def self.down
    drop_table :course_materials
  end
end
