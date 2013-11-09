num_points = [1.0]
primes = [1]

for i in range(0,100):
    p = Primes().unrank(i+2)
    E = EllipticCurve(GF(p),[0,0,0,1,0])
    n = E.cardinality()
    num_points.append(p + 1 - n) 
    primes.append(p)
    sys.stdout.write("\r%d" % i)
    sys.stdout.flush()

data = zip(primes, num_points)

d_plot = scatter_plot(data[1:], markersize=5, title='Hasse data for $y^2=x^3+1$')
f_plot = plot([2*sqrt(x), -2*sqrt(x)], (5,1000))
(d_plot + f_plot).save('hasse-plot.pdf')
