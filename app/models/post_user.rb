class PostUser < ApplicationRecord
    belongs_to :post

    enum role: [ :user, :t_read, :t_delete, :t_update, :t_write, :admin ]

    CATEGORY = %i[t_read t_write t_update t_delete admin]

    after_initialize :set_default_role, :if => :new_record?

    def set_default_role
        self.role ||= :user
    end
end
