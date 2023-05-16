import pandas as pd
from datetime import datetime as dt
import unittest


def Transform_data():
    parse_dates = ['date']
    data = pd.read_csv(r'C:\Users\Gisela\Documents\NacionServicios\dataset_ejercicio1.csv',sep=';', thousands=',',parse_dates=parse_dates, dtype = {'ID': int,'date': str,
    'shipping_cost': float,'total_order_cost': float, 'shipping_method': str , 'payment_method':str , 'destination_province' : str , 'origin_province' : str})
    data=data.drop(data[data['shipping_cost'] <= 0].index) 
    data=data.drop(data[data['date'] == 'faltante'].index)
    data['date'] = pd.to_datetime(data['date'], format='%d/%m/%Y').dt.strftime("%d-%m-%Y")
    data = data.rename(columns={"date": "dia_mes_anio"})
    data['orig_dest'] = data['origin_province'].map(str) + '-' + data['destination_province'].map(str)
    data = data.groupby(["dia_mes_anio", "orig_dest"]).agg(min=('shipping_cost', 'min'), max=('shipping_cost', 'max'), mean = ('shipping_cost', 'mean'))\
        .rename(columns={"min": "min_shipping_cost"}).rename(columns={"max": "max_shipping_cost"}).rename(columns={"mean": "avg_shipping_cost"})
    data = data.reset_index().to_json(orient='records')
    return (data)
df = pd.read_json(Transform_data())   

#Testing 

class Test(unittest.TestCase):
    def test_XXX(self):
        df = pd.read_json(Transform_data())   
        row = df[(df['dia_mes_anio'] == '21-07-2025') & (df['orig_dest'] == 'Capital Federal-Capital Federal')]
        self.assertTrue (len(row) == 1)
        self.assertTrue (len(row['min_shipping_cost'] == 290) == 1 )


def run_tests(l):
        for x in l:
            suite = unittest.TestLoader().loadTestsFromTestCase(x)
            runner = unittest.TextTestRunner(verbosity=2)
            runner.run(suite)

run_tests([Test])






