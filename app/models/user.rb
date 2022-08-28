class User < ApplicationRecord
    has_secure_password

    # Risolto solo se, nel form di registrazione la pass corrisponde alla conferma pass
    # :password_confirm viene permesso come parametro ma non sarà salvato nel DB
    validates :password, :confirmation => true
    validates :password_confirmation, :presence => true

    def welcome
        "Hello, #{self.username}!"
    end
end
