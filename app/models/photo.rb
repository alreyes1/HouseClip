class Photo < ApplicationRecord
  belongs_to :room

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" },

  #paperclip S3

    storage: :s3,

    s3_credentials: {
      bucket: ENV.fetch('bucket'),
      access_key_id: ENV.fetch('access_key_id'),
      secret_access_key: ENV.fetch('secret_access_key'),
      s3_region: ENV.fetch('aws_region'),
      s3_host_name: ENV.fetch('s3_host_name')
    },

      s3_permissions: => 'private'
      url: => ':s3_domain_url'
      Paperclip::Attachment.default_options[:url] = ':s3_domain_url'
      Paperclip::Attachment.default_options[:path] = ':class/:attachment/:id/:style/:filename'

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
