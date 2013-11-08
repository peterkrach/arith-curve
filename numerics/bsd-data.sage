import pickle

pis = [1.1]
primes = [1]

for i in range(0,100000):
    p = Primes().unrank(i+5)
    E = EllipticCurve(GF(p),[0,0,0,-5,0])
    n = E.cardinality()
    pis.append(n)  # x[-1] is last element in x
    primes.append(p)
    sys.stdout.write("\r%d" %i)
    sys.stdout.flush()

data = zip(primes, pis)
pickle.dump(data[1:], open('bsd-data.log', 'wb'))
#ndata = [(log(log(float(x))), log(pi)) for (x,pi) in data]

sys.stdout.write("\n")
sys.stdout.flush()

#d_plot = scatter_plot(ndata[1:], markersize=10).save('../../../html/test-plot.pdf')
#f_plot = plot([2*sqrt(x), -2*sqrt(x)], (5,100000))
#(d_plot + f_plot).save('../../../html/test-plot.pdf')
