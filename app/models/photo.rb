class Photo < ApplicationRecord
  belongs_to :room

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" },

    storage: :s3,
    #path: ':class/:attachment/:id/:style/:filename',

    s3_credentials: {
      bucket: ENV['bucket'],
      access_key_id: ENV['access_key_id'],
      secret_access_key: ENV['secret_access_key']
    },
    s3_region: ENV['aws_region'],


  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
