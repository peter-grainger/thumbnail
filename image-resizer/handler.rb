#handler.rb
require 'uploaded_file'

class ImageHandler

  def self.process(event:, context:)
    event = event["Records"].first
    bucket_name = event["s3"]["bucket"]["name"]
    object_name = event["s3"]["object"]["key"]

    file = UploadedFile.from_s3(bucket_name, object_name)
    file.resize "100x100"
    file.upload_file("cert-lab-resized-images-3", "resized_" + event["s3"]["object"]["key"] )
  end
end
