<template lang="html">
  <div>
    <div class="ui">
      <div>
        <h2>Portfolio</h2>
        <div class="field">
          <label>Show</label>
          <select class="ui fluid dropdown">
            <option value="byexch">By Exch</option>
            <option value="qty">By qty</option>
            <option value="amnt_usd">By Amnt(USD)</option>
            <option value="amnt_btc">By Amnt(BTC)</option>
          </select>
        </div>
        <table class="ui structured table">
          <thead>
            <tr>
              <th>Coin</th>
              <th>% in<br/>fund</th>
              <th>Exch</th>
              <th>qty</th>
              <th>Amnt<br/>(USD)</th>
              <th>Amnt<br/>(BTC)</th>
              <th>Book<br/>Price</th>
              <th>UnRel<br/>P&amp;L</th>
              <th>24H<br/>chg(%)</th>
              <th>%<br/>Limit</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="item in portfolio" :key="item.coin">
              <td>{{item.coin}}</td>
              <td>{{item.per_fun}}</td>
              <td>{{item.exch}}</td>
              <td>{{item.qty}}</td>
              <td>{{item.amnt_usd}}</td>
              <td>{{item.amnt_btc}}</td>
              <td>{{item.book_price}}</td>
              <td>{{item.unreal}}</td>
              <td>{{item.chg}}</td>
              <td>{{item.per_limit}}</td>
            </tr>
          </tbody>
        </table>
      </div>
      <div>
        <h2>Order</h2>
        <div class="ui grid">
          <div class="eight wide column">
            <table class="ui orange structured table">
              <tbody>
                <tr>
                  <td colspan="2">
                    <div class="field">
                      <label>Exchange</label>
                      <select class="ui fluid dropdown">
                        <option value="binance">Binance</option>
                        <option value="binance">Binance</option>
                        <option value="binance">Binance</option>
                      </select>
                    </div>
                  </td>
                  <td colspan="2">
                    <div class="field">
                      <label>Market</label>
                      <select class="ui fluid dropdown">
                        <option value="btc">BTC</option>
                        <option value="btc">BTC</option>
                        <option value="btc">BTC</option>
                        <option value="btc">BTC</option>
                      </select>
                    </div>
                  </td>
                </tr>
                <tr>
                  <td colspan="2">Coin</td>
                  <td colspan="2">
                    <select class="ui fluid dropdown">
                      <option value="omg">OMG/BTC</option>
                      <option value="omg">OMG/BTC</option>
                      <option value="omg">OMG/BTC</option>
                    </select>
                  </td>
                </tr>
                <tr>
                  <td colspan="2">Buy or Sell</td>
                  <td class="negative">Buy</td>
                  <td>Sell</td>
                </tr>
                <tr>
                  <td colspan="2">Order Price</td>
                  <td colspan="2">9.8000</td>
                </tr>
                <tr>
                  <td colspan="2">Quantity</td>
                  <td>200</td>
                  <td><button class="ui orange fluid button">Buy</button></td>
                </tr>
                <tr>
                  <td colspan="2">Amount</td>
                  <td>200</td>
                  <td><button class="ui orange fluid button">Buy</button></td>
                </tr>
                <tr>
                  <td colspan="2">Proportion</td>
                  <td>200</td>
                  <td><button class="ui orange fluid button">Buy</button></td>
                </tr>
                <tr>
                  <td colspan="2">Target Proportion</td>
                  <td>200</td>
                  <td><button class="ui orange fluid button">Buy</button></td>
                </tr>
                <tr>
                  <td colspan="2">TWAP:hour</td>
                  <td>200</td>
                  <td rowspan="2"><button class="ui orange fluid button">Buy</button></td>
                </tr>
                <tr>
                  <td colspan="2">TWAP:limit price</td>
                  <td>200</td>
                </tr>
              </tbody>
            </table>
          </div>
          <div class="eight wide column">
            <table class="ui blue structured table">
              <tbody>
                <tr>
                  <td colspan="2">
                    <div class="field">
                      <label>Exchange</label>
                      <select class="ui fluid dropdown">
                        <option value="binance">Binance</option>
                        <option value="binance">Binance</option>
                        <option value="binance">Binance</option>
                      </select>
                    </div>
                  </td>
                  <td colspan="2">
                    <div class="field">
                      <label>Market</label>
                      <select class="ui fluid dropdown">
                        <option value="btc">BTC</option>
                        <option value="btc">BTC</option>
                        <option value="btc">BTC</option>
                        <option value="btc">BTC</option>
                      </select>
                    </div>
                  </td>
                </tr>
                <tr>
                  <td colspan="2">Coin</td>
                  <td colspan="2">
                    <select class="ui fluid dropdown">
                      <option value="omg">OMG/BTC</option>
                      <option value="omg">OMG/BTC</option>
                      <option value="omg">OMG/BTC</option>
                    </select>
                  </td>
                </tr>
                <tr>
                  <td colspan="2">Buy or Sell</td>
                  <td>Buy</td>
                  <td class="positive">Sell</td>
                </tr>
                <tr>
                  <td colspan="2">Order Price</td>
                  <td colspan="2">16.400</td>
                </tr>
                <tr>
                  <td colspan="2">Quantity</td>
                  <td>200</td>
                  <td><button class="ui blue fluid button">Buy</button></td>
                </tr>
                <tr>
                  <td colspan="2">Amount</td>
                  <td>5.0000</td>
                  <td><button class="ui blue fluid button">Buy</button></td>
                </tr>
                <tr>
                  <td colspan="2">Proportion</td>
                  <td>1%</td>
                  <td><button class="ui blue fluid button">Buy</button></td>
                </tr>
                <tr>
                  <td colspan="2">Target Proportion</td>
                  <td>2%</td>
                  <td><button class="ui blue fluid button">Buy</button></td>
                </tr>
                <tr>
                  <td colspan="2">TWAP:hour</td>
                  <td>2</td>
                  <td rowspan="2"><button class="ui blue fluid button">Buy</button></td>
                </tr>
                <tr>
                  <td colspan="2">TWAP:limit price</td>
                  <td>15.0000</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
        <div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Trading from '../../assets/trading.json'

export default {
  data: function () {
    return {
      portfolio: Trading
    }
  }
}
</script>

<style lang="css">
</style>
