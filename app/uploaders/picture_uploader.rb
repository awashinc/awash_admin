# encoding: utf-8

class PictureUploader  < Shrine

    plugin :determine_mime_type
    plugin :restore_cached_data

    Attacher.validate do
      validate_max_size 5.megabytes, message: 'is too large (max is 5 MB)'
      validate_mime_type_inclusion ['image/jpeg', 'image/png', 'image/gif']

    end

end
