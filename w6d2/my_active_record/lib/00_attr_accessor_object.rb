class AttrAccessorObject
  def self.my_attr_accessor(*names)
    names.each do |inst_name|
      # for each name i want to make a getter and setter
      define_method(inst_name) do 
        instance_variable_get("@#{inst_name}")
      end

      define_method("#{inst_name}=") do |val|
        instance_variable_set("@#{inst_name}", val) 
      end


    end

  end
end
