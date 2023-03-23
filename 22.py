import time
import os
import psutil
t_start = time.perf_counter()
pid=os.getpid()
python_process=psutil.Process(pid)
memoryUse = python_process.memory_info()[0]/2.**30
t_start = time.perf_counter()

class Pretty:
    start = open("input.txt")
    finish = open("output.txt", "w")
    n=0
    m=0
    def form_inf(self):
        t=self.start.readline().split(" ")
        self.n=int(t[0])
        self.m=int(t[1])
    def suitable(self,x,y):
        for i in range(len(x)):
            x[i] += y[i]
        for i in range(1, len(x)):
            if x[i] == 0 and x[i - 1] == 0:
                return False
            if x[i] == 2 and x[i - 1] == 2:
                return False
        return True
    def field(self,h):
        p = 2
        for i in range(1, h):
            p *= 2
        field = []
        for i in range(0, p):
            temp = bin(i)[2:]
            temp = temp[::-1]
            while len(temp) < h:
                temp += "0"
            arr = []
            for i in range(0, h):
                arr.append(int(temp[i]))
            field.append(arr)
        res=[]
        for i in field:
            res.append([])
            for j in field:
                if self.suitable(i[:],j[:]):
                    res[-1].append(1)
                else:
                    res[-1].append(0)
        print(res)
        return res
    def solve(self):
        self.form_inf()
        h=min(self.n,self.m)
        w=max(self.n,self.m)
        field=self.field(h)
        res = [1] * len(field)
        temp = [0] * len(field)
        for i in range(0,w - 1):
            for j in range(0,len(field)):
                for k in range(len(field[j])):
                    if field[j][k] == 1:
                        temp[j] += res[k]
            for j in range(0,len(field)):
                res[j]=temp[j]
            temp = [0] * len(field)
        self.finish.write(str(sum(res)))

p=Pretty()
p.solve()
t_finish=time.perf_counter()
print("Время работы: %s секунд " % (t_finish- t_start))
print('Использованная память:', memoryUse)