pis = [1.1]
primes = [1]

for i in range(0,10000):
    p = Primes().unrank(10*i+5)
    E = EllipticCurve(GF(p),[0,0,0,-34^2,0])
    n = E.cardinality()
    pis.append(pis[i] * n/float(p))
    primes.append(p)
    #print str(p) + ' ' + str(pis[i])
    sys.stdout.write("\r%d%%" %i)
    sys.stdout.flush()

data = zip(primes, pis)
ndata = [(log(log(float(x))), log(pi)) for (x,pi) in data]

sys.stdout.write("\n")
sys.stdout.flush()


scatter_plot(ndata[1:], markersize=10).save('test-plot.pdf')
