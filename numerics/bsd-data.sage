def ell_twist(p):
    return lambda d: EllipticCurve(GF(p),[0,0,0,-d^2,0])

ds =[1,5,34,1254,29274]
pis = [1.0,1.0,1.0,1.0,1.0]

file = open('sage-test-data.log', 'w')
file.write('#p N_p(E_1)  N_p(E_2)  ...\n\n')

for i in range(1,1000):
    p = Primes().unrank(50000*i)
    ell_curves = map(ell_twist(p), ds)
    num_points = [e.cardinality() for e in ell_curves]
    pis = [a*b/p for (a,b) in zip(num_points,pis)]
    print num_points
    print pis
    file.write(str(p) + ' ' + ' '.join(map(str,num_points)) + '\n')

file.close()
