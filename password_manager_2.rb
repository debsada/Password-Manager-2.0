require "date"

class PasswordManager2
    def initialize
        @service_hash = {}
    end 

    def add(service, password)
            if (@service_hash.has_key?(service) == true)
                return "ERROR: Service names must be unique"
            end

            @keys = @service_hash.keys 
            @keys.each do |pass|
                temp = []
                if @service_hash[pass]["password"] == password
                    temp << true
                    if temp.any?(true)
                            return "ERROR: Passwords must be unique"
                    end
                end
            end
            date = DateTime.now.strftime("%d/%m/%Y")
            return @service_hash[service] = {"password" => password, "added_on" => Date.strptime(date, "%d/%m/%Y")}
    end

    def remove(service)
        @service_hash.delete(service)
    end

    def services()
        return @service_hash.keys
    end

    def update(service, new_password)

        @service_hash.keys.each do |pass|
            if @service_hash[pass]["password"] == new_password
                temp = []
                temp << true
                if temp.any?(true)
                    return @service_hash[service]["password"]
                end
            end
        end

        date = DateTime.now.strftime("%d/%m/%Y")
        return @service_hash[service] = {"password" => new_password, "added_on" => Date.strptime(date, "%d/%m/%Y")} 
    end

    def password_for(service)
        return @service_hash[service]["password"]
     end

    def sort_by(str)
        if str == "service"
            keys = @service_hash.keys
            keys.sort
        elsif str == "added_on"
            @service_hash.keys.sort_by{|k,v| @service_hash[k]["added_on"]}
        end
    end
       
end
