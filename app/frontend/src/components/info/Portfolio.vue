<template lang="html">
  <div>
    <h1>IEF Total Portfolio</h1>
    <h2>Portfolio Composition</h2>
    <form class="ui form">
      <div class="three fields">
        <div class="field">
          <label>% / Asset</label>
          <select class="ui fluid dropdown">
            <option value="5Y">%</option>
            <option value="3Y">%</option>
            <option value="1Y">%</option>
            <option value="3M">%</option>
          </select>
        </div>
        <div class="field">
          <label>Period</label>
          <select class="ui fluid dropdown">
            <option value="5Y">5Y</option>
            <option value="3Y">3Y</option>
            <option value="1Y">1Y</option>
            <option value="3M">3M</option>
          </select>
        </div>
        <div class="field">
          <label>Base Currency</label>
          <select class="ui fluid dropdown">
            <option value="USD">USD</option>
            <option value="USD">USD</option>
            <option value="USD">USD</option>
          </select>
        </div>
      </div>
    </form>
    <portfolio-chart></portfolio-chart>
    <div class="ui grid">
      <div class="four wide column">
        <h2>Composition - Current</h2>
        <br /><br /><br />
        <composition-chart></composition-chart>
      </div>
      <div class="six wide column">
        <h2>Change</h2>
        <form class="ui form">
          <div class="field">
            <label>Period</label>
            <select class="ui fluid dropdown">
              <option value="5Y">5Y</option>
              <option value="3Y">3Y</option>
              <option value="1Y">1Y</option>
              <option value="3M">3M</option>
            </select>
          </div>
        </form>
        <change-chart></change-chart>
      </div>
      <div class="six wide column">
        <h2>P&amp;L</h2>
        <form class="ui form">
          <div class="two fields">
            <div class="field">
              <label>Period</label>
              <select class="ui fluid dropdown">
                <option value="5Y">5Y</option>
                <option value="3Y">3Y</option>
                <option value="1Y">1Y</option>
                <option value="3M">3M</option>
              </select>
            </div>
            <div class="field">
              <label>Base Currency</label>
              <select class="ui fluid dropdown">
                <option value="USD">USD</option>
                <option value="USD">USD</option>
                <option value="USD">USD</option>
              </select>
            </div>
          </div>
        </form>
        <table class="ui compact celled structured table" id="score-table">
          <thead>
            <tr>
              <th>Rank</th>
              <th>Coins</th>
              <th>M-0</th>
              <th>M-1</th>
              <th>M-2</th>
              <th>M-3</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(item, index) in pnl" :key="item.coin">
              <td>{{index+1}}</td>
              <td>{{item.coin}}</td>
              <td>{{item.m0}}</td>
              <td>{{item.m1}}</td>
              <td>{{item.m2}}</td>
              <td>{{item.m3}}</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</template>

<script>
import PortfolioChart from './chart/PortfolioChart.vue'
import CompositionChart from './chart/CompositionChart.vue'
import ChangeChart from './chart/ChangeChart.vue'
import PnlList from '../../assets/pnl.json'

export default {
  data: function () {
    return {
      pnl: PnlList
    }
  },
  components: {
    PortfolioChart,
    CompositionChart,
    ChangeChart
  }
}
</script>

<style lang="css">
</style>
