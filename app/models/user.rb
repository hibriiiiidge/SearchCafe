class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
    devise  :database_authenticatable, :registerable,
            :recoverable, :rememberable, :trackable, :validatable,
            :timeoutable, :omniauthable

    has_many :likes, dependent: :destroy
    has_one :owner, dependent: :destroy
    has_many :messagerooms, dependent: :destroy
    has_many :messages, dependent: :destroy

    mount_uploader :avatarurl, ImageUploader

    # user, admin, owner以外をroleに追加できないようにするバリデーションを入れる。
    validates :role, inclusion: { in: %w(user admin owner) }
    #usernameの文字数制限
    validates :username, presence: true, length: { maximum: 50 }

    #findして無かったらcreate
    def self.find_or_create_from_oauth(auth)
      User.find_or_create_by(provider: auth["provider"], uid: auth["uid"]) do |user|
        user.provider   = auth["provider"]
        user.uid        = auth["uid"]
        user.username   = auth["info"]["nickname"] || auth["info"]["name"]
        user.avatarurl  = auth["info"]["image"]
        user.email      = User.dummy_email(auth)  #@TODO ダミーメール生成
        user.password   = Devise.friendly_token[0, 20]
      end
    end

    def self.new_with_session(params, session)
        if session["devise.user_attributes"]
            new(session["devise.user_attributes"], without_protection: true) do |user|
                user.attributes = params
                user.valid?
            end
        else
            super
        end
    end

    #管理者かどうかのチェック
    def admin?
        role == 'admin'
    end
    #管理者でないかどうかのチェック
    def not_admin?
        !admin?
    end
    def owner?
        role == 'owner'
    end
    def not_owner?
        !owner?
    end
    def user?
        role == 'user'
    end
    def not_user?
        !user?
    end

    private

    #ダミーメールの生成
    def self.dummy_email(auth)
        "#{auth.uid}-#{auth.provider}@example.com"
    end

end
