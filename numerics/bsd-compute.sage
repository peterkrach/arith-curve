import pickle

data = pickle.load(open('bsd-data.log', 'rb'))

data = [(p, p-n) for (p,n) in data]

scatter_plot(data, markersize=5).save('../../../html/test-plot.pdf')
