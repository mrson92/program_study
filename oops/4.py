class C(object):
    def __init__(self,v1):
        self.__value = v1
    def show(self):
        print(self.__value)

c1 = C(10)
# print(c1.__value)
c1.show()
