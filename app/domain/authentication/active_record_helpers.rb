module Authentication
  module ActiveRecordHelpers

    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def find_for_oauth(auth)
        record = where(provider: auth.provider, uid: auth.uid.to_s).first
        if auth.provider == "twitter"
          record || create(provider: auth.provider,
                           uid: auth.uid,
                           password: Devise.friendly_token[0,20],
                           picture_attributes: {:cover_image_url => auth.info.image},
                           name: auth.info.name)
        else
          record || create(provider: auth.provider,
                           uid: auth.uid,
                           email: auth.info.email,
                           password: Devise.friendly_token[0,20],
                           picture_attributes: {:cover_image_url => auth.info.image},
                           name: auth.info.name)
        end
      end





    end
  end
end