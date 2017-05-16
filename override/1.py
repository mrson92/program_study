class C1:
    def m(self):
        return 'parent'

class C2(C1):
    def m(self):
        return super().m()+' child'
    # pass

# p = C1()
# print (p.m())

o = C2()
print (o.m())
