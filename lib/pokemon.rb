require 'pry'
class Pokemon

    attr_accessor :id, :name, :type, :db

    def initialize(id:, name:, type:, db:)
        self.id = id
        self.name = name
        self.type = type
        self.db = db
    end

    def self.save(name, type, db)
       db.execute('INSERT INTO pokemon (name, type) VALUES (?, ?);', name, type)
    end

    def self.find(id, db)
        poke = db.execute('SELECT * FROM pokemon WHERE id = ?', id).flatten
        self.new(id: poke[0], name: poke[1], type: poke[2], db: db)
    end

end
