require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database
    include Singleton

    def initialize
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true 
    end
end

class User
    attr_accessor :fname, :lname, :id
    def self.find_by_id(id)
        user = QuestionsDatabase.instance.execute(<<-SQL, id) 
            SELECT 
                *
            FROM
                users
            WHERE 
                id = ?
        SQL

        user.length <= 0 ? nil : User.new(user.first)
    end

    def self.find_by_name(fname, lname)
        user = QuestionsDatabase.instance.execute(<<-SQL, fname, lname) 
            SELECT 
                *
            FROM
                users
            WHERE 
                fname = ? AND lname = ?
        SQL
        user.length <= 0 ? nil : User.new(user.first)
    end

    def create
        raise "#{self} already in database" if @id

        QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
            INSERT INTO 
                users (fname, lname)
            VALUES
                (?, ?)
        SQL
        self.id = QuestionsDatabase.instance.last_insert_row_id
    end

    def self.all
        data = QuestionsDatabase.instance.execute('SELECT * FROM users')
        data.map {|datum| User.new(datum) }
    end

    def initialize(options)
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']
    end
end


class Question

end


