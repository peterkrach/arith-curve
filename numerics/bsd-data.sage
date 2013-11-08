E1_data = [1.0]
E2_data = [1.0]
E3_data = [1.0]
#E4_data = [1.0]

pis = [1.1]
primes = [1.1]

def ell_curve(p,d):
    return EllipticCurve(GF(p),[0,0,0,-d^2,0])

for i in range(0,2000):
    p = Primes().unrank(i+100)
    E1 = ell_curve(p,5) # rank one elliptic curve y^2=x^3-x
    E2 = ell_curve(p,34) # rank two
    E3 = ell_curve(p,1254) # rank three
    #E4 = ell_curve(p,29274) # rank four
    n1 = E1.cardinality()
    n2 = E2.cardinality()
    n3 = E3.cardinality()
    #n4 = E4.cardinality()
    E1_data.append(E1_data[-1] * n1 / p)  # x[-1] is last element in x
    E2_data.append(E2_data[-1] * n2 / p)
    E3_data.append(E3_data[-1] * n3 / p)
    #E4_data.append(E4_data[-1] * n4 / p)
    primes.append(log(long(p)))
    sys.stdout.write("\r%d" %i)
    sys.stdout.flush()

E1_primes = zip(primes, E1_data)
E2_primes = zip(primes, E2_data)
E3_primes = zip(primes, E3_data)
#E4_primes = zip(primes, E4_data)
E1_log_data = [(log(n_1), log(pi_1)) for (n_1,pi_1) in E1_primes]
E2_log_data = [(log(n_2), log(pi_2)) for (n_2,pi_2) in E2_primes]
E3_log_data = [(log(n_3), log(pi_3)) for (n_3,pi_3) in E3_primes]
#E4_log_data = [(log(n_4), log(pi_4)) for (n_4,pi_4) in E4_primes]
E1_plot = scatter_plot(E1_log_data[1:], markersize=2)
E2_plot = scatter_plot(E2_log_data[1:], markersize=2)
E3_plot = scatter_plot(E3_log_data[1:], markersize=2)
#E4_plot = scatter_plot(E4_log_data[1:], markersize=2)

x1_plot = plot(x, (x,0,2))
x2_plot = plot(2*x-0.5, (x,0,2))

#data_plot.save('test-plot.pdf')
(E1_plot + E2_plot + E3_plot).save('test-plot.pdf')
