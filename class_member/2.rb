class Cs
    def Cs.class_method()
        p "Class Method"
    end
    def instance_method()
        p "Instance Method"
    end
end

i = Cs.new()

Cs.class_method()
i.instance_method()
