class CreatePostImages < ActiveRecord::Migration[6.1]
  def change
    create_table :post_images do |t|
      t.timestamps

      has_one_attached :image
    end
  end
end
