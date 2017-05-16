class Cal(object):
    _history = []
    def __init__(self,v1,v2):
        self.v1 = v1
        self.v2 = v2
    def add(self):
        result = self.v1+self.v2
        Cal._history.append("add:%d+%d=%d" % (self.v1, self.v2, result))
        return result
    def subtract(self):
        result = self.v1-self.v2
        Cal._history.append("subtract:%d-%d=%d" % (self.v1,self.v2,result))
        return result
    @classmethod
    def history(cls):
        for item in Cal._history:
            print(item)
class CalMultiply(Cal):
    def mutiply(self):
         result = self.v1*self.v2
         Cal._history.append("multiply:%d*%d=%d" % (self.v1,self.v2,result))
         return result
class CalDivice(CalMultiply):
    def devide(self):
        result = self.v1/self.v2
        Cal._history.append("devide:%d/%d=%d" % (self.v1,self.v2,result))
        return result

c1 = Cal(10,10)
print(c1.add())
print(c1.subtract())
# c1.v2 = 30
# c1.setV1('one')
print(c1.add())
print(c1.subtract())
Cal.history()

# c2 = Cal(30,20)
# print(c2.add())
# print(c2.subtract())
