ds = [5,34,1254,29274]
pis = [[1.0] for d in ds]
primes = [1.0 for d in ds]

#exit() # to abort

def ell_data(p,d):
    if 2*d % p == 0: # curve is singular
       return long(p)
    else:
       return long(EllipticCurve(GF(p),[0,0,0,-d^2,0]).cardinality())

for i in range(300):
    p = Primes().unrank(i)
    for j in range(len(ds)):
        pis[j].append(pis[j][-1] * ell_data(p,ds[j]) / p)
    primes.append(log(long(p)))
    sys.stdout.write("\r%d" % i)
    sys.stdout.flush()

ell_data = [zip(primes, pi) for pi in pis]
ell_log_data = [[(log(p),log(pi)) for (p,pi) in data] for data in ell_data]
p = sum([scatter_plot(e[1:], markersize=2) for e in ell_log_data])

p.save('test-plot.pdf')
