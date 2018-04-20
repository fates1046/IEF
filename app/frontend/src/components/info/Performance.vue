<template lang="html">
  <div id="performance">
    <h1>IEF Total Performance</h1>
    <div id="performance-chart">
      <h3>Performance Chart</h3>
      <form class="ui form">
        <div class="two fields">
          <div class="field">
            <label>Period</label>
            <select class="ui fluid dropdown" v-model="period">
              <option value="5Y">5Y</option>
              <option value="3Y">3Y</option>
              <option value="1Y">1Y</option>
              <option value="3M">3M</option>
            </select>
          </div>
          <div class="field">
            <label>Base Currency</label>
            <select class="ui fluid dropdown" v-model="currency">
              <option value="USD">USD</option>
              <option value="USD">USD</option>
              <option value="USD">USD</option>
            </select>
          </div>
        </div>
      </form>
      <div>
        <performance-chart></performance-chart>
      </div>
    </div>
  </div>
</template>

<script>
import PerformanceChart from './chart/PerformanceChart.vue'
import scorelist from '../../assets/score.json'

export default {
  data: function () {
    return {
      period: '5Y',
      currency: 'USD',
      selectedManager: [],
      scorelist: scorelist,
      selectAll: false,
      selectedate: '2018-03',
      chartLabel: []
    }
  },
  methods: {
    select: function () {
      this.selectedManager = []
      if (!this.selectAll) {
        for (let i in this.scorelist) {
          this.selectedManager.push(this.scorelist[i].name)
        }
      }
    }
  },
  components: {
    PerformanceChart
  }
}
</script>

<style lang="css">
#performance {
  margin-top: 10px;
}
#score-table {
  text-align: center
}
</style>
