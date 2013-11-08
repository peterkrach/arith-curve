num_points = [1.1]
primes = [1]

for i in range(0,1000):
    p = Primes().unrank(10*i+5)
    E = EllipticCurve(GF(p),[0,0,0,-34^2,0])
    n = E.cardinality()
    num_points.append(n - p) 
    primes.append(p)
    sys.stdout.write("\r%d%%" %i)
    sys.stdout.flush()

data = zip(primes, pis)

d_plot = scatter_plot(data[1:], markersize=10)
f_plot = plot([2*sqrt(x), -2*sqrt(x)], (5,100000))
(d_plot + f_plot).save('../../../html/test-plot.pdf')
