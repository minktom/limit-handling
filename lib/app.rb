class App
  attr_reader :owner, :public

  def initialize(owner, public: false)
    @owner = owner
    @public = public
  end
end
