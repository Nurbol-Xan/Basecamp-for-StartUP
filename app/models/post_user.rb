class PostUser < ApplicationRecord
    belongs_to :post

    enum role: [ :user, :t_read, :t_delete, :t_update, :t_write, :admin ]

    after_initialize :set_default_role, :if => :new_record?

    def set_default_role
        self.role ||= :user
    end
end
