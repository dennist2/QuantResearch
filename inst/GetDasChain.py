import robin_stocks
import pandas
import datetime
import numpy
import time

robin_stocks.login("shotstoptiga@gmail.com","Pr3ppers1!")


def GetDasChain(sym,typec):
  try:
    symbol = str(sym)
  
    data = robin_stocks.options.find_tradable_options_for_stock(symbol, optionType=typec)
    df = pandas.DataFrame(data)
  
    testD = robin_stocks.options.find_options_for_stock_by_expiration(symbol=symbol,expirationDate='2020-07-02',optionType=typec, info=None)
    testD = pandas.DataFrame(testD)
  
    current = robin_stocks.stocks.get_latest_price(symbol)[0]
  
    if testD.size > 0:
      current = robin_stocks.stocks.get_latest_price(symbol)[0]
      data2 = robin_stocks.options.find_options_for_stock_by_expiration(symbol=symbol,expirationDate='2020-07-02',optionType=typec, info=None)
      lastdf = pandas.DataFrame(data2)
      cp = current
      pp = numpy.repeat(cp,[len(lastdf['chain_id'])], axis=0)
      lastdf['CurrentPrice'] = pp
      last = pandas.DataFrame(lastdf)
      return last
  
    else:
      print("No Chain")
      return None
      
  except TypeError:
    print('Type FOOKING ERROR')
    return None
  
