class Repository
  def initialize(db)
    @db = db
  end

  def store(key, value)
    @db.store key, value
  end

  def fetch(key)
    @db.fetch key, nil
  end

  def delete(key)
    @db.delete(key)
  end
end
